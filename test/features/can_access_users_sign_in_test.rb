require "test_helper"

class CanAccessUsersSignInTest < Capybara::Rails::TestCase

  def setup
    visit new_user_session_path
  end

  test "Log in title is present" do
    assert page.has_content? "Log In"
  end

  test "user log in form is visible" do
    assert page.has_content?, "form#new_user"
  end

  test "the globe is present" do
    assert page.find("img", visible: true)
  end

end

class LogInMobileVersion < Capybara::Rails::TestCase 

  def setup
    view MOBILE_P
    visit new_user_session_path
  end

  test "the globe is hidden" do
    assert page.find("img", visible: false)
  end

end
