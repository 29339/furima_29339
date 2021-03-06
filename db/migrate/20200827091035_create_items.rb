class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image,                null: false
      t.string :name,                 null: false
      t.text :story,                  null: false
      t.integer :category_id,         null: false
      t.integer :status_id,           null: false
      t.integer :delivery_fee_id,     null: false
      t.integer :shipping_address_id, null: false
      t.integer :delivery_date_id,    null: false
      t.integer :price,               null: false
      t.references :user,             null: false, foreign_key: true
    end
  end
end
