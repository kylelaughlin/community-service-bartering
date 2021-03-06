class RequestsController < ApplicationController

  skip_before_action :require_login, only: [:show]

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      if params[:images]
        params[:images].each do |image|
          RequestImage.create(image: image, request: @request)
        end
      end
      redirect_to request_path(@request.id), notice: "Request Created"
    else
      flash.now[:alert] = "Request Not Created"
      render :new
    end
  end

  def show
    @request = Request.find(params[:id])
    @user = @request.user
    @offers = Offer.where(request_id: @request.id)
    @images = @request.request_images
    @rating = @user.rating_calculation
    if @request.accepted_offer_id
      @offer= Offer.find(@request.accepted_offer_id)
      @offer_user = @offer.user
    end
  end

  def index
    @requests = Request.search(params[:search])
  end

  def edit
    @request = Request.find(params[:id])
    @user = @request.user
    user_allowed?
  end

  def update
    @request = Request.find(params[:id])
    if @request.update_attributes(request_params)
      if params[:images]
        params[:images].each do |image|
          RequestImage.create(image: image, request: @request)
        end
      end
      redirect_to request_path(@request.id), notice: "Request Created"
    else
      flash.now[:alert] = "Request Not Created"
      render :edit
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to user_path(current_user.id)
  end

  def completed
    @request = Request.find(params[:id])
    @offer = Offer.find(@request.accepted_offer_id)
    @offer_user = @offer.user
    @request.completed_request(@offer, @offer_user, current_user)
    redirect_to new_user_rating_path(:request_user_id => current_user.id, :user_id => @offer_user.id), notice: "Request Completed"
  end

  private

  def request_params
    params.require(:request).permit(:title, :description, :user_id)
  end

end
