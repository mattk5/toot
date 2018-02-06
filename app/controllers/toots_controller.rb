class TootsController < ApplicationController
  def index
    @toots = Toot.all 
  end

  def show

  end
end
