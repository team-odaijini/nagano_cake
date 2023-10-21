class Public::CustomersController < ApplicationController
  def show
  　　  @customer = current_customer
  end

  def edit
      @customer = current_customer
  end

  def update
      @customer = current_customer
      @customer.update(customer_params)
      redirect_to customer_path
  end

  def leave
  end

  def withdraw
      @customer = current_customer
      @customer.update
      reset_session
      redirect_to root_path
  end
  
 private
  def customer_params
     params.require(:customer).permit(:famiy_name, :fisrt_name, :family_name_kana, :fisrt_name_kana, :adress, :post_code, :telephone_number, :email )
  end
end
