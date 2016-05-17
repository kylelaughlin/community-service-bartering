class RatingsController < ApplicationController
  def new
    @rating = Rating.new
    @user = User.find(params[:request_user_id])
    @offer_user = User.find(params[:user_id])
    user_allowed?
  end

  def create
    @rating = Rating.new(ratings_params)
    if @rating.save
      redirect_to user_path(current_user), notice: "Rating Saved"
    else
      flash.now[:alert] = "Rating Not Saved"
      redirect_to user_path(current_user)
    end
  end

  private

  def ratings_params
    params.require(:rating).permit(:user_id, :rating)
  end
end
