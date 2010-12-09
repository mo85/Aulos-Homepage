class Event < ActiveRecord::Base
  
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
