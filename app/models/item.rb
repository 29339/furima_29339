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
  validates :price, length: { in: 300...9999999, message: 'Half-width number' }, format: { with: /\A[0-9]+\z/, message: 'Out of setting range' }
  validates :category_id, :status_id, :delivery_fee_id, :shipping_address_id, :delivery_date_id, numericality: { other_than: 1, message: 'Select' }
end
