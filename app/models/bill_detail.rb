class BillDetail < ActiveRecord::Base
  belongs_to :bill
  belongs_to :room
  
  validates :bill_id, :room_id, :destination, :call_time, :duration, :amount, :presence => true
  validates :begin_second_block, :begin_block_rate, :minute_rate, :fixed_rate, :duration, :numericality => true
end
