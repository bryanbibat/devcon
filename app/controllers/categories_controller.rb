class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @categories = Category.paginate(:page => params[:page])
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      flash[:success] = 'Category has been created!'
      redirect_to @category
    else
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      flash[:success] = 'Category was successfully updated!'
      redirect_to @category
    else
      render :action => 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end
end
