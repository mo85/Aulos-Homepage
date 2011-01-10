class Play < ActiveRecord::Base

  belongs_to :project
  belongs_to :composer
  
  has_many :parts
  belongs_to :soloist, :class_name => "Person"
  
  validates_presence_of :title, :project_id
  validates_numericality_of :year, 
                            :only_integer => true, 
                            :less_than => (Time.now.year + 2), 
                            :greater_than => 1800,
                            :allow_nil => true
                            
  def to_s
    string = "#{title}"
    if year
      string += " (#{year})"
    end
    string
  end
end
