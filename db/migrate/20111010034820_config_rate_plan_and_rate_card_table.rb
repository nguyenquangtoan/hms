class ConfigRatePlanAndRateCardTable < ActiveRecord::Migration
  def self.up
    change_table :rate_cards do |t|
      t.remove :expriry_date
    end
  end

  def self.down
    change_table :rate_cards do |t|
      t.datetime :expriry_date
    end
  end
end
