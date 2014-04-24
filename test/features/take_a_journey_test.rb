require "test_helper"

class TakeAJourneyTest < Capybara::Rails::TestCase
  include Warden::Test::Helpers
  Warden.test_mode!

  def setup
    @user = users(:franny)
    @guardian = guardians(:franny_dad)
    login_as(@user, :scope => :user)
    login_as(@guardian, :scope => :guardian)
    Capybara.current_driver = :selenium
    visit users_dashboard_path
    click_link("Dashboard")
  end

  def teardown
    Warden.test_reset!
  end

  test "when Take a Journey is pressed the journey-modal is present" do
    click_link("Take a Journey")
    assert find("#journey-modal")
    assert page.has_content?("Time to Travel")
    click_on("I'll do this later")
  end

  test "when the journey-modal form is filled out and submited a " do
    assert_equal 1, @user.journeys.count
    click_link("Take a Journey")
    fill_in "name", with: "My first journey"
    find("#distance_short").click
    click_button("Start your Journey")
    assert_equal 2, @user.journeys.count
  end

  test "when map options is clicked map-options are present" do
    click_link("Map Options")
    assert find("#map-controls")
  end
end
