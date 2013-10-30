class TagsController < ApplicationController
  before_filter :paginate_tags, :only => :index
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @tag.save
      flash[:success] = 'Successfully created a tag!'
      redirect_to @tag
    else
      render 'new'
    end
  end

  def update
    if @tag.update_attributes(tag_params)
      flash[:success] = 'Successfully updated tag!'
      redirect_to @tag
    else
      render :action => 'edit'
    end
  end

  def destroy
    @tag.destroy
    flash[:notice] = 'Successfully destroyed tag!'
    redirect_to tags_path
  end

  private

    def paginate_tags
      @tags = Tag.paginate(:page => params[:page])
    end

    def tag_params
      params.require(:tag).permit(:description, :name)
    end
end
