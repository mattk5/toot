class TootsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def index
    @toot = Toot.new
    # @feed_toots = current_user.feed.paginate(page: params[:page])
    @toots = Toot.all 
  end

  def create
    @toot = current_user.toots.build(toot_params)
    if @toot.save
      flash[:success] = "Toot posted!!"
      redirect_to root_url
    else
      render root_url
    end
  end

  def show

  end



  private

  def toot_params
    params.require(:toot).permit(:author, :body)
  end

end
