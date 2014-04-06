class RemoveLatitudeAndLongitudeFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :latitude, :float
    remove_column :profiles, :longitude, :float
  end
end
