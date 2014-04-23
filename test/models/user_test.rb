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

  test "a user has a city" do
    assert_equal "Dallas", @franny.city
  end

  test "a users religion is directly accessible" do
    assert_equal "christian", @franny.religion
  end

  test "if the ENV is development or test then we have a spoofed ip" do
    assert_equal "50.78.167.161", @franny.ip_address
  end

  test "if ENV is production it will return the current_sign_in_ip" do
    Rails.stub(:env, "production") do
      assert_equal "127.0.0.0", @franny.ip_address
    end
  end

  test "if users ip changes then their lat and long changes" do
    skip
  end

  test "geo returns an array of the users lat and long" do
    assert_equal [32.7801399, -96.800451], @franny.geo
  end

  test "range finder returns the distance of a city from user city" do
    zoey = users(:zoey)
    assert_equal 1679.4585602167692, @franny.range_finder(zoey.geo)
  end

  test "should return 3 users by distance from self" do
    assert_equal 6, @franny.by_distance(3000, :>).count
  end

  test "should return all users because all are farther then distance arg" do
    assert_equal 8, @franny.by_distance(150, :>).count
  end

  test "should return one random user with arg of array of users" do
    users = User.all
    assert_equal User, User.random(users).class
  end

  test "base interaction finds one user to be initiated as the base interaction" do
    assert_equal User, @franny.base_interaction(1500).class
  end

end
