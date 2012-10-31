class ResourcePeopleController < ApplicationController
  load_resource :find_by => :slug
  load_and_authorize_resource :except => [:show]

  def index
    @resource_people = ResourcePerson.all
  end

  def new
  end

  def create
    @resource_person = ResourcePerson.create(params[:resource_person])
    if @resource_person.save
      redirect_to resource_person_path(@resource_person), :notice => "Resource Person successfully created"
    else
      render :new
    end
  end

  def show
  end
end
