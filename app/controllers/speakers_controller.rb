class SpeakersController < ApplicationController
  load_resource :find_by => :slug
  load_and_authorize_resource :except => [:show]

  def index
    @speakers = Speaker.all
  end

  def new
  end

  def create
    if @speaker.save
      redirect_to speaker_path(@speaker), :notice => "Speaker successfully created"
    else
      render :new
    end
  end

  def show
  end

  private

    def speaker_params
      params.require(:speaker).permit(:description, :name, :slug)
    end
end
