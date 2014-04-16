require "test_helper"

class UsersControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  def setup
    @user = users(:franny)
    @guardian = guardians(:franny_dad)
  end

  test "should be redirected to devise/sign_in" do
    get :dashboard
    assert_redirected_to new_user_session_path
  end

  test "should get dashboard when user and guardian are logged in" do
    sign_in :user, @user
    sign_in :guardian, @guardian
    get :dashboard
    assert_response :success
  end

end
