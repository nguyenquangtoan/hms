class ChangeRoomIdFromOccupancyTable < ActiveRecord::Migration
  def self.up
    change_table :occupancies do |t|
      t.change :room_id, :integer, :null => true
    end
  end

  def self.down
  end
end
