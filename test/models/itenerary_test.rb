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

end
