class Guest < ActiveRecord::Base
	has_many :bills, :dependent => :restrict
	has_many :occupancies , :dependent => :restrict
	has_many :rooms , :through => :occupancies
	
	validates :name, :personal_id_number, :presence => true
	
	def moved_rooms
	  room_ids = []
	  occupancies.where("check_out = NULL AND move <> NULL").each do |o|
	    room_ids << o.room_id unless room_ids.include? o.room_id
	  end
	  return Room.find(room_ids)
	end
	
	def stay_now?
	  occupancies.exists?(:check_out => nil, :move => nil)
	end
end
