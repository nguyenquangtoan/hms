class AsteriskUser < ActiveRecord::Base
	establish_connection :asterisk_db
	set_table_name :users
	set_primary_key :extension
end
