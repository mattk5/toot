class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create]
  before_action :find_commentable

  def create
    @comment = @commentable.comments.new(comment_params)

    if @comment.save
      flash[:success] = "Comment added!"
      redirect_to @comment.toot
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_commentable
      @commentable = Toot.find_by_id(params[:toot_id]) if params[:toot_id]
      @commentable = User.find_by_id(params[:user_id]) if params[:user_id]
    end
end
