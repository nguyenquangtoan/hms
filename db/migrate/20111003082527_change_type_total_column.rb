class ChangeTypeTotalColumn < ActiveRecord::Migration
  def self.up
	change_column :bills, :total, :decimal, :default => 0, :precision => 10, :scale => 4, :null => false
  end

  def self.down
  end
end
