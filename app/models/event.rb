class Event < ActiveRecord::Base
  validates_presence_of :name          # Ensure name is not null
  
  attr_accessible :capacity, :description, :is_public, :name
  
  
end
