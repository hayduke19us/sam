require "test_helper"

class JourneyTest < ActiveSupport::TestCase

  def setup
    @franny_journey = journeys(:franny_journey)
  end

  test "a journey without a name is invalid" do
    @franny_journey.name = nil
    refute @franny_journey.valid?
  end

  test "a journey without an owner is invalid" do
    @franny_journey.user_id = nil
    refute @franny_journey.valid?
  end

  test "a journey belongs to a user" do
    franny = users(:franny)
    assert_equal franny, @franny_journey.user
  end

  test "a user's journeys must have a unique name"  do
    franny = users(:franny)
    journey = Journey.new(name: "franny_journey", user: franny, distance: "short")
    refute journey.valid?
  end

  test "a journey must have a distance i.e. short or long" do
    franny = users(:franny)
    journey = Journey.new(name: "franny_journey", user: franny, distance: nil)
    refute journey.valid?
  end

  test "two different users can have journeys with the same name" do
    zoey = users(:zoey)
    journey = Journey.new(name: "franny_journey", user: zoey, distance: "short")
    assert journey.valid?
  end

  test "a journey has a distance" do
    assert_equal "short", @franny_journey.distance
  end

  test "when a short journey is saved an itenerary is created" do
    journey =  create_a_journey "short"
    journey.save
    assert journey.itenerary
  end

  test "when a long journey is saved an itenerary is created" do
    journey = create_a_journey "long"
    journey.save
    assert journey.itenerary
  end

  test "interactions will return an array of interactions" do
    assert_equal 1, @franny_journey.interactions.count
  end

  test "should return a collection of journeys by query" do
    franny = users(:franny)
    assert_equal 1, Journey.search("franny", franny.id).count
  end

  def create_a_journey distance
    franny = users(:franny) 
    Journey.new name: "first_trip", distance: distance, user: franny
  end


end
