class EntitiesController < ApplicationController
  load_and_authorize_resource :except => [:show, :edit, :update]
  before_filter :load_and_authorize_entity, :only => [:edit, :update]

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

  def edit
  end

  def update
    if @entity.update_attributes(params[:entity])
      redirect_to entity_path(@entity), :notice => "Entity successfully updated"
    else
      render :edit
    end
  end

  def show
    @entity = Entity.find_by_slug!(params[:id])
  end

  private

  def load_and_authorize_entity
    @entity = Entity.find_by_slug!(params[:id])
    authorize! :update, @entity 
  end

end
