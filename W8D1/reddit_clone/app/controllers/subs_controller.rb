class SubsController < ApplicationController
  before_action :require_signed_in!, only: [:new, :create, :update, :edit]

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.create(sub_params)
    @sub.user_id = current_user.id 
    if @sub.save
      redirect_to user_url(@sub.user_id) #also params[:user_id]
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def index
    @subs = Sub.all
    render :index
  end

  def edit #similar to new, edit existing by asserting what you are editing
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update #similar to create, updating existing sub, need id in routes
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url
    else
      render :edit
    end
  end

  def show
    @sub = Sub.find_by(id: params[:id]) #interchangeable, when fails find returns nil, find_by(params[:id]) LOUD
    render :show
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description, :user_id)
  end

end
