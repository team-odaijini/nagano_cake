class CartItem < ApplicationRecord
    belongs_to :customer
    belongs_to :item

    #商品*個数の金額を出す
    def sum_of_price
    item.add_tax_excluding_tax * quantity
    end

end
