class FlightsController < ApplicationController
  
  def index
    
    respond_to do |format|
      
      format.json do
        page = params[:page].to_i
        limit = params[:rows].to_i
        sort_index = params[:sidx]
        sort_order = params[:sord]
        
        # calculate paging
        total_flights = Flight.count
        
        if(total_flights > 0 && limit > 0) then 
          total_pages = (total_flights.to_f/limit).ceil 
        else
          total_pages = 1
        end 
        page = total_pages if page > total_pages
        
        # calculate start position
        start = limit * (page-1)
        start = 0 if start < 0
        
        flights = Flight.order(sort_index + " " + sort_order).limit(limit).offset(start)
        result = {:page => page, :total => total_pages, :records => total_flights}
        rows = []
        flights.each do |f|
          rows << {:id => f.id, :cell => f.to_cell}
        end
        result[:rows] = rows
        render json: result
        return
      end
    
      format.html do
        if(!params.has_key?(:pax) || !params.has_key?(:two_way) || !params.has_key?(:from_airport) || !params.has_key(:to_airport)) then
          render 'index' and return
        end
        
        @results = []
        @pax = params[:pax]
        @two_way = params[:two_way]
        @two_way = @two_way == "true"
        @origin = params[:from_airport]
        @destination = params[:to_airport]
        @from_date = params[:from_date].to_datetime < DateTime.now ? DateTime.now : params[:from_date]
        @to_date = params[:to_date].to_datetime < DateTime.now ? DateTime.now : params[:to_date]
        
        if (@to_date < @from_date) then
          flash.alert = "Date range is invalid!"
          render 'index'
          return
        end
        
        flights_there = Flight.get_flights @from_date, @origin, @destination
        if !@two_way
          flights_there.each do |ft|
            next if ft.seats_left == 0
            result = Hash.new
            result[:away] = ft
            result[:total_price] = ft.price * @pax.to_f
            result[:seats_left] = ft.seats_left
            result[:airlines] = ft.airline     
            result[:flight_ids] = ft.id
            @results << result
          end
        else
          flights_back = Flight.get_flights @to_date, @destination, @origin
          flights_there.each do |ft|
            next if ft.seats_left == 0
            flights_back.each do |fb|
              next if fb.seats_left == 0
              result = Hash.new
              result[:away] = ft
              result[:back] = fb
              result[:total_price] = (ft.price + fb.price) * @pax.to_f
              result[:airlines] = ft.airline == fb.airline ?  ft.airline : ft.airline + "/" + fb.airline
              result[:seats_left] = [ft.seats_left,fb.seats_left].min
              result[:flight_ids] = [ft.id,fb.id].join(',')
              @results << result
            end
          end
        end
        render 'index'
      end
      
    end
    
  end
  
  # jqgrid is not RESTful
  def edit
    # TODO: ensure is admin
    operation = params[:oper]
    if operation == 'edit'
      update
    elsif operation == 'del'
      destroy
    elsif operation == 'add'
      create
    end    
  end
  
  private
  
  def create
    Flight.create(params.permit(:flight_number, :airline, :departure_gate, :arrival_gate,
     :departure_terminal, :arrival_terminal, :departure_time, :arrival_time, :price, :capacity,
     :departure_location, :arrival_location))
    render json: {:message => "Record created successfully."}, status: 200
  end
  
  def update
    id = params[:id]
    Flight.update(id, params.permit(:flight_number, :airline, :departure_gate, :arrival_gate,
     :departure_terminal, :arrival_terminal, :departure_time, :arrival_time, :price, :capacity))
    render json: {:message => "Record updated successfully."}, status: 200
  end
  
  def destroy
    Flight.destroy(params[:id])
    render json: {:message => "Record deleted."}, status: 200
  end
  
end
