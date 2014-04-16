class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.integer :itenerary_id
      t.integer :user_id

      t.timestamps
    end
  end
end
