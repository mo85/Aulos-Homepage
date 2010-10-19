class Play < ActiveRecord::Base

  belongs_to :project
  belongs_to :composer
  
  has_many :parts
  
  
  
end
