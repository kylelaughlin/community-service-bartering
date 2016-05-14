class RequestsController < ApplicationController
  def new
    @request = Request.new
    3.times {@request.request_images.build}
  end

  def create
    byebug
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
    @images = @request.request_images
  end

  def index
    @requests = Request.all
  end

  def edit
    @request.Request.find[:id]
    3.times {@request.request_images.build}
  end

  private

  def request_params
    params.require(:request).permit(:title, :description, :user_id)
  end

end
