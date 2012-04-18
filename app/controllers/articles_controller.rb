class ArticlesController < ApplicationController
  before_filter :paginate_articles, :only => :index
  load_and_authorize_resource

  def index
  end

  def show
    @comment = @article.comments.build
    @comments = @article.comments.paginate(:page => params[:page])
  end

  def new
  end

  def edit
  end

  def create
    @article.author = current_user
    if @article.save
      flash[:success] = 'Successfully published an article.'
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    params[:article][:category_ids] ||= []

    if @article.update_attributes(params[:article])
      flash[:success] = 'Article has been updated!'
      redirect_to @article
    else
      render :action => 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = 'Successfully destroyed article'
    redirect_to articles_path
  end

  private

    def paginate_articles
      @articles = Article.paginate(:page => params[:page])
    end
end
