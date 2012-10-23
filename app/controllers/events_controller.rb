class EventsController < ApplicationController
  load_and_authorize_resource :except => [:show]

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
    @event = Event.find_by_slug!(params[:id])
  end
end
