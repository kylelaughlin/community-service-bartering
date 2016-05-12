# == Schema Information
#
# Table name: requests
#
#  id                 :integer          not null, primary key
#  title              :string           not null
#  description        :text             not null
#  user_id            :integer          not null
#  accepted_bid_id    :integer
#  advertised_credits :integer
#  accepted_credits   :integer
#  completed          :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Request < ActiveRecord::Base
end
