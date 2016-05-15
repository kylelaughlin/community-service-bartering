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
  end

  def show
  end

  def edit
  end

  private

  def offer_params
    params.require(:offer).permit(:proposed_hours, :user_id)
  end

end
