class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end

  def confirm
      @cart_items = CartItem.where(customer_id: current_customer.id)
      @postage = 800 #送料は800円で固定
      @selected_payment_method = params[:order][:payment_method]
      
      #以下、商品合計
      ary = []
      @cart_items.each do |cart_item|
        ary << cart_item.item.price*cart_item.quantity
      end
      @cart_items_price = ary.sum
      
      @price_all = @postage + @cart_items_price
      @residence_type = params[:order][:residence_type]
      case @residence_type
      when "customer_residence"
        @selected_residence = current_customer.post_code + " " + current_customer.address + " " + current_customer.family_name + current_customer.first_name
      when "registered_residence"
        unless params[:order][:registered_residence_id] == ""
          selected = Residence.find(params[:order][:registered_Residence_id])
          @selected_residence = selected.post_code + " " + selected.residence + " " + selected.name
        else 
           render :new
        end
      when "new_residence"
        unless params[:order][:new_post_code] == "" && params[:order][:new_residence] == "" && params[:order][:new_name] == ""
      	  @selected_residence = params[:order][:new_post_code] + " " + params[:order][:new_residence] + " " + params[:order][:new_name]
      	else
      	  render :new
      	end
      end    
     
  end

  def thanks
  end

  def create
      @order = Order.new
      @order.customer_id = current_customer.id
      @order.postage = 800
      @cart_items = CartItem.where(customer_id: current_customer.id)
      ary = []
      @cart_items.each do |cart_item|
        ary << cart_item.item.price*cart_item.quantity
      end
      @cart_items_price = ary.sum
      @order.price_all = @order.postage + @cart_items_price
      @order.payment_method = params[:order][:payment_method]
      if @order.payment_method == "credit_card"
        @order.status = 1
      else
        @order.status = 0
      end
       residence_type = params[:order][:residence_type]
      case residence_type
        when "customer_residence"
          @order.post_code = current_customer.post_code
          @order.residence = current_custmoer.residence
          @order.name = current_customer.family_name + current_customer.first_name
        when "registered_residence"
          Residence.find(params[:order][:registered_residence_id])
          selected = Residence.find(params[:order][:registered_residence_id])
          @order.post_code = selected.post_code
          @order.residence = selected.residence
          @order.name = selected.name
        when "new_residence"
          @order.post_code = params[:order][:new_post_code]
          @order.residence = params[:order][:new_residence]
          @order.name = params[:order][:new_name]
      end
    
    if @order.save
      if @order.status == 0
        @cart_items.each do |cart_item|
          OrderDetail.create!(order_id: @order.id, item_id: cart_item.item.id, price: cart_item.item.price, quantity: cart_item.quantity, making_status: 0)
        end
      else
        @cart_items.each do |cart_item|
          OrderDetail.create!(order_id: @order.id, item_id: cart_item.item.id, price: cart_item.item.price, quantity: cart_item.quantity, making_status: 1)
        end
      end
      @cart_items.destroy_all
      redirect_to order_orders_thanks_path
    else
      render :items
    end
  end    
    

  def index
    @orders = current_customer.orders
  end

  def show
     @order = Order.find(params[:id])
      @order_details= OrderDetail.where(order_id: @order.id)
  end
end
