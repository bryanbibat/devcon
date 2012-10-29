class CategoriesController < ApplicationController
  before_filter :paginate_categories, :only => :index
  load_resource :find_by => :slug
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
    if @category.save
      flash[:success] = 'Successfully created a category!'
      redirect_to @category
    else
      render 'new'
    end
  end

  def update
    if @category.update_attributes(params[:category])
      flash[:success] = 'Successfully updated category!'
      redirect_to @category
    else
      render :action => 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = 'Successfully destroyed category!'
    redirect_to categories_path
  end

  private

    def paginate_categories
      @categories = Category.paginate(:page => params[:page])
    end
end
