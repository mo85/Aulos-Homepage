class AudioTrack < ActiveRecord::Base
  
  belongs_to :project
  
  has_attached_file :file
  
  validates_presence_of :name
  
  def to_s
    name
  end
  
end
