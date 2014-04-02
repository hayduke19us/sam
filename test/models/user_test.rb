require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @franny = users(:franny)
  end

  test "a user without an email is invalid" do 
    @franny.email = nil
    refute @franny.valid?
  end

  test "a user without an encrypted_password is invalid" do
    @franny.encrypted_password = nil
    refute @franny.valid?
  end

  test "a user has a profile" do
    assert @franny.profile
  end

  test "a users religion is directly accessible" do
    assert_equal "christian", @franny.religion
  end

  test "if the ENV is development or test then we have a spoofed ip" do
    assert_equal "50.78.167.161", @franny.ip_address
  end

  test "if ENV is production it will return the current_sign_in_ip" do
    Rails.stub(:env, "production") do
      assert_equal "127.0.0.1", @franny.ip_address
    end
  end

end
