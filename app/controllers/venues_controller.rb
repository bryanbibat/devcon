class VenuesController < ApplicationController
  load_and_authorize_resource :except => [:show]

  def index
    @venues = Venue.all
  end

  def new
  end

  def create
    @venue = Venue.create(params[:venue])
    if @venue.save
      redirect_to venue_path(@venue), "Venue successfully created"
    else
      render :new
    end
  end

  def show
    @venue = Venue.find_by_slug!(params[:id])
  end
end
