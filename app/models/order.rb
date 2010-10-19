class Order < ActiveRecord::Base
  
  validates_presence_of :firstname, :lastname, :email, :zip, :street, :city
  validates_numericality_of :zip
  
  validates_format_of :email, :with =>
  %r{^(?:[_a-z0-9-]+)(\.[_a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})$}i, :allow_blank => false
  
  ::STATE = { 0 => "registered", 1 => "sent", 2 => "completed" }

  def customer
    "#{firstname} #{lastname}"
  end
  
  def street_with_number
    "#{street} #{number}"
  end
  
end
