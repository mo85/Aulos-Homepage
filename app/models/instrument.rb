class Instrument < ActiveRecord::Base
  
  ::FAMILIES = { 0 => "Holz", 1 => "Blech", 2 => "Schlagzeug", 3 => "Anderes" }
  
  default_scope order("family")
  
  validates_uniqueness_of :name
  
  def family_to_s
    ::FAMILIES[self.family]
  end
  
  def to_s
    "#{name}"
  end
  
end
