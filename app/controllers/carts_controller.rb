class CartsController < ApplicationController

  def add_to_cart
    product = Product.find params[:id]
    @cart = find_cart
    @cart.add_product product
    
    respond_to do |format|
      format.js
    end
    
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid product #{params[:id]}")
    flash[:notice] = "Invalid Product"
    redirect_to new_order_path
  end
  
  def empty_cart
    session[:cart] = nil
    
    respond_to do |format|
      format.js
    end
  end
  
  def select_products
    @products = Product.all
    
    respond_to do |format|
      format.js
    end
  end


end