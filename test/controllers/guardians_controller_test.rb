require "test_helper"

class GuardiansControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  def setup
    @user = users(:franny)
    @guardian = guardians(:franny_dad)
  end

  test "all methods should return an instance of interactions" do
    sign_in :user, @user
    get :recent, format: :js, time: "day"
    assert assigns(:recent_interactions)
    assert_response :success
  end

end
