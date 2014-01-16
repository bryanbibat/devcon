class ResourcePeopleController < ApplicationController
  load_resource :find_by => :slug
  load_and_authorize_resource :except => [:show]

  def index
    @resource_people = ResourcePerson.all
  end

  def new
  end

  def create
    @resource_person = ResourcePerson.create(resource_person_params)
    if @resource_person.save
      redirect_to resource_person_path(@resource_person), :notice => "Resource Person successfully created"
    else
      render :new
    end
  end

  def show
  end

  private

    def resource_person_params
      params.require(:resource_person).permit(:description, :main_title, :thumbnail, :name, :description)
    end
end
