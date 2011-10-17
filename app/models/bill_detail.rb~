class BillDetail < ActiveRecord::Base
  belongs_to :bill
  belongs_to :occupancy
  
  validates :bill_id, :occupancy_id, :destination, :call_time, :duration, :amount, :presence => true
  validates :begin_sencond_block, :begin_block_rate, :minute_rate, :fixed_rate, :duration, :numericality => true
end
