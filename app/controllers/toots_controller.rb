class TootsController < ApplicationController
  def index
    @toots = Toot.all
  end

  def show

  end

  def new
    @toot = Toot.new
  end

  def create
      @toot = Toot.new(toot_params)
  end

  private

  def toot_params
    params.require(:toot).permit(:author, :body)
  end

end
