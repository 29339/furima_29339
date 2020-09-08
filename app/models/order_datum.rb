class OrderDatum < ApplicationRecord

	belongs_to :order

	# validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
	# validates :phone_number, format: { with: /\A\d{11}\z/ }
	# validates :shipping_address_id, numericality: { other_than: 1, message: 'Select' }
	# validates :token, :address, :address_number, presence: true
  
end

