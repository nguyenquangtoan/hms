class ChangeCheckOutColumn < ActiveRecord::Migration
  def self.up
    change_column :occupancies, :check_in, :datetime, :null => true
    change_column :occupancies, :check_out, :datetime, :null => true
  end

  def self.down
    change_column :occupancies, :check_in, :datetime, :null => false
    change_column :occupancies, :check_out, :datetime, :null => false
  end
end
