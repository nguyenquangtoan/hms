class RateCard < ActiveRecord::Base
	has_many :rates
	
	validates :tariff_name, :start_date, :expriry_date, :enable, :presence => true
end
