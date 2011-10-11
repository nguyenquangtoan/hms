class Room < ActiveRecord::Base
  belongs_to :room_type
  has_many :occupancies, :dependent => :nullify
  has_many :guests , :through => :occupancies
  
  accepts_nested_attributes_for :room_type
  validates :number, :extension, :room_type_id, :presence => true
  
  def current_occupancies
    return occupancies.where(:check_out => nil, :move => nil)
  end
  
  def current_occupants
    ids = []
    current_occupancies.each do |occ|
      ids << occ.guest_id
    end
    occupants = Guest.find(ids)
  end
end
