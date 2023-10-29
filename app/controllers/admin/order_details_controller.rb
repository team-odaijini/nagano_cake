class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all
  end
   
private
  
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
  
end  

