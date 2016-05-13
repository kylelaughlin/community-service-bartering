require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    @user = users(:default_user)
    login_user(user=@user, route=login_path)
    get :destroy
    assert_redirected_to root_path
  end

end
