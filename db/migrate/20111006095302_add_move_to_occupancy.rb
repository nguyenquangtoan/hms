class AddMoveToOccupancy < ActiveRecord::Migration
  def self.up
    add_column :occupancies, :move, :datetime
  end

  def self.down
    remove_column :occupancies, :move
  end
end
