class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :postage
      t.integer :price_all
      t.integer :payment_method
      t.integer :status
      t.string :name
      t.string :residence
      t.string :post_code

      t.timestamps
    end
  end
end
