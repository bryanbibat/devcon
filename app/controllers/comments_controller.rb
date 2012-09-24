class CommentsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]

  def index
    @commentable = find_commentable
    @comments = @commentable.comments

    if @commentable.respond_to? :title
      @title = @commentable.title
    end
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    unauthorized! if cannot? :create, @comment

    @comment.user = current_user
    if @comment.save
      flash[:success] = "Successfully submitted comment!"
      redirect_to :back
    else
      flash[:error] = "Failed to submit comment"
      redirect_to :back
    end
  end

  private

    def find_commentable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end
end
