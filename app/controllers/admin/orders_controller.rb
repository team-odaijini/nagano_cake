class Admin::OrdersController < ApplicationController
  
  
  
  def show
  　@admins_order = Order.find(params[:id])
    @user = @admins_order.user
    @order_products = @admins_order.order_products
    @order_product = OrderProduct.find(@admins_order.id)
  end

  def update
  end
end
