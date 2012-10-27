class VenuesController < ApplicationController
  load_and_authorize_resource :except => [:show, :edit, :update]
  before_filter :load_and_authorize_venue, :only => [:edit, :update]

  def index
    @venues = Venue.all
  end

  def new
  end

  def create
    @venue = Venue.create(params[:venue])
    if @venue.save
      redirect_to venue_path(@venue), :notice => "Venue successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @venue.update_attributes(params[:venue])
      redirect_to venue_path(@venue), :notice => "Venue successfully updated"
    else
      render :edit
    end
  end

  def show
    @venue = Venue.find_by_slug!(params[:id])
  end

  private

  def load_and_authorize_venue
    @venue = Venue.find_by_slug!(params[:id])
    authorize! :update, @venue 
  end
end
