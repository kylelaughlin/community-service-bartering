class OffersController < ApplicationController
  def new
    @offer = Offer.new
    @request = Request.find(params[:request_id])
  end

  def create
    @request = Request.find(params[:request_id])
    @offer = @request.offers.new(offer_params)
    if @offer.save
      redirect_to request_offer_path(@request, @offer), notice: "Offer Submitted Successfully"
    else
      flash.now[:alert] = "Offer Not Submitted"
      render :new
    end
  end

  def index
    @offers = Offer.all
  end

  def show
    @request = Request.find(params[:request_id])
    @offer = Offer.find(params[:id])
    @user = User.find(@offer.user_id)
    offer_permission?
  end

  def edit
    @request = Request.find(params[:request_id])
    @offer = Offer.find(params[:id])
    @user = @offer.user
    user_allowed?
  end

  def update
    @request = Request.find(params[:request_id])
    @offer = Offer.find(params[:id])
    if @offer.update_attributes(offer_params)
      redirect_to request_offer_path(@request, @offer), notice: "Offer Updated Successfully"
    else
      flash.now[:alert] = "Offer Not Updated"
      render :edit
    end
  end

  def destroy
    @request = Request.find(params[:request_id])
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to user_path(current_user.id)
  end

  def accepted
    @request = Request.find(params[:request_id])
    @offer = Offer.find(params[:id])
    @user = @request.user
    user_allowed?
    if @user.credit_check(@offer.proposed_hours)
      @offer.accepted_offer(@request)
      redirect_to request_path(@request), notice: "Offer Accepted"
    else
      flash.now[:alert] = "Not enough hour credits to accept this bid"
      @user = User.find(@offer.user_id)
      render :show
    end

  end

  private

  def offer_params
    params.require(:offer).permit(:proposed_hours, :explanation, :user_id)
  end

end
