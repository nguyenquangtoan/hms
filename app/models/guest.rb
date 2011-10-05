class Guest < ActiveRecord::Base
	has_many :bills
	has_many :occupancies
	has_many :rooms , :through => :occupancies
	
	validates :name, :persional_id_number, :presence => true
end
