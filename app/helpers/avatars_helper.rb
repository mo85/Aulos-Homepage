module AvatarsHelper
  
  def person_pic person, size = :thumb
    size ||= :medium
    
    file = "/images/profile_thumb.png"
    if person && person.avatar && person.avatar.photo.url
      file = person.avatar.photo.url(size)
    end
    
    image_tag file
    
  end
  
end
