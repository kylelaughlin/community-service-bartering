# == Schema Information
#
# Table name: requests
#
#  id                 :integer          not null, primary key
#  title              :string           not null
#  description        :text             not null
#  user_id            :integer          not null
#  accepted_offer_id  :integer
#  advertised_credits :integer
#  accepted_credits   :integer
#  completed          :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Request < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :request_images, :dependent => :destroy
  has_many :offers, :dependent => :destroy

  default_scope {order('created_at DESC')}

  accepts_nested_attributes_for :request_images, :reject_if => lambda { |t| t['request_image'].nil? }

  # Facilitates the updating of records upon request completion
  #
  # +offer: an Offer object representing the offer that was accepted and completed
  # +offer_user: a User object representing the user who's offer was accepted and completed
  def completed_request(offer, offer_user, current_user)
    self.completed = true
    self.save
    current_user.credits -= self.accepted_credits
    current_user.save
    offer.completed = true
    offer.save
    offer_user.credits += self.accepted_credits
    offer_user.save
  end

end
