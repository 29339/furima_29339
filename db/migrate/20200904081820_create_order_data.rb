class CreateOrderData < ActiveRecord::Migration[6.0]
  def change
    create_table :order_data do |t|
      t.string :post_number,           null: false
      t.integer :shipping_address_id,  null: false
      t.string :address,               null: false
      t.string :address_number,        null: false
      t.string :house_name
      t.string :phone_number,          null: false
      t.references :order,             null: false, foreign_key: true
    end
  end
end
