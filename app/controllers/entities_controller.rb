class EntitiesController < ApplicationController
  load_and_authorize_resource :except => [:show]

  def index
    @entities = Entity.all
  end

  def new
  end

  def create
    @entity = Entity.create(params[:entity])
    if @entity.save
      redirect_to entity_path(@entity), :notice => "Entity successfully created"
    else
      render :new
    end
  end

  def show
    @entity = Entity.find_by_slug!(params[:id])
  end
end
