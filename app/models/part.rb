class Part < ActiveRecord::Base
  belongs_to :play
  
  def to_s
    title
  end
  
end
