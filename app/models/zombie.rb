# == Schema Information
#
# Table name: zombies
#
#  id   :integer          not null, primary key
#  name :string(255)
#  age  :integer
#

class Zombie < ActiveRecord::Base

	before_save :make_rotting
	after_save :decomp_change, if: :decomp_changed?

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

	def as_json(options = nil)
		super(options ||
				{ include: :brain, except: [:created_at, :updated_at, :id] })
	end

	private
	def decomp_change_notification
		ZombieMailer.decomp_change(self).deliver
	end

end
