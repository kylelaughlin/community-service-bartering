class RequestsController < ApplicationController

  skip_before_action :require_login, only: [:show]

  def new
    @request = Request.new
    user_allowed?
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
    @images = @request.request_images
  end

  def index
    @requests = Request.all
  end

  def edit
    @request = Request.find(params[:id])
    @user = @request.user
    user_allowed?
  end

  private

  def request_params
    params.require(:request).permit(:title, :description, :user_id)
  end

end
