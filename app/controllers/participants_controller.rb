class ParticipantsController < ApplicationController
  before_filter :load_parent

  def new
    @participant = @event.participants.build
  end

  def create
    @participant = @event.participants.build(params[:participant])
    if @participant.save
      redirect_to event_path(@event), :notice => "Participant successfully added"
    else
      render :new
    end
  end

  def edit
    @participant = @event.participants.find(params[:id])
  end

  def update
    @participant = @event.participants.find(params[:id])
    if @participant.update_attributes(params[:participant])
      redirect_to event_path(@event), :notice => "Participant successfully updated"
    else
      render :edit
    end
  end

  private

  def load_parent
    @event = Event.find_by_slug!(params[:event_id])
    authorize! :edit, @event
  end
end
