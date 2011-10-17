class RoomType < ActiveRecord::Base
	has_many :rooms, :dependent => :restrict
	has_many :rate_plans , :dependent => :delete_all
	validates :name, :presence => true
	
	def current_rate_card
	  unless rate_plans.empty?
	    rate_plans.each do |p|
	      if p.status == 'used'
	        return p.rate_card
	      end
	    end
	  end
	end
end
