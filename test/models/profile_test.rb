require "test_helper"

class ProfileTest < ActiveSupport::TestCase

  def setup
    @franny_profile = profiles(:franny_profile)
  end

  test "a profile without latitude is invalid" do
    @franny_profile.latitude = nil
    refute @franny_profile.valid?
  end

  test "a profile without longitude is invalid" do
    @franny_profile.longitude = nil
    refute @franny_profile.valid?
  end

  test "a user is accessible from profile" do
    franny = users(:franny)
    assert_equal franny, @franny_profile.user 
  end

end
