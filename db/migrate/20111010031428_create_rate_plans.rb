class CreateRatePlans < ActiveRecord::Migration
  def self.up
    create_table :rate_plans do |t|
      t.references :room_type, :null => false
      t.references :rate_card, :null => false
      t.datetime :start_date, :null => false
      t.datetime :expiry_date

      t.timestamps
    end
    change_table :rate_cards do |t|
      t.remove :start_date
      t.remove :expiry_date
      t.remove :room_type_id
      t.text :description
    end
  end

  def self.down
    drop_table :rate_plans
    change_table :rate_cards do |t|
      t.datetime :start_date 
      t.datetime :expiry_date
      t.references :room_type
      t.remove :description
    end
  end
end
