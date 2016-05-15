# == Schema Information
#
# Table name: offers
#
#  id             :integer          not null, primary key
#  explanation    :text
#  proposed_hours :decimal(16, 2)   not null
#  user_id        :integer          not null
#  request_id     :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Offer < ActiveRecord::Base

  validates :proposed_hours, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :user_id, presence: true
  validates :request_id, presence: true
  
end
