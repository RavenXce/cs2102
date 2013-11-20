class AdminController < ApplicationController
  before_filter :authenticate_admin!
  
  def bookings
    @bookings = Booking.all
  end
  
  def flights
    respond_to do |format|
      format.json { redirect_to flights_url(params) and return }
      format.html {}
    end 
  end
end
