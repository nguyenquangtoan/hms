class Rate < ActiveRecord::Base
  belongs_to :rate_card
  validates :rate_card_id, :prefix, :presence => true
  validates :begin_second_block, :begin_block_rate, :minute_rate, :fixed_rate, :numericality => true, :allow_nil => true
  validates :prefix, :numericality => true
  
  def applicable_for_dest?(destination)
    return destination[0, self.prefix.length] == self.prefix
  end
  
end
