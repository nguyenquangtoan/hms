class CreateGuests < ActiveRecord::Migration
  def self.up
    create_table :guests do |t|
      t.string :name, :null => false
      t.string :persional_id_number, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :guests
  end
end
