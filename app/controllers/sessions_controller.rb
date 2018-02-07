class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user 
    else
      flash.now[:danger] = 'Wrong Username/Password'
      render 'new'
    end
  end
end
