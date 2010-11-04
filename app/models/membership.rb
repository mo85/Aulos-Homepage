class Membership < ActiveRecord::Base
  belongs_to :person
  belongs_to :project
  belongs_to :instrument
  
  validates_presence_of :person_id
  validates_presence_of :project_id
  
end
