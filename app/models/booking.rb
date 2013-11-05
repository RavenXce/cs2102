class Booking < ActiveRecord::Base
   belongs_to :user
   has_many :airports # Destination and arrival airports 
   has_many :tickets
end
