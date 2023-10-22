class CartItem < ApplicationRecord
    belongs_to :customer
    belongs_to :item
    
    #def add_tax_excluding_tax
    #   (self.excluding_tax * 1.10).round
    #end
end
