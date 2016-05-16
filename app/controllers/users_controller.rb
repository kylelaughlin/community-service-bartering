class UsersController < ApplicationController

  skip_before_action :require_login, only: [:index, :new, :create]


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @requests = Request.where(user: @user)
    @offers = Offer.where(user: @user, completed: false).includes(:request)
    user_allowed?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    user_allowed?
  end

  def update
    @user = User.find(params[:id])
    user_allowed?
    if @user.update_attributes(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:avatar, :first_name, :last_name, :email, :password, :password_confirmation)
  end


end
