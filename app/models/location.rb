class Location < ActiveRecord::Base
  attr_accessible :event_id, :name
  belongs_to :event                   # Location's 'event_id' here must be point to Event's 'id'
  
end
