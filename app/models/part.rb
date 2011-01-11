class Part < ActiveRecord::Base
  belongs_to :play
  
  validates_presence_of :play_id, :title
  
  
  def to_s
    title
  end
  
end
