ENV["RAILS_ENV"] = "test"
require 'coveralls'
Coveralls.wear!('rails')


ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)


require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"

class ActiveSupport::TestCase
  fixtures :all

  #P -> Portrait L -> Landscape

  MOBILE_P = { width: 320,  height: 800 } 
  MOBILE_L = { width: 480,  height: 800 }
  TABLET_P = { width: 768,  height: 800 }
  TABLET_L = { width: 1024, height: 800 }

  def view size
    Capybara.current_driver = :selenium
    cs_driver.browser.manage.window.resize_to(size[:width], size[:height])
  end

  def cs_driver
    Capybara.current_session.driver
  end

end
