class CreateRates < ActiveRecord::Migration
  def self.up
    create_table :rates do |t|
      t.references :rate_card, :null => false
      t.string :description
      t.string :type
      t.string :prefix, :null => false
      t.integer :begin_second_block
      t.decimal :begin_block_rate, :precision => 10, :scale => 4
      t.decimal :minute_rate, :precision => 10, :scale => 4
      t.decimal :fixed_rate, :precision => 10, :scale => 4

      t.timestamps
    end
  end

  def self.down
    drop_table :rates
  end
end
