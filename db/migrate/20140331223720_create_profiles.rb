class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :religion
      t.float :latitude
      t.float :longitude
      t.integer :user_id

      t.timestamps
    end
  end
end
