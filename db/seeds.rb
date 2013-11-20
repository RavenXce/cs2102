# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

class Hash
   def get_rand_pair
     key = self.keys[rand(self.length)]
     [key, self[key]]
   end
end

def rand_int(from, to)
  rand_in_range(from, to).to_i
end

def rand_price(from, to)
  rand_in_range(from, to).round(2)
end

def rand_in_range(from, to)
  rand * (to - from) + from
end

airportsPath = "#{Rails.root}/db/airports.json"
airlinesPath = "#{Rails.root}/db/airlines.json"
airports = JSON.parse(File.read(airportsPath))
airlines = JSON.parse(File.read(airlinesPath))

batch = []
airports.each_pair do |iata_code, airport|
  parsed = airport.slice("name", "city", "country", "country_code")
  parsed[:iata_code] = iata_code
  batch << Airport.new(parsed)
end
#Airport.import batch

100.times do
  batch = []
  1000.times do
    airline = airlines.get_rand_pair
    from = airports.get_rand_pair 
    begin
      to = airports.get_rand_pair
    end while from[0] == to[0] # make sure we have unique locations
    flight = Hash.new
    flight[:airline] = airline[0]
    flight[:flight_number] = airline[0] + "%04d" % rand_int(0,9999).to_s
    flight[:departure_location] = from[0]
    flight[:arrival_location] = to[0]
    flight[:departure_time] = rand(2.weeks).from_now
    flight[:arrival_time] = flight[:departure_time] + rand_int(60,720).minutes
    flight[:departure_gate] = (65 + rand(25)).chr + "%02d" % rand_int(1,99).to_s
    flight[:arrival_gate] = (65 + rand(25)).chr + "%02d" % rand_int(1,99).to_s
    flight[:departure_terminal] = rand_int(1,4)
    flight[:arrival_terminal] = rand_int(1,4)    
    flight[:price] = rand_price(98,5000)
    flight[:capacity] = rand_int(50,525)
    batch << Flight.new(flight)
  end
  Flight.import batch
end


