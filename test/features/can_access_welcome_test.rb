require "test_helper"

class CanAccessWelcomeTest < Capybara::Rails::TestCase

  test "first scope of view is wrapped with div.banner" do
    visit root_path
    assert within("div.banner") { page.has_content?('Pals') }
  end

  test "welcome parents-link is present" do
    visit root_path
    assert find('a#parents-link').visible?
  end

  test "log in and sign in are present" do
    visit root_path
    assert find('#sign-in').visible? 
  end

  test "five images are present" do
    visit root_path
    assert_equal 5, page.all("img").count
  end

  test "4 questions are present within symposiums" do
    visit root_path
    assert_equal 4, page.all("#symposium #question").count
  end

  test "8 answers are present within symposiums" do
    visit root_path
    assert_equal 8, page.all("#answer").count
  end

  test "8 locations are present within symposiums" do
    Capybara.default_driver = :selenium
    visit root_path
    Capybara.current_session.driver.browser.manage.window.resize_to(490, 800)
    assert_equal 8, page.all("#location").count
  end

  test "second scope of view is wrapped with div.dark-banner" do
    visit root_path
    assert within("div.dark-banner") { page.has_content?("How we keep your kids safe")}
  end

end
