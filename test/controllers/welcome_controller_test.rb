require "test_helper"

class WelcomeControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  def setup
    @user = users(:franny)
  end

  test "should get welcome#index" do
    get :index
    assert_response :success
  end

  test "should redirect_to users/dashboard" do
    sign_in :user, @user
    get :index
    assert_redirected_to users_dashboard_path
  end

end
