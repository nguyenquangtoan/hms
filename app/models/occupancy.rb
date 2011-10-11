class Occupancy < ActiveRecord::Base
  belongs_to :guest
  belongs_to :room
  has_many :bill_details, :dependent => :restrict
  
  validates :guest_id, :room_id, :presence => true  
end
