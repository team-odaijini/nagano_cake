class Address < ApplicationRecord
    belongs_to :customer
     validates :name, presence: true
     validates :residence, presence: true
     validates :post_code, presence: true
     
end
