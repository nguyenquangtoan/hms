class RoomType < ActiveRecord::Base
	has_many :rooms, :dependent => :restrict
	has_many :rate_plans , :dependent => :delete_all
	validates :name, :presence => true
end
