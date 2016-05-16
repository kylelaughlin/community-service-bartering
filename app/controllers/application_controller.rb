class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login


  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end

  def user_allowed?
    if @user != current_user
      redirect_to user_path(session[:user_id]), alert: "Can't Edit Others Stuff"
    end
  end

  def offer_permission?
    if @user != current_user && @request.user != current_user
      redirect_to user_path(session[:user_id]), alert: "You don't have access to other's offers"
    end
  end

end
