require "test_helper"

class InteractionsControllerTest < ActionController::TestCase
  def test_symposium
    get :symposium
    assert_response :success
  end

end
