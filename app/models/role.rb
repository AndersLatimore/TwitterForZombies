class Role < ActiveRecord::Base
	has_many :assigments
	has_many :zombies, through: :assigments
end