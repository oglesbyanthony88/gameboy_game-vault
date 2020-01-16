class Game < ActiveRecord::Base
	belongs_to :user

	validates :gamename,  presence: true
end