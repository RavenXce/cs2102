class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def authenticate_admin!
    if !current_user.try(:admin?)
      flash.alert = "Unauthorized Access"
      redirect_to default_url
    end
  end
end
