class FlightsController < ApplicationController
  def index
  end

  def search
    @results = []
    @pax = params[:pax]
    @two_way = params[:two_way]
    @two_way = @two_way == "true"
    @origin = params[:from_airport]
    @destination = params[:to_airport]
    flights_there = Flight.get_flights params[:to_date], @origin, @destination
    if !@two_way
      flights_there.each do |ft|
        result = Hash.new
        result[:away] = ft
        result[:total_price] = ft.price * @pax.to_f
        result[:airlines] = ft.airline        
        result[:flight_ids] = ft.id
        @results << result
      end
    else
      flights_back = Flight.get_flights params[:to_date], @origin, @destination
      flights_there.each do |ft|
        flights_back.each do |fb|
          result = Hash.new
          result[:away] = ft
          result[:back] = fb
          result[:total_price] = (ft.price + fb.price) * @pax.to_f
          result[:airlines] = ft.airline == fb.airline ?  ft.airline : ft.airline + "/" + fb.airline
          result[:flight_ids] = ([] << ft.id << fb.id).join(',')
          @results << result
        end
      end
    end
    render 'index'
  end
end
