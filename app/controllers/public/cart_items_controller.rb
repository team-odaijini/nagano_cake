class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = current_customer.cart_items
  end

  def update
     @cart_item.update(quantity: params[:quantity].to_i)
     redirect_to request.referer
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    @cart_item.destroy
     redirect_to request.referer
  end

  def create
    @cart_item = current_customer.cart_items.new(item_id: params[:item_id])
    @cart_item.quantity += params[:quantity].to_i
    if @cart_item.save
      redirect_to request.referer
    else
      redirect_to items_path
    end  
  end
end
