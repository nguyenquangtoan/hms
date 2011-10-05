class Room < ActiveRecord::Base
  belongs_to :room_type
  has_many :occupancies
  has_many :guests , :through => :occupancies
  
  validates :number, :extension, :room_type_id, :presence => true
end
