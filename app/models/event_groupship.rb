class EventGroupship < ActiveRecord::Base
  attr_accessible :event_id, :group_id
  
  belongs_to :event               # Join table belongs to M event and
  belongs_to :group               # Join table belongs to M group
end
