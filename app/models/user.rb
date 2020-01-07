class User < ActiveRecord::Base
	
	has_many :games
	has_many :wishlist
	has_secure_password

end