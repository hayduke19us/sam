require "test_helper"

class InteractionTest < ActiveSupport::TestCase

  def setup
    @franny = users(:franny)
    @interaction = Interaction.create(itenerary_id: 1123213,
                                      user_id: 23441423,
                                      created_at: 1.month.ago 
                                     )
  end

  test "An interaction without an itenerary is invalid" do
    interaction = interactions(:franny_zoey_interaction)
    interaction.itenerary_id = nil
    refute interaction.valid?
  end

  test "An interaction without a user_id is invalid" do
    interaction = interactions(:zoey_franny_interaction)
    interaction.user_id = nil
    refute interaction.valid?
  end

  test "true if created 1 day ago" do
    @interaction.created_at = 1.day.ago
    @interaction.save
    assert @interaction.day_past
  end

  test "true if created 1 week ago" do
    @interaction.created_at = 1.week.ago
    @interaction.save
    assert @interaction.week_past
  end

  test "true if created 1 month ago" do
    assert @interaction.month_past
  end

  test "recent should return an empty collection" do
    assert Interaction.recent([@interaction], "day").empty?
  end

  test "recent by month should return a collection of one interaction" do
    assert_equal 1, Interaction.recent([@interaction], "month").count
  end

  test "you can overide the amount of time with arg" do
    assert_equal 1, Interaction.recent([@interaction], "week", 5).count
  end

end
