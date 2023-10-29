class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_details
    has_many :items, through: :order_details
    

    enum payment_method: {credit_card:0, transfer:1}
    enum status: { waiting_for_payment: 0, payment_confirmed: 1, in_production: 2, preparing_to_ship: 3, shipped: 4 }

def self.statuses_i18n
        statuses.keys.map do |status|
          [I18n.t("enums.order.status.#{status}"), status]
        end.to_h
end
end
