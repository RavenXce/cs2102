class Trip
  #This class combines adjoining flights as a "Trip".  
  def initialize first, second = nil
    @flights = []
    @flights << first
    @flights << second if !second.nil?
  end
  
  def id
    flight_ids = []
    @flights.each {|f| flight_ids << f.id }
    flight_ids.join(',')
  end
  
  def airline
    airlines = []
    @flights.each {|f| airlines << f.airline }
    airlines.join('/')
  end  
  
  def price
    price = 0.0
    @flights.each {|f| price += f.price}
    price
  end
  
  def seats_left
    @flights.min_by(&:seats_left).seats_left
  end
  
  def arrival_time
    @flights.last.arrival_time
  end
  
  def departure_time
    @flights.first.departure_time
  end
  
  def arrival_location
    @flights.last.arrival_location
  end
  
  def departure_location
    @flights.first.departure_location
  end
  
  def adjoining?
    @flights.length > 1
  end
  
end