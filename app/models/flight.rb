class Flight < ActiveRecord::Base
  has_many :tickets, dependent: :destroy
  has_many :bookings, through: :tickets
  
  def arrival_location_full
    airport = Airport.find_by_iata_code(self.arrival_location)
    airport.full_string
  end
  
  def departure_location_full
    airport = Airport.find_by_iata_code(self.departure_location)
    airport.full_string
  end
  
  def seats_left
    self.capacity - Ticket.where(flight_id: self.id).count
  end
  
  def self.get_direct_flights date, origin, destination = nil
    start_time = destination.nil? || date.to_date == Date.today ? date.to_date : date # exact start_time if checking for adjoining or today
    end_time = date.to_date + 1.day
    flights = Flight.where(:departure_location => origin)
                    .where('departure_time >= :start and departure_time <= :end',
                      :start => start_time, :end => end_time)
    if !destination.nil?
      flights = flights.where(:arrival_location => destination)
    end
    flights
  end
  
  def self.get_flights date, origin, destination
    adjoining_flights = []
    first_flight = Flight.get_direct_flights date, origin
    first_flight.each do |ff|
      if ff.arrival_location == destination then
        adjoining_flights << (Trip.new ff)
        next
      end
      second_flight = Flight.get_direct_flights ff.arrival_time, ff.arrival_location, destination
      second_flight.each do |sf|
        adjoining_flights << (Trip.new ff, sf) #adjoining flights
      end
    end
    adjoining_flights
  end
  
end
