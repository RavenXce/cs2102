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
  
  def self.get_flights date, origin, destination = nil
    flights = Flight.where('departure_time >= :start and departure_time <= :end',
                      :start => date.to_date, :end => date.to_date + 1.day)
                    .where(:departure_location => origin)
    flights = flights.where(:arrival_location => destination) if !destination.nil?
  end
  
  def self.ajoining_flights date, origin, destination
    first_flight = Flight.get_flights date, origin
    # loop and find 2nd flight and put into arrayd
  end
  
end
