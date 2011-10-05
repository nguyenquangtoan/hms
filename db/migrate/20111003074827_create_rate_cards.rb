class CreateRateCards < ActiveRecord::Migration
  def self.up
    create_table :rate_cards do |t|
      t.string :tariff_name, :null => false
      t.datetime :start_date, :null => false
      t.datetime :expriry_date, :null => false
      t.boolean :enable, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :rate_cards
  end
end
