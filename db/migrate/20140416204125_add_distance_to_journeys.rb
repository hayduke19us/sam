class AddDistanceToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :distance, :string
  end
end
