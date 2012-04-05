class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.articles.build if user_signed_in?
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

  def destroy
  end
end
