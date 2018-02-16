class UsersController < ApplicationController
  before_action  :logged_in_user, only: [:index, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)

    if @user.save
      log_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def users_params
      params.require(:user).permit(:username, :email, :name, :password, :password_confirmation)
    end

end
