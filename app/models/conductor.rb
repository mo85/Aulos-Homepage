class Conductor < Person
  
  validates_presence_of :project_id
  
  belongs_to :project
  
  default_scope includes("project").order("projects.year DESC")
  
  def cv_form
    true
  end
  
end