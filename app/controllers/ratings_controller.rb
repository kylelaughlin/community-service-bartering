class RatingsController < ApplicationController
  def new
    @rating = Rating.new
    @user = User.find(params[:request_user_id])
    @offer_user = User.find(params[:user_id])
    user_allowed?
  end

  def create
    byebug
  end

  def show
  end

  private

  def ratings_params
    params.require(:rating).permit(:user_id, :rating)
  end
end
