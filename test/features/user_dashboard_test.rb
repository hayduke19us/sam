require "test_helper"

class UserDashboardTest < Capybara::Rails::TestCase
  include Warden::Test::Helpers
  Warden.test_mode!

  def setup
    @user = users(:franny)
    @guardian = guardians(:franny_dad)
    login_as(@user, :scope => :user)
    login_as(@guardian, :scope => :guardian)
    visit users_dashboard_path
  end

  def teardown
    Warden.test_reset!
  end

  test "dashboard sanity" do
    assert page.has_content?("Dashboard")
  end

  test "dashboard has a pinup map within a map wrapper" do
    assert within("#map-wrapper") { page.find("#user-map") }
  end

end
