class Order < ActiveRecord::Base
  
  validates_presence_of :firstname, :lastname, :zip, :street, :city
  validates_numericality_of :zip
  
  validates :email, :presence => true, :email => true
  
  has_many :line_items
  
  ::STATE = { 0 => "registered", 1 => "sent", 2 => "completed" }

  def customer
    "#{firstname} #{lastname}"
  end
    
  def zip_with_city
    "#{zip} #{city}"
  end
  
  def add_line_items_from_cart(cart)
    cart.items.each do |item|
      li = LineItem.from_cart_item(item)
      line_items << li
    end
  end
  
end
