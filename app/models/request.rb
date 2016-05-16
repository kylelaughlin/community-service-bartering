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
#  accepted_credits   :decimal(16, 2)
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

  accepts_nested_attributes_for :request_images, :reject_if => lambda { |t| t['request_image'].nil? }
end
