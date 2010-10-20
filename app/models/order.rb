class Order < ActiveRecord::Base
  
  validates_presence_of :firstname, :lastname, :email, :zip, :street, :city
  validates_numericality_of :zip
  
  validates :email, :presence => true, :email => true
  
  ::STATE = { 0 => "registered", 1 => "sent", 2 => "completed" }

  def customer
    "#{firstname} #{lastname}"
  end
  
  def street_with_number
    "#{street} #{number}"
  end
  
end
