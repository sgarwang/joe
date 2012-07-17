class Group < ActiveRecord::Base
  attr_accessible :name

  has_many :event_groupships                      # 1 gropu to M event_groupships    
  has_many :events, :through => :event_groupships # M event_groups implies M events
  
  
end
