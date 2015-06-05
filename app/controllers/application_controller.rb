class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate
  private
  def get_location location
    g_location = Geocoder.address(location)
    # g_location_h = Geocoder.search(@location).first.geometry['location']
    if Location.where(:address => g_location).present?
      locationObj = Location.find_by(:address => g_location)
      locationObj.id
    else
      new_location_obj = Location.create :name => g_location, :address => g_location
      new_location_obj.id
    end
  end
  def authenticate
	@current_user = User.find session[:user_id] if session[:user_id]
  end    
  def get_user_location location
    user = User.find session[:user_id]
    user.location_id = get_location(location)
  end
end
