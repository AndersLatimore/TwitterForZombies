class Zombie < ActiveRecord::Base

	before_save :make_rotting
	
 	def make_rotting
 		if age > 20
 			self.rotting = true
 		end
 	end

	scope :rotting, -> { where(rotting: true) }
	scope :fresh, where("age < 20")
	scope :recent, order("created_at_desc").limit(3)

	has_one :brain, dependent: :destroy
	has_many :assigments
	has_many :roles, through: :assigments

end
