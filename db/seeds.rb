# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

RoomType.create(:name => 'Regular')
RoomType.create(:name => 'Expensive')

rate = Rate.create(:rate_card_id => RateCard.all.first,:name => 'rate1' ,:prefix => 3, :begin_second_block => 10, :begin_block_rate => 100, :minute_rate => 100)

Rate.create(:rate_card_id => RateCard.all.first,:name => 'rate2' ,:prefix => 33, :fixed_rate => 200)

Rate.create(:rate_card_id => RateCard.all.first,:name => 'rate3' ,:prefix => 9, :begin_second_block => 10, :begin_block_rate => 100, :minute_rate => 100, :fixed_rate => 200)

Occupancy.create(:guest_id => Guest.all.first.id, :room_id => Room.where(:extension => '100').first.id, :check_in => DateTime.civil(2011,9,1,9,00,00,Rational(7,24)))
Occupancy.create(:guest_id => Guest.all.second.id, :room_id => Room.where(:extension => '100').first.id, :check_in => DateTime.civil(2011,9,1,9,00,00,Rational(7,24)))
