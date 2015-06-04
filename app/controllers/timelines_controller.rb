class TimelinesController < ApplicationController
  def index

  end

  def show
    @timeline = Timeline.find params[:id]
    gon.events = Event.all
    gon.timelineEvents = @timeline.events

    gon.timelineid = params[:id]
    # render :layout => true
  end

  def new
  end

  def create
  end

  def edit
    @event = Event.all 
  end

  def update
    @event = []
    @timeline = Timeline.find params[:id]
    @timeline.events << @event
  end

  def add_events
    timeline = Timeline.find params[:id]
    new_events = params[:events]
    rm_event = params[:deletedevents]
    new_events_array = []
    # binding.pry
    if rm_event
      timeline.events.delete(Event.find rm_event)
      render :json => {timelineEvents: t}
    elsif new_events.present?
      new_events.each do |id|
        event = Event.find id
        timelineEvents = timeline.events.where(:id => id)
        unless timelineEvents.present?
          timeline.events << event
          new_events_array << event
        end
      end

      timeline.save
      if new_events_array.any?
        render :json => { events: new_events_array }
      else
        render :json=>{ status: "These events are already in your timeline"}
      end
    end
  end

  def destroy
  end

  private
  def timeline_params
  end
end
