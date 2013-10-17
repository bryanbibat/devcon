class VenuesController < ApplicationController
  load_resource :find_by => :slug
  load_and_authorize_resource :except => [:show, :edit, :update]

  def index
    @venues = Venue.order(:name)
  end

  def new
  end

  def create
    if @venue.save
      redirect_to venue_path(@venue), :notice => "Venue successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @venue.update_attributes(venue_params)
      redirect_to venue_path(@venue), :notice => "Venue successfully updated"
    else
      render :edit
    end
  end

  def show
  end

  private

    def venue_params
      params.require(:venue).permit(:address, :description, :latitude, :longitude, :name, :slug, :directions)
    end
end
