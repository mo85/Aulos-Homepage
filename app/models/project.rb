class Project < ActiveRecord::Base

  has_many :plays
  
  validates_presence_of :year
  validates_numericality_of :year
  
  default_scope order("year DESC")

  def self.current_project
  end
  
  def to_s
    s = "Aulos #{year}"
    if title
      s = title
    end
    s
  end

end
