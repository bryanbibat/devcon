class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @articles = Article.paginate(:page => params[:page])
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.articles.build if user_signed_in?
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.build(params[:article])
    if @article.save
      flash[:success] = 'Article has been posted!'
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      flash[:success] = 'Article has been updated!'
      redirect_to @article
    else
      render :action => 'edit'
    end
  end

  def destroy
  end
end
