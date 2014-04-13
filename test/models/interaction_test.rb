require "test_helper"

class InteractionTest < ActiveSupport::TestCase

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

end
