class Person < ActiveRecord::Base

  has_many :projects, :class_name => "Membership"
  has_one :avatar
  
  validates_presence_of :firstname, :lastname, :email

  def to_s
    "#{firstname} #{lastname}"
  end
  
  def last_first
    "#{lastname} #{firstname}"
  end
  
  def cv_form
    false
  end
  
  def birthdate_to_s
    I18n.l(birthdate, :format => "%d. %B %Y")
  end
  
end
