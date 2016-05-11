require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    @user = users(:default_user)
    login_user(user=@user, route=login_path)
    get :show, {"id" => @user.id}
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    @user = users(:default_user)
    login_user(user=@user, route=login_path)
    get :edit, {"id" => @user.id}
    assert_response :success
  end

  test "should get update" do
    @user = users(:default_user)
    login_user(user=@user, route=login_path)
    patch :update, id: @user.id, user: {email: "test@test.com"}
    assert_redirected_to user_path(@user.id)
  end

end
