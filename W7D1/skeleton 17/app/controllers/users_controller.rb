class UsersController < ApplicationController
  before_action :require_logged_in, only: [:index]
  before_action :redirect_if_logged_in, [:new]

  def new
    @user = User.new
    # render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to user_url(@user.id)
    else
      render :new
    end
    
  end

  def user_params
    params.require(:user).permit(:user_name, :password_digest, :session_token)
  end
end
