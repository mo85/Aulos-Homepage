class Location < ActiveRecord::Base
  
  has_many :events
  
  validates_presence_of :zip, :city, :street
  
  def to_s
    "#{street} #{zip} #{city}"
  end
  
  def for_tooltip
    "#{street}, <br /> #{zip} #{city}"
  end
  
end
