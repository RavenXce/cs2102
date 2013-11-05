# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
airportsPath = "#{Rails.root}/db/airports.json"
airports = JSON.parse(File.read(airportsPath))
airports.each_pair do |iata_code, airport|
  parsed = airport.slice(:name, :city, :country, :country_code)
  parsed[:iata_code] = iata_code
  Airport.create!(parsed)
end