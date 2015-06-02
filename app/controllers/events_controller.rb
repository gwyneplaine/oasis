class EventsController < ApplicationController
  def new
    @event = Event.new
  end
  def index
    @events= Event.all
  end
  def show
    @event = Event.find params[:id]
  end

  def create
    @event = Event.create event_params
    imgFile = params[:event][:image]
    cloudObj = Cloudinary::Uploader.upload(imgFile.path)

    @event.image = cloudObj['url']
    @event.save

    redirect_to events_path
  end

  def edit
    @event = Event.find params[:id]
  end

  def update
    event = Event.find params[:id]
    event.update event_params

    imgFile = params[:event][:image]
    cloudObj = Cloudinary::Uploader.upload(imgFile.path)

    event.image = cloudObj['url']
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
