class UserOrder

  include ActiveModel::Model
	attr_accessor :user_id, :item_id, :token, :post_number, :shipping_address_id, :address, :address_number, :house_name, :phone_number

	validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
	validates :phone_number, format: { with: /\A\d{11}\z/ }
	validates :shipping_address_id, numericality: { other_than: 1, message: 'Select' }
	validates :token, :address, :address_number, :post_number, presence: true
	
	def save

	order  =	Order.create!(user_id: user_id,item_id: item_id)

		OrderDatum.create!(post_number: post_number, shipping_address_id: shipping_address_id , address: address, address_number: address_number, house_name: house_name, phone_number: phone_number, order_id: order.id)
	
	end

end