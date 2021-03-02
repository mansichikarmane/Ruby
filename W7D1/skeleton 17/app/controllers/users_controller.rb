class UsersController < ApplicationController
  before_action :require_no_user!

  def new
    @user = User.new
    # render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to cats_url
    else
      render :new
    end
    
  end

  def user_params
    params.require(:user).permit(:user_name, :password_digest, :session_token)
  end
end
