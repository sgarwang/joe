class Event < ActiveRecord::Base
  validates_presence_of :name         # Ensure name is not null
  
  belongs_to :category                # Event.category_id points to category's id
  
  has_one :location                           # 1 event to 1 location:  Location's ID is actually pointed to event's ID.
  has_many :attendees, :dependent => :destroy # 1 event to M attendees: 
  
  has_many :event_groupships                      # 1 event to M event_gropuships
  has_many :groups, :through => :event_groupships # M event_groupships implies M groups
  
  # DB relation and migration need to be modified later. Seems rake db:migrate won't udpate this? 
  attr_accessible :capacity, :description, :is_public, :name, :category_id
  
  default_scope order('id DESC', 'name DESC')  
  
  scope :public, where( :is_public => true )
  scope :recent_three_days, where(["created_at > ? ", Time.now - 3.days ])

  # Callback
  before_validation :setup_default

    
  # Readable 
  # scope :recent, lambda{ |date| where(["created_at > ? ", date ]) }   
  #
  # Event.recent( Time.now - 7.days )
  #
  def self.recent(t=Time.now)
      where(["created_at > ? ", t ])
  end

  def full_name
      "#{self.first_name} #{self.last_name}"
  end

  def full_name=(value)
      self.first_name, self.last_name = value.to_s.split(" ", 2)  
  end  
  
  # User.where(:id => 1).joins(:posts).explain


  protected

  # Callback, ensure only called internally by Event model
  # !!! Ensure to return true avoid aboarting the operation
  def setup_default
      self.is_public ||= true
  end
      
end
