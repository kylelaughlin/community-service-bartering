class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
