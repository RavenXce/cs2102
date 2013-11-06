class FlightsController < ApplicationController
  def index
    @results = []
    @two_way = true
  end
  
  def search
    @results = []
    @two_way = params[:two_way]
    #airport_here = Airport.where("name like ? or country like ? or city like ? or country_code like ? or iata_code like ?", "%#{params[:fromAirport]}%")
    #airport_there = Airport.where("name like ? or country like ? or city like ? or country_code like ? or iata_code like ?", "%#{params[:toAirport]}%")
    #TODO: ajoining flights
    flights_there = Flight.where(:departure_location => params[:from_airport], :arrival_location => params[:to_airport])
    flights_there = flights_there.where('departure_time >= :start and departure_time <= :end', :start => params[:from_date].to_date, :end => params[:from_date].to_date + 1.day)
    flights_back = Flight.where(:departure_location => params[:to_airport], :arrival_location => params[:from_airport])
    flights_back = flights_back.where('departure_time >= :start and departure_time <= :end', :start => params[:to_date].to_date, :end => params[:to_date].to_date + 1.day)
    puts flights_there.to_sql
    puts flights_back.to_sql
    flights_there.each do |ft|
      flights_back.each do |fb|
        result = Hash.new
        result[:away] = ft
        result[:back] = fb
        result[:total_price] = (ft.price + fb.price) * params[:pax].to_f
        result[:airlines] = ft.airline == fb.airline ?  ft.airline : ft.airline + "/" + fb.airline
        @results << result
      end
    end
    render 'index'
  end
end
