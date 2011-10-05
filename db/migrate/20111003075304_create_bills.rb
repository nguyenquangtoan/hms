class CreateBills < ActiveRecord::Migration
  def self.up
    create_table :bills do |t|
      t.references :guest, :null => false
      t.decimal :total, :default => 0, :null => false, :precision => 10, :scale => 4

      t.timestamps
    end
  end

  def self.down
    drop_table :bills
  end
end
