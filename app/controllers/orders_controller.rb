# encoding: utf-8
class OrdersController < ApplicationController
  filter_access_to :all
  
  validates_captcha
  
  # GET /orders
  # GET /orders.xml
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @cart = find_cart
    
    if @cart.items.empty?
      flash[:notice] = "Es befinden sich keine Produkte in Ihrem Warenkorb."
      if request.env["HTTP_REFERER"]
        redirect_to :back
      else
        redirect_to root_path
      end
    else
      @order = Order.new
    
      respond_to do |format|
        format.html # new.html.erb
      end
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    @order = Order.new(params[:order])
    @cart = find_cart
    
    @order.add_line_items_from_cart(@cart)
    
    respond_to do |format|
      if captcha_validated? && @order.save
        delete_cart
        OrderMailer.order_confirmation.deliver
        flash[:notice] = "Ihre Bestellung wurde registriert. Sie erhalten in Kürze eine Email, in der Sie die Bestellung bestätigen müssen."
        format.html { redirect_to(@order) }
      else
        flash[:notice] = "Die Bestellung konnte nicht registriert werden. Bitte überprüfen Sie Ihre Eingaben."
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(@order, :notice => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end

end
