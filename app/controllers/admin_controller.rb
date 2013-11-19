class AdminController < ApplicationController
  def bookings
    @bookings = Booking.all
  end
  
  def flights
    @flights = Flight.all
  end
end
