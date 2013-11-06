class FlightsController < ApplicationController
  def index
  end

  def search
    @results = []
    @two_way = params[:two_way]
    @two_way = @two_way == "true"
    @origin = params[:from_airport]
    @destination = params[:to_airport]
    #TODO: ajoining flights!!
    flights_there = Flight.where(:departure_location => @origin, :arrival_location => @destination)
    flights_there = flights_there.where('departure_time >= :start and departure_time <= :end', :start => params[:from_date].to_date, :end => params[:from_date].to_date + 1.day)
    if !@two_way
      flights_there.each do |ft|
        result = Hash.new
        result[:away] = ft
        result[:total_price] = ft.price * params[:pax].to_f
        result[:airlines] = ft.airline        
        result[:flight_ids] = ft.id
        @results << result
      end
    else
      flights_back = Flight.where(:departure_location => @destination, :arrival_location => @origin)
      flights_back = flights_back.where('departure_time >= :start and departure_time <= :end', :start => params[:to_date].to_date, :end => params[:to_date].to_date + 1.day)
      flights_there.each do |ft|
        flights_back.each do |fb|
          result = Hash.new
          result[:away] = ft
          result[:back] = fb
          result[:total_price] = (ft.price + fb.price) * params[:pax].to_f
          result[:airlines] = ft.airline == fb.airline ?  ft.airline : ft.airline + "/" + fb.airline
          result[:flight_ids] = ([] << ft.id << fb.id).join(',')
          @results << result
        end
      end
    end
    render 'index'
  end
end
