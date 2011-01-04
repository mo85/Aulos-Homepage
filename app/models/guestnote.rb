class Guestnote < ActiveRecord::Base
  
  validates_presence_of :message, :author
  
  default_scope order("created_at DESC")
  
end
