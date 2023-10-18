class Item < ApplicationRecord
     has_many :order_details
     has_many :cart_items
     belongs_to :genre
     has_one_attached :image

     def get_image
       unless image.attached?
         file_path = Rails.root.join('app/assets/images/no_image.jpg')
         image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
       end
       image
     end

     #消費税率を計算するアクション
     def add_tax_excluding_tax
       (self.excluding_tax * 1.10).round
     end

end
