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
      @customer = current_customer
  end

  def withdraw
      @customer = current_customer
      @customer.update(is_deleted: true)
      reset_session
      redirect_to root_path
  end

 private
  def customer_params
     params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :address, :post_code, :telephone_number, :email )
  end
end
