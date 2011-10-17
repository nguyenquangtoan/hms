class AsteriskCdr < ActiveRecord::Base
	establish_connection :asteriskcdr_db
	set_table_name :cdr
	
	def self.calls_from_src_number(extension, period)
	  self.where(:src => extension, :calldate => period[:start]..period[:end])
	end
end
