class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item
    enum production_status: {cannot_start: 0,waiting_start: 1,in_production: 2,completed: 3 }
    
    def self.production_statuses_i18n
        production_statuses.keys.map do |status|
          [I18n.t("enums.order_detail.production_status.#{status}"), status]
        end.to_h
    end
end
