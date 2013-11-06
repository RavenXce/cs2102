class Booking < ActiveRecord::Base
   belongs_to :user
   has_many :airports # Destination and arrival airports 
   has_many :tickets
   has_many :flights, through: :tickets
   
   def origin_full
     airport = Airport.find_by_iata_code(self.origin)
     airport.full_string
   end
   
   def destination_full
     airport = Airport.find_by_iata_code(self.destination)
     airport.full_string
   end
end
