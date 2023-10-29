class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :explanation
      t.integer :excluding_tax
      t.boolean :is_sale_status, default: false

      t.timestamps
    end
  end
end
