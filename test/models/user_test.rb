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

  test "if the ENV is Development then we have a spoofed ip" do
    assert_equal 1, @franny.ip
  end

end
