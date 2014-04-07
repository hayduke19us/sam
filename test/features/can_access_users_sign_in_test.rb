require "test_helper"

class CanAccessUsersSignInTest < Capybara::Rails::TestCase

  def setup
    visit new_user_session_path
  end

  test "sanity" do
    assert page.has_content?, "Sign in"
  end

  test "guardian log in view is visible" do
    assert page.has_content?("Guardian Authentication")
  end

  test "guard-login button is visible" do
    assert find("#guard-login").visible?
  end

  test "user-login div is not visible" do
    assert find("#login", visible: false)
  end

  test "when the login button is clicked it hides guard-login" do
    click_link('login')
    assert find("#guardian", visible: false)
  end

  test "when the login button clicked usr-login isnow visible" do
    click_link('login')
    assert find("#login", visible: true)
  end

end
