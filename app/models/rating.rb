# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  rating     :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rating < ActiveRecord::Base

end
