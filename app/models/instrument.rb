class Instrument < ActiveRecord::Base
  
  ::FAMILIES = { 0 => "Holz", 1 => "Blech", 2 => "Schlagzeug", 3 => "Anderes" }
  
  default_scope order("family")
  
  def family_to_s
    ::FAMILIES[self.family]
  end
  
end
