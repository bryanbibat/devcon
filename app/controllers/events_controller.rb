class EventsController < ApplicationController
  load_resource :find_by => :slug
  load_and_authorize_resource :except => :index 

  def index
    @current_events = Event.current.include_subevents
    @previous_events = Event.finished.include_subevents.limit(5)
    @previous_event_count = Event.finished.include_subevents.count
    @events = Event.upcoming.include_subevents.paginate(:page => params[:page])
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
    @gmap_json = [@event.venue].to_gmaps4rails
  end

  def edit
  end

  def update
    if @event.update_attributes(params[:event])
      redirect_to event_path(@event), :notice => "Event successfully updated"
    else
      render :edit
    end
  end
end
