class Item < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions
	belongs_to_active_hash :category
	belongs_to_active_hash :status
	belongs_to_active_hash :delivery_fee
	belongs_to_active_hash :shipping_address
	belongs_to_active_hash :delivery_date
	belongs_to :user
	has_one_attached :image

	validates :image, :name, :story, :category_id, :status_id, :delivery_fee_id, :shipping_address_id, :delivery_date_id, :price, :user_id, presence: true
  validates :price, length: { in: 3...7, message: "nil"  }, format: { with: /\A[0-9]+\z/ }
	validates :category_id, :status_id, :delivery_fee_id, :shipping_address_id, :delivery_date_id, numericality: { other_than: 1, message: "Select" }
	
end