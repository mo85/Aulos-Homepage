class CartsController < ApplicationController

  def add_to_cart
    product = Product.find params[:id]
    @cart = find_cart
    @cart.add_product product
    redirect_to new_order_path
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid product #{params[:id]}")
    flash[:notice] = "Invalid Product"
    redirect_to new_order_path
  end
  
  def empty_cart
    session[:cart] = nil
    flash[:notice] = "Your cart is currently empty"
    redirect_to new_order_path
  end
  
  def select_products
    @products = Product.all
    
    respond_to do |format|
      format.js
    end
  end
  
  private 
  
  def find_cart
    session[:cart] ||= Cart.new
  end
  
end