class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
  #  byebug
    @address.save
    redirect_to addresses_path
  end

  def edit
    @address = Adress.find(params[:id])
  end
  
  def update
    @address = Address.find([params:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address = Adress.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end
end


private
  def address_params
    params.require(:address).permit(:post_code, :residence, :name)
  end