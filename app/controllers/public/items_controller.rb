class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).where(is_sale_status:true)#is_sale_statusがtrue=販売中の商品のみ一覧で並べる
    @item = Item.where(is_sale_status:true)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
