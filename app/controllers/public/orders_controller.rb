class Public::OrdersController < ApplicationController
  def new
     @addresses = Address.all
    @ordered = Order.all
  end

  def confirm
  end

  def thanks
  end

  def create
     session[:user] = Order.new()

    #支払い方法のセッション情報
    if params[:payment_select] == "0"
      session[:user][:payment_method] = 0
    elsif params[:payment_select] == "1"
      session[:user][:payment_method] = 1
    end
    
    #配送先登録のセッション情報
    if params[:address_select] == "0"
      session[:user][:postal_code] = current_end_user.postal_code
      session[:user][:shipping_address] = current_end_user.address
      session[:user][:direction] = current_end_user.full_name
    elsif params[:address_select] == "1"
      session[:user][:postal_code] =  Address.find(params[:address_id]).postal_code
      session[:user][:shipping_address] = Address.find(params[:address_id]).address
      session[:user][:direction] = Address.find(params[:address_id]).direction
    else 
      session[:user][:postal_code] =  params[:postal_code]
      session[:user][:shipping_address] = params[:shipping_address]
      session[:user][:direction] = params[:direction]
    end
    redirect_to orders_verification_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end
end
