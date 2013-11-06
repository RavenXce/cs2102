class BookingsController < ApplicationController  
  def create
    user_signed_in?
    flash.alert = "Please log in to make a booking"
    redirect_to new_user_session_path
  end
end
