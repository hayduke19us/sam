class CreateIteneraries < ActiveRecord::Migration
  def change
    create_table :iteneraries do |t|
      t.integer :journey_id

      t.timestamps
    end
  end
end
