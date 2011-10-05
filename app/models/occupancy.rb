class Occupancy < ActiveRecord::Base
  belongs_to :guest
  belongs_to :room
  
  validates :guest_id, :room_id, :is_paid, :presence => true  
end
