# == Schema Information
#
# Table name: offers
#
#  id             :integer          not null, primary key
#  explanation    :text
#  proposed_hours :integer          not null
#  user_id        :integer          not null
#  request_id     :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  accepted       :boolean          default(FALSE)
#  completed      :boolean          default(FALSE)
#

class Offer < ActiveRecord::Base

  validates :proposed_hours, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :user_id, presence: true
  validates :request_id, presence: true

  belongs_to :request
  belongs_to :user

  # Updates fields when offer is accepted
  #
  # +request: a Request Object representing the request for which a bid was accepted
  def accepted_offer(request)
    self.accepted = true
    request.accepted_offer_id = self.id
    request.accepted_credits = self.proposed_hours
    self.save
    request.save
  end
end
