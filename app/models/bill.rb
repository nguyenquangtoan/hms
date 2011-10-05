class Bill < ActiveRecord::Base
	belongs_to :guest
  has_many :bill_details
  has_many :occupancies, :throught => :bill_details
  validates :guest_id, :total, :presence => true
  
end