class Avatar < ActiveRecord::Base
  
  belongs_to :person
  
  has_attached_file :photo, :styles => { :medium => "250x500>", :thumb => "50x50>" }
  
end
