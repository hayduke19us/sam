require "test_helper"

class CanAccessWelcomeTest < Capybara::Rails::TestCase

  def setup
    visit root_path
  end

  test "first scope of view is wrapped with div.banner" do
    assert within("div.banner") { page.has_content?('Pals') }
  end

  test "welcome parents-link is present" do
    assert find('a#parents-link').visible?
  end

  test "log in and sign in are present" do
    assert find('#sign-in').visible?
  end

  test "five images are present" do
    assert_equal 5, page.all("img").count
  end

  test "4 questions are present within symposiums" do
    assert_equal 4, page.all("#symposium #question").count
  end

  test "8 answers are present within symposiums" do
    assert_equal 8, page.all("#answer").count
  end

  test "8 locations are present within symposiums" do
    assert_equal 8, page.all("#location").count
  end

  test "second scope of view is wrapped with div.dark-banner" do
    assert within("div.dark-banner") { page.has_content?("How we keep your kids safe")}
  end

end

#mobile ----------------------

class MobileVersion < Capybara::Rails::TestCase

  def setup
    view MOBILE_P
    visit root_path
  end

  test "4 images should be present...(globe is hidden)" do
    assert_equal 4, page.all("img").count
  end

  test "questions are still visible" do
    assert_equal 4, page.all("#question").count
  end

  test "all answers are hidden" do
    assert_equal 0, page.all("#answer").count
  end

  test "all locations are hidden" do
    assert_equal 0, page.all("#location").count
  end
end

