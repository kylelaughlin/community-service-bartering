class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    byebug
    @request = Request.new(request_params)
    if @request.save
      redirect_to request_path(@request.id), notice: "Request Created"
    else
      flash.now[:alert] = "Request Not Created"
      render :new
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  def index
    @request.all
  end

  def edit
  end

  private

  def request_params
    params.require(:request).permit(:title, :description, :user_id)
  end

end
