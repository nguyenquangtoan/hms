class RateCard < ActiveRecord::Base
	has_many :rates, :dependent => :delete_all
	has_many :rate_plans, :dependent => :delete_all
	
	validates :tariff_name, :presence => true
	
	def rate_for_dest_number(dest)
	  # by defaulf, if multi rates have the same prefix, the last created rate will return when select distinct
	  if @current_rates.nil?
	    @current_rates = rates.find(:all, :group => 'prefix', :order => 'prefix DESC, created_at DESC')
	  end
	  
	  @current_rates.each do |r|
	    return r if r.applicable_for_dest? dest 
	  end
	end
end
