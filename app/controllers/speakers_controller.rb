class SpeakersController < ApplicationController
  load_and_authorize_resource :except => [:show]

  def index
    @speakers = Speaker.all
  end

  def new
  end

  def create
    @speaker = Speaker.create(params[:speaker])
    if @speaker.save
      redirect_to speaker_path(@speaker), :notice => "Speaker successfully created"
    else
      render :new
    end
  end

  def show
    @speaker = Speaker.find_by_slug!(params[:id])
  end
end
