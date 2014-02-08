class Guest < ActiveRecord::Base
	has_secure_password
	has_many :reservations
	has_many :restuarants, :through => :reservations
end
