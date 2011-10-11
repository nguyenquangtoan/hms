class RateCard < ActiveRecord::Base
	has_many :rates, :dependent => :delete_all
	has_many :rate_plans, :dependent => :delete_all
	
	validates :tariff_name, :presence => true
end
