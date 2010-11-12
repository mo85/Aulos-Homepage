class CartItem
  
  attr_reader :product, :quantity
  
  #belongs_to :cart
  #belongs_to :product
  
  def initialize(product)
    @product = product
    @quantity = 1
  end
  
  def increment_quantity
    @quantity += 1
  end
  
  def title
    @product.title
  end
  
  def price
    @product.price * @quantity
  end
  
end