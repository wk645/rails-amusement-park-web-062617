class User < ActiveRecord::Base
	has_many :rides
	has_many :attractions, through: :rides

	# validates :name, presence: true
	# validates :password, presence: true
	# validates :happiness, presence: true
	# validates :nausea, presence: true
	# validates :height, presence: true
	# validates :tickets, presence: true

	has_secure_password

	attr_writer :mood

	def mood
		if self.nausea > self.happiness
			self.mood = "sad"
		else
			self.mood = "happy"
		end
	end

end
