class CommentsController < ApplicationController
  before_filter :build_comment
  load_and_authorize_resource

  def create
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

    def build_comment
      @commentable = find_commentable
      @comment = @commentable.comments.build(params[:comment])
    end

    def find_commentable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end
end
