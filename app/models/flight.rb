class Flight < ActiveRecord::Base
  has_many :bookings, through: :tickets
  
  def arrival_location_full
    airport = Airport.find_by_iata_code(self.arrival_location)
    airport.full_string
  end
  
  def departure_location_full
    airport = Airport.find_by_iata_code(self.departure_location)
    airport.full_string
  end
    
end
