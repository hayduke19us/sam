require "test_helper"

class UsersControllerTest < ActionController::TestCase
  
  include Devise::TestHelpers

  def setup
    @user = users(:franny)
  end

  test "should be redirected to devise/sign_in" do
    get :dashboard
    assert_redirected_to new_user_session_path
  end

  test "should get dashboard when user is signed in" do
    sign_in :user, @user
    get :dashboard
    assert_response :success
  end

end
