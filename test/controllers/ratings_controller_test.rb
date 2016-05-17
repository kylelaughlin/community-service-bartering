require 'test_helper'

class RatingsControllerTest < ActionController::TestCase
  test "should get new" do
    @user = users(:default_user)
    login_user(user=@user, route=login_path)
    get :new, :user_id => @user.id
    assert_response :success
  end

end
