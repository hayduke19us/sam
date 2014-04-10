require "test_helper"

class GuardianTest < ActiveSupport::TestCase

  def setup
    @guard = guardians(:franny_dad)
  end

  test "a guardian is associated with a user" do
    assert @guard.user
  end
end
