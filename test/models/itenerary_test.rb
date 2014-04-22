require "test_helper"

class IteneraryTest < ActiveSupport::TestCase

  def setup
    @itenerary = iteneraries(:franny_journey_itenerary)
  end

  test "an itenerary belongs to a journey" do
    franny_journey = journeys(:franny_journey)
    assert_equal franny_journey, @itenerary.journey
  end

  test "an itenerary without a journey_id is invalid" do
    @itenerary.journey_id = nil
    refute @itenerary.valid?
  end

  test "when an short journey itenerary is saved 3 interactions are created" do
    franny = users( :franny )
    journey = Journey.create( name: "some_journey",
                              user: franny,
                              distance: "short" )
    itenerary = journey.itenerary
    assert_equal 3, itenerary.interactions.count
  end

  test "when an long journey itenerary is saved 6 interactions are created" do
    franny = users( :franny )
    journey = Journey.create( name: "some_journey",
                              user: franny,
                              distance: "long" )
    itenerary = journey.itenerary
    assert_equal 6, itenerary.interactions.count
  end

end
