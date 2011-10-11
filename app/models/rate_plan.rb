class RatePlan < ActiveRecord::Base
  belongs_to :rate_card
  belongs_to :room_type
  
  validates :rate_card_id, :room_type_id, :start_date, :presence => true
  validate :check_start_date
  
  def start_date_to_s
    read_attribute(:start_date).in_time_zone.to_formatted_s(:long)
  end
  
  def expiry_date_to_s
    if read_attribute(:expiry_date).nil?
      nil
    else
      read_attribute(:expiry_date).in_time_zone.to_formatted_s(:long)
    end
  end
  
  def status
    if start_date <= Time.now
      if expiry_date.nil? || expiry_date >= Time.now
        return 'used'
      elsif expiry_date < Time.now
        return 'expiried'
      end
    else
      return 'unused'
    end
  end
  
  def check_start_date    
    if !self.room_type.rate_plans.empty?
      
      last_plan = self.room_type.rate_plans.last
      if last_plan.expiry_date.nil?
      
        if last_plan.start_date < self.start_date and Time.now <= self.start_date 
          
          last_plan.update_attribute :expiry_date, start_date 
        else
          
          str = "Start day must be greater than now"
          str + "and #{last_plan.expiry_date}" if !last_plan.expiry_date.nil? 
          self.errors.add(:start_date, str)          
        end
        
      else
        self.start_date = last_plan.expiry_date
      end
      
    else
      if Time.now <= self.start_date
        self.errors.add(:start_date, "Start day must be less or equal than now!")
      end
    end  
  end
  
end
