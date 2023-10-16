class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :post_code
      t.string :residence
      t.string :name

      t.timestamps
    end
  end
end
