require 'test_helper'

class OffersControllerTest < ActionController::TestCase
  test "should get new" do
    @user = users(:default_user)
    login_user(user=@user, route=login_path)
    @default_request = requests(:default_request)
    get :new, :request_id => @default_request.id
    assert_response :success
  end

  test "should get index" do
    @default_request = requests(:default_request)
    @default_offer = offers(:default_offer)
    get :index, :request_id => @default_request.id
    assert_response :success
  end

  test "should get show" do
    @user = users(:default_user)
    login_user(user=@user, route=login_path)
    @default_request = requests(:default_request)
    @default_offer = offers(:default_offer)
    get :show, :request_id => @default_request.id, :id => @default_offer.id
    assert_response :success
  end

  test "should get edit" do
    @user = users(:default_user)
    login_user(user=@user, route=login_path)
    @default_request = requests(:default_request)
    @default_offer = offers(:default_offer)
    get :edit, :request_id => @default_request.id, :id => @default_offer.id
    assert_response :success
  end

end
