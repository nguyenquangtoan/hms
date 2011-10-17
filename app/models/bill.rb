class Bill < ActiveRecord::Base
	belongs_to :guest
  has_many :bill_details, :dependent => :delete_all
  has_many :occupancies, :through => :bill_details
  validates :guest_id, :presence => true
  
  def total
    total = 0.0
    bill_details.each do |b|
      total += b.amount
    end
    return total
  end
end
