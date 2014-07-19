# == Schema Information
#
# Table name: brains
#
#  id         :integer          not null, primary key
#  zombie_id  :integer
#  status     :string(255)
#  flavor     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Brain < ActiveRecord::Base
	belongs_to :zombie
end
