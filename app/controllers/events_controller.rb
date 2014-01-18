class EventsController < ApplicationController
  load_resource :find_by => :slug
  load_and_authorize_resource :except => [:index, :previous, :ics] 

  def index
    @current_events = Event.current.include_subevents
    @previous_events = Event.finished.include_subevents.limit(5)
    @previous_event_count = Event.finished.include_subevents.count
    @events = Event.upcoming.include_subevents.paginate(:page => params[:page])
  end

  def previous
    @previous_events = Event.previous_by_month
  end

  def new
  end

  def create
    if @event.save
      redirect_to event_path(@event), :notice => "Event successfully created"
    else
      render :new
    end
  end

  def show
    @hash = Gmaps4rails.build_markers(@event.venues) do |venue, marker|
      marker.lat venue.latitude
      marker.lng venue.longitude
      marker.infowindow render_to_string(:partial => "venues/infowindow", :layout => false, :locals => { :venue => venue })
      marker.json({ :id => venue.slug })
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(event_params)
      redirect_to event_path(@event), :notice => "Event successfully updated"
    else
      render :edit
    end
  end

  def ics
    send_data @event.icalendar(event_url(@event)), filename: "#{@event.name}.ics", type: 'text/calendar', x_sendfile: true
  end

  private

    def event_params
      params.require(:event).permit(:description, :description, :devcon_role, :end_at, :logo, :cover_photo,
        :name, :parent_id, :slug, :start_at, :venue_id, :summary, :schedule, :rules, 
        :registration, :event_type, :target_attendees, :actual_attendees)
    end

end
