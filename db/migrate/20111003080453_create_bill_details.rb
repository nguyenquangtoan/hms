class CreateBillDetails < ActiveRecord::Migration
  def self.up
    create_table :bill_details do |t|
      t.references :bill, :null => false
      t.references :occupancy, :null => false
      t.string :destination, :null => false
      t.datetime :call_time, :null => false
      t.integer :duration, :null => false, :default => 0
      t.integer :begin_second_block
      t.decimal :begin_block_rate, :precision => 10, :scale => 4
      t.decimal :minute_rate, :precision => 10, :scale => 4
      t.decimal :fixed_rate, :precision => 10, :scale => 4
      t.decimal :amount, :null => false, :default => 0, :precision => 10, :scale => 4

      t.timestamps
    end
  end

  def self.down
    drop_table :bill_details
  end
end
