class RemoveIpAddressFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :ip_address, :string
  end
end
