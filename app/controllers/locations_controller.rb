class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end
  def new
    @location = Location.new
  end

  def show
    @location = Location.find params[:id]
  end

  def create
    @location = Location.create location_params
    redirect_to locations_path
  end

  def edit
    @location = Location.find params[:id]
  end

  def update
    location = Location.find params[:id]
    location.update location_params
    redirect_to location
  end

  def destroy
    location = Location.find params[:id]
    location.destroy
    redirect_to locations_path
  end
  private 
  def location_params
    params.require(:location).permit(:name, :city, :postcode, :country, :state, :lat, :long)
  end
end
