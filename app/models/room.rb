class Room < ActiveRecord::Base
  belongs_to :room_type
  has_many :occupancies, :dependent => :nullify
  has_many :guests , :through => :occupancies
  
  accepts_nested_attributes_for :room_type
  validates :number, :extension, :room_type_id, :presence => true
  
  def current_occupancies
    return occupancies.where(:check_out => nil, :move => nil)
  end
  
  def current_occupants
    ids = []
    current_occupancies.each do |occ|
      ids << occ.guest_id
    end
    occupants = Guest.find(ids)
  end
  
  ### new methods ###
  
  def occupants_of_period(period)
    # parameter error
    if period.class != Hash || period[:start].nil? || period[:end].nil?
      return nil
    end
    
    guest_ids=[]
    occupancies.where(:check_out => nil).each do |o|
      if o.check_in >= period[:start] && o.check_in < period[:end]
        guest_ids << o.guest_id
      end
    end
    return Guest.find(guest_ids)
  end
  
  def current_occupancy_period
    check_in = Time.now
    current_occupancies.each do |o|
      if o.check_in < check_in 
        check_in = o.check_in 
      end  
    end
    occus = occupancies.where("check_out = null and move <> null").sort_by(&:move).reverse 
    occus.each do |o|
      if o.move > check_in && o.check_in < check_in 
        check_in = o.check_in        
      end
    end
    return {:start => check_in, :end => Time.now}
  end
  
  def current_occupancy_occupants
    return occupants_of_period(current_occupancy_period)
  end
  
  def move_occupancy_periods
    occus = occupancies.where("check_out = null and move <> null").sort_by(&:check_in)
    periods = []
    count = 0
    start_t = occus.first.check_in
    end_t = occus.first.move
    occus.each do |o|
      if o.check_in < end_t && o.move > end_t
        end_t = o.move
      elsif o.check_in > end_t
        periods[count] = {:start => start_t, :end => end_t}
        count += 1
        start_t = o.check_in
        end_t = o.move   
      end
    end
    return periods
  end
  
  def move_occupancy_periods_of_guest(guest_id)
    guest = Guest.find(guest_id)
    ps = []
    move_occupancy_periods.each do |p|
      if occupants_of_period(p).include?(guest)
        ps << p
      end
    end
    return ps
  end
  
  def check_out_current_occupancy_occupants
    period = current_occupancy_period    
    check_out_for_period period
  end
  
  def check_out_occupants_for_period(period)
    #debugger    
    occupancies.where(:check_out => nil).each do |o|
      if o.check_in >= period[:start] && o.check_in < period[:end]
        o.check_out = Time.now
        o.save!
      end
    end
  end
  
  def current_rate_card
    room_type.current_rate_card
  end
end
