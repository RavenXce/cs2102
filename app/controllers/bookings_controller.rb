class BookingsController < ApplicationController
  def create
    if !user_signed_in?
      flash.alert = "Please log in to make a booking"
      redirect_to new_user_session_path
      return
    end
    flight_ids = params[:flight_ids].split(',')
    Booking.transaction do          
      begin # Generate new random booking reference      
        @new_reference = rand(10000000..99999999)
      end while !Booking.where(:id => @new_reference).blank?
      booking = current_user.bookings.create(:reference_id =>  @new_reference, :destination => params[:destination], :origin => params[:origin], :is_two_way => params[:is_two_way] )
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
  
  def index
    @bookings = current_user.bookings
  end
end
