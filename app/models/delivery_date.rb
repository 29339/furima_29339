class DeliveryDate < ActiveHash::Base
	self.data = [
		{ id: 1, name: '---' },
		{ id: 2, name: '１〜2日で配送' },
		{ id: 3, name: '２〜3日で配送' },
		{ id: 4, name: '４〜7日で配送' }
	]
end
