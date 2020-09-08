require 'rails_helper'
describe UserOrder do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '注文者情報登録' do
    context '注文者情報登録がうまくいくとき' do
      it 'tokenとpost_numberとshipping_address_idとaddressとaddress_numberとphone_numberがあれば登録できる' do
        expect(@user_order).to be_valid
      end
      it 'post_numberにハイフンがあり7文字であれば登録できる' do
        @user_order.post_number = '150-0034'
        expect(@user_order).to be_valid
      end
      it 'phone_numberにハイフンがなくて、11桁以内であれば登録できる' do
        @user_order.phone_number = '08015599188'
        expect(@user_order).to be_valid
      end
    end

    context '注文者情報登録がうまく行かないとき' do
      it 'tokenがからだと登録できない' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_numberにハイフンがないと登録できない' do
        @user_order.post_number = '1500034'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Post number Input correctly')
      end
      it 'post_numberが空だと登録できない' do
        @user_order.post_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post number can't be blank")
      end
      it 'shipping_address_idが---だと登録できない' do
        @user_order.shipping_address_id = '---'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Shipping address Select')
      end
      it 'addressが空だと登録できない' do
        @user_order.address = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end
      it 'address_numberが空だと登録できない' do
        @user_order.address_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address number can't be blank")
      end
      it 'phone_numbeにハイフンがあって１１行以上だと登録できない' do
        @user_order.phone_number = '150-000000000'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
