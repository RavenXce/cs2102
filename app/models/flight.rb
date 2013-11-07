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
  
  def self.get_direct_flights date, origin, destination = nil
    flights = Flight.where(:departure_location => origin)
                    .where('departure_time >= :start and departure_time <= :end',
                      :start => date.to_date, :end => date.to_date + 1.day)
    #flights = flights.where(:arrival_location => destination) if !destination.nil?
  end
  
  def self.get_flights date, origin, destination
    ajoining_flights = []
    first_flight = Flight.get_direct_flights date, origin
    first_flight.each do |ff|
      if ff.arrival_location == destination then
        ajoining_flights << (Trip.new ff)        
        next
      end
      second_flight = Flight.get_direct_flights date, ff.arrival_location, destination
      second_flight.each do |sf|
        ajoining_flights << (Trip.new ff, sf) #ajoining flights
      end
    end
    ajoining_flights
  end
  
end
