class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new]
  
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if user
      login!(user)
      redirect_to cats_url
      # session[:session_token] = user.session_token
    else 
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
