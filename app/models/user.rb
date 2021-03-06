# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  email               :string           not null
#  crypted_password    :string
#  salt                :string
#  created_at          :datetime
#  updated_at          :datetime
#  first_name          :string           not null
#  last_name           :string           not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  credits             :integer          default(0)
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ActiveRecord::Base
  #Sorcery Authentification
  authenticates_with_sorcery!

  # Validates password length and confirmation
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  #database validations
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :requests
  has_many :offers

  # Attached file through paperclip with AWS S3 storage
  has_attached_file :avatar,
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/images/:style/missing.png",
                    storage: :s3,
                    s3_credentials: {access_key_id: ENV["AWS_ACCESS_KEY_ID"],
                                     secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]},
                    bucket: ENV["S3_BUCKET_NAME"]

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # Checks that a user has enough time credits to accept an offers
  #
  # +proposed_hours: an integer representing the number of time credits for an offers
  #
  # Returns a boolean, true if the user has enough time credits, otherwise false
  def credit_check(proposed_hours)
    credits >= proposed_hours
  end

  # Calculates the average rating for a user rounded to nearest integer
  #
  # Returns an integer representing the users average rating
  def rating_calculation
    ratings_collection = Rating.where(user_id: self.id)
    average = -1
    if !ratings_collection.empty?
      sum = 0
      ratings_collection.each do |r|
        sum += r.rating
      end
      average = (sum.to_f / ratings_collection.count).round
    end
    average
  end

end
