class CreateOccupancies < ActiveRecord::Migration
  def self.up
    create_table :occupancies do |t|
      t.references :guest, :null => false
      t.references :room, :null => false
      t.datetime :check_in, :null => false
      t.datetime :check_out, :null => false
      t.boolean :is_paid, :null => false, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :occupancies
  end
end
