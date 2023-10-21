class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :cart_items
         has_many :orders
         has_many :addresses
         
         #validates :family_name, presence: true
         #validates :family_name_kana, presence: true
         #validates :first_name, presence: true
         #validates :first_name_kana, presence: true
         #validates :adress, presence: true
         #validates :post_code, presence: true
         #validates :telephone_number, presence: true
         #validates :email, presence: true
         #validates :password, presence: true
end
