class Room < ActiveRecord::Base
  belongs_to :room_type
  has_many :occupancies
  has_many :guests , :through => :occupancies
  
  accepts_nested_attributes_for :room_type
  validates :number, :extension, :room_type_id, :presence => true
end
