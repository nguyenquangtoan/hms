class Guest < ActiveRecord::Base
	has_many :bills, :dependent => :restrict
	has_many :occupancies , :dependent => :restrict
	has_many :rooms , :through => :occupancies
	
	validates :name, :personal_id_number, :presence => true
end
