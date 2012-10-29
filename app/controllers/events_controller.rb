class EventsController < ApplicationController
  load_resource :find_by => :slug
  load_and_authorize_resource 

  def index
    @events = Event.where(:parent_id => nil).includes(:subevents)
  end

  def new
  end

  def create
    @event = Event.create(params[:event])
    if @event.save
      redirect_to event_path(@event), :notice => "Event successfully created"
    else
      render :new
    end
  end

  def show
  end
end
