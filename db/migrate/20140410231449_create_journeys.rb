class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|
      t.string :name
      t.string :user_id

      t.timestamps
    end
  end
end
