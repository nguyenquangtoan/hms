class ChangeNameTypeColumn < ActiveRecord::Migration
  def self.up
    change_table :rates do |t|
      t.remove :type
      t.string :name
    end
  end

  def self.down    
  end
end
