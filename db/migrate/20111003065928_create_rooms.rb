class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
      t.string :number, :null => false
      t.string :extension, :null => false
      t.references :room_type, :null => false
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :rooms
  end
end
