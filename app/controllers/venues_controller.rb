class VenuesController < ApplicationController
  load_resource :find_by => :slug
  load_and_authorize_resource :except => [:show, :edit, :update]

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
  end

end
