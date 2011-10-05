class AddRoomTypeIdToRateCard < ActiveRecord::Migration
  def self.up
    add_column :rate_cards, :room_type_id, :integer, :null => false, :default => 0
    remove_column :rate_cards, :enable
  end

  def self.down
    remove_column :rate_cards, :room_type_id
    add_column :rate_cards, :enable, :boolean, :default => false, :null => false
  end
end
