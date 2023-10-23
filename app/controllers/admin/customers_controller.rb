class Admin::CustomersController < ApplicationController
  
  def index
    @customer = Customer.new 
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path
  end
  private
  def customer_param
    params.require(:customer).premit(:family_name, :first_name, :family_name_kana, :first_name_kana, :address, :post_code, :telephone_number, :email, :password, :is_deleted)
  end
end
