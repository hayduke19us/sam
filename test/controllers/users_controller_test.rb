require "test_helper"

class UsersControllerTest < ActionController::TestCase
  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

  test "should get create_profile" do
    get :create_profile
    assert_response :success
  end

  test "should get update_profile" do
    get :update_profile
    assert_response :success
  end

end
