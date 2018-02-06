class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to toot_path
    else
      render :new
    end
  end

  private

    def users_params
      params.require(:user).permit(:username, :email, :name)
    end

end
