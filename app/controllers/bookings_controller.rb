class BookingsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @bookings = current_user.bookings
    @flights = []
    @bookings.each do |b|
      @flights << b.flights.distinct.to_a
    end
  end
  
  def create
    flight_ids = params[:flight_ids].split(',')
    Booking.transaction do          
      begin # Generate new random booking reference      
        @new_reference = rand(10000000..99999999)
      end while !Booking.where(:id => @new_reference).blank?
      booking = current_user.bookings.create(:reference_id =>  @new_reference, :destination => params[:destination], :origin => params[:origin], :is_two_way => params[:is_two_way], :price => params[:price] )
      # Create tickets
      flight_ids.each do |f|
        params[:pax].to_i.times do
          Ticket.create(:booking_id => booking.id, :flight_id => f) #TODO: seat and passenger?  
        end
      end
    end
    flash.notice = "Booking made!"
    redirect_to bookings_path
  end
  
  def destroy
    Booking.destroy(params[:id])
    flash.notice = "Booking cancelled."
    redirect_to bookings_path
  end
end
