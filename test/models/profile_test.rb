require "test_helper"

class ProfileTest < ActiveSupport::TestCase

  def setup
    @franny_profile = profiles(:franny_profile)
  end

  test "a profile without latitude is invalid" do
    @franny_profile.ip_address = nil
    refute @franny_profile.valid?
  end

  test "a user is accessible from profile" do
    franny = users(:franny)
    assert_equal franny, @franny_profile.user 
  end

end
