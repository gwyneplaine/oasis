class TimelinesController < ApplicationController
  def index
  end

  def show
    @timeline = Timeline.find params[:id]
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def timeline_params
  end
end
