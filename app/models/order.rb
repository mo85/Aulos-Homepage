class Order < ActiveRecord::Base
  
  validates_presence_of :firstname, :lastname, :email, :zip, :street, :number, :city, :country
  validates_numericality_of :zip

  ::STATE = { 0 => "registered", 1 => "sent", 2 => "completed" }

  def customer
    "#{firstname} #{lastname}"
  end
  
  def street_with_number
    "#{street} #{number}"
  end
  
end
