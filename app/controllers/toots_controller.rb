class TootsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def index
    @toot = Toot.new
    @toots = Toot.all
  end

  def create
    @toot = current_user.toots.build(toot_params)

    if @toot.save
      flash[:notice] = 'Toot created!!'
      redirect_to root_url
    else
      flash[:error] = 'Toot too long!!'
      redirect_to root_url
    end
  end

  def show
    @toot = Toot.find(params[:id])
    @comments = @toot.comments.includes(:user)
  end

  private

    def toot_params
      params.require(:toot).permit(:author, :body)
    end

end
