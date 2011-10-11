class ChangeNameDesciptionColumn < ActiveRecord::Migration
  def self.up
    change_table :rate_cards do |t|
      t.rename :desciption, :description
    end
  end

  def self.down
    change_table :rate_cards do |t|
      t.rename :description, :desciption
    end
  end
end
