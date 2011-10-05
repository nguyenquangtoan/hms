class Rate < ActiveRecord::Base
  belongs_to :rate_card
  validates :rate_card_id, :prefix, :presence => true
  validates :begin_sencond_block, :begin_block_rate, :minute_rate, :fixed_rate, :duration, :numericality => true
  
end
