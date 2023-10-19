class Public::CustomersController < ApplicationController
  def show
  #  @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  def leave
  end

  def withdraw
  end
  
 private
  def customer_params
     params.require(:customer).permit(:famiy_name, :fisrt_name, :family_name_kana, :fisrt_name_kana, :adress, :post_code, :telephone_number, :email )
  end
end
