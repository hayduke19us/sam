require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @franny = users(:franny)
  end

  test "a user without an email is invalid" do 
    @franny.email = nil
    refute @franny.valid?
  end

  test "a user without a encrypted_password is invalid" do
    @franny.encrypted_password = nil
    refute @franny.valid?
  end

  test "a user has a profile" do
    assert @franny.profile
  end

  test "a users religion is directly accessible" do
    assert_equal "christian", @franny.religion
  end

  test "a users lat is directly accessible" do
    assert_equal 1.1, @franny.latitude
  end

  test "a users long is directly accessible" do
    assert_equal 1.2, @franny.longitude
  end
end
