class OrdersController < ApplicationController
	before_action :move_to_index

	def index
		@item = Item.find(params[:item_id])
	end
	

	def create
 		@item = Item.find(params[:item_id])
		@order =  UserOrder.new(user_order_params)
		if @order.valid?
			pay_item
			@order.save
			return redirect_to root_path
		else
			render 'index'
		end
	end

	

	private
	
	def move_to_index
		unless user_signed_in?
      redirect_to new_user_session_path
    end
	end

	def user_item_params 
		item = Item.find(params[:item_id])
	end
  
	def user_order_params
		params.permit(:token, :post_number, :shipping_address_id, :address, :address_number, :house_name, :phone_number, :item_id).merge(user_id: current_user.id) #javascriptで利用
	end 
  

	def pay_item
		Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
		Payjp:: Charge.create(
			amount: user_item_params.price,
			card: user_order_params[:token],
			currency:'jpy'
		)
	end
end



