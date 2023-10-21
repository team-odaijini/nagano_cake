class Public::OrdersController < ApplicationController
  def new
  end

  def confirm
  end

  def thanks
  end

  def create
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end
end
