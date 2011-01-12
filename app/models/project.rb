class Project < ActiveRecord::Base

  has_many :plays
  has_many :members, :class_name => "Membership"
  has_many :events
  has_many :concerts
  has_many :audio_tracks
  
  has_one :conductor
  
  validates_presence_of :year
  validates_numericality_of :year, :integer => true, :greater_than => 1985, :less_than => 2100
  
  default_scope order("year DESC")

  def self.current
    Project.all.first
  end
  
  def to_s
    s = "Aulos #{year}"
    if title
      s = title
    end
    s
  end
  
  def soloists
    members.where("soloist == ?", true)
  end

end
