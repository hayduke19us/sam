require "test_helper"

class ProfilesControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  test "create redirects us to dashboard on creation of profile" do
    user = users(:franny)
    sign_in :user, user
    post :create, religion: "christian"
    assert_redirected_to users_dashboard_path
  end

end
