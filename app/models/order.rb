class Order < ApplicationRecord

	has_one :order_datum
	belongs_to :user
	belongs_to :item

end
