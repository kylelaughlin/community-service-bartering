require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  test "should get new" do
    @user = users(:default_user)
    login_user(user=@user, route=login_path)
    get :new
    assert_response :success
  end

  test "should get show" do
    @default_request = requests(:default_request)
    get :show, {"id" => @default_request.id}
    assert_response :success
  end

  test "should get index" do
    @user = users(:default_user)
    login_user(user=@user, route=login_path)
    get :index
    assert_response :success
  end

  test "should get edit" do
    @default_request = requests(:default_request)
    @user = users(:default_user)
    login_user(user=@user, route=login_path)
    get :edit, {"id" => @default_request.id}
    assert_response :success
  end

  test "should get update" do
    @default_request = requests(:default_request)
    @user = users(:default_user)
    login_user(user=@user, route=login_path)
    patch :update, id: @default_request.id, request: {title: "New Title"}
    assert_redirected_to request_path(@default_request.id)
  end

end
