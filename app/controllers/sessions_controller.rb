class SessionsController < ApplicationController
  
  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:target_url] || tests_path
      session[:target_url] = nil
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password, please'
      render :new
    end
  end
  
  def logout
    session[:user_id] = nil if logged_in?
    redirect_to root_path
  end
end
