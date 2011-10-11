class ChangePersonalIdNumberColumn < ActiveRecord::Migration
  def self.up
    remove_column :guests, :persional_id_number
    add_column :guests, :personal_id_number, :string, :null => false, :default => 'empty' 
  end

  def self.down
    remove_column :guests, :personal_id_number
    add_column :guests, :persional_id_number, :string, :null => false
  end
end
