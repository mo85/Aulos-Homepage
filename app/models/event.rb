class Event < ActiveRecord::Base
  belongs_to :project
  belongs_to :location
  
  validates_presence_of :start_time
  
  def to_s
    "#{self.title}"
  end
  
  def self.next_event
    Event.where("start_time > ?", Time.now).order("start_time").first
  end
  
  def self.last_event
    Event.where("start_time < ?", Time.now).order("start_time").last
  end
  
end
