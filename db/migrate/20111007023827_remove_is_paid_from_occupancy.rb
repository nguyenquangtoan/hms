class RemoveIsPaidFromOccupancy < ActiveRecord::Migration
  def self.up
    remove_column :occupancies, :is_paid
  end

  def self.down
    add_column :occupancies, :is_paid, :boolean
  end
end
