class Person < ActiveRecord::Base

  has_many :projects, :class_name => "Membership"

  def to_s
    "#{firstname} #{lastname}"
  end
  
  def last_first
    "#{lastname} #{firstname}"
  end
  
end
