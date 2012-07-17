class Category < ActiveRecord::Base

  # attr_accessible :title, :body
  attr_accessible :name, :position

  has_many :events, :order => "id desc"           # 1 category to M event
  
  
end
