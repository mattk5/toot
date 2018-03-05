class CommentsController < ApplicationController
  # before_action :logged_in_user, only: [:create]
  before_action :find_toot


  def create
    @comment = @toot.comments.create(comment_params)

    if @comment.save
      flash[:success] = "Comment added!"
      redirect_to toot_path(@toot)
    else
      render toot_path(@toot)
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_toot
      @toot = Toot.find(params[:toot_id])
    end
end
