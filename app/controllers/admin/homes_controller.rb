class Admin::HomesController < ApplicationController
  def top
    @admins_orders = Order.page(params[:page]).reverse_order
  end
end
