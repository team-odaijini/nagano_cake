class Admin::OrdersController < ApplicationController
  
  
  
  def show
     @order =Order.find(params[:id])
     #@order_details= OrderDetail.where(order_id: @order.id)
     @order_details = @order.order_details
  end

  def update_status
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "注文ステータスを更新しました"
      redirect_to admin_order_path
    else
      flash[:alert] = "注文ステータスの更新に失敗しました"
      redirect_to admin_order_path
    end
    @order_detail = OrderDetail.find(params[:id])
  end
  
  private

  def order_params
   params.require(:order).permit(:status)
  end
end
