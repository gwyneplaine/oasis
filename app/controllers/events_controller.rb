class EventsController < ApplicationController
  def new
    if session[:user_id]
      @event = Event.new
    else
      redirect_to root_path
    end
  end

  def index 
    if session[:user_id]
    @user = User.find session[:user_id]
    @locations = @user.location.nearbys
    end
    @events=Event.all
    # render :layout => !request.xhr?
  end

  def show
    @event = Event.find params[:id]
  end

  def create
    @user_location = @current_user.location
    #Define the location of the event
    @location = params[:event][:address]

    #Create the new event based on form parameters
    @event = Event.create event_params

    #Give the event a location_id based on inputted address
    @event.location_id = get_location @location

    # Check if a file has been uploaded, 
    # If so upload to cloudinary and 
    # return a url to be used as the event image

    imgFile = params[:event][:image]
    if imgFile
      cloudObj = Cloudinary::Uploader.upload(imgFile.path) 
      @event.image = cloudObj['url']
    end

    #Assign a user to the event
    current_user = User.find session[:user_id]
    @event.users << current_user 
    @event[:address] = @location
    @event.save

    #Assign this event to the users timeline
    timeline = current_user.timeline
    timeline.events << @event
    timeline.save

    redirect_to events_path
  end

  def edit
    @event = Event.find params[:id]
  end

  def update
    event = Event.find params[:id]
    event.update event_params
    @location = params[:event][:address]
    event[:address] = @location
    event.location_id = get_location @location
    imgFile = params[:event][:image]
    if imgFile
    cloudObj = Cloudinary::Uploader.upload(imgFile.path)
    event.image = cloudObj['url']
    end
    event.save
    redirect_to event
  end

  def destroy
    event = Event.find params[:id]
    event.destroy
    redirect_to events_path
  end

  private 

  def event_params
    params.require(:event).permit(:name, :date, :start_time, :end_time, :description)
  end
end
