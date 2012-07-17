class Attendee < ActiveRecord::Base
  attr_accessible :event_id, :name
  
  belongs_to :event                   # Attendee's 'event_id' here must be point to Event's 'id'
end
