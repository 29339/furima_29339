require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'imageとname、storyとcategory_idm、status_idとdelivery_fee、shipping_addressとdelivery_date、priceとuser_idが存在すれば登録できること' do
        expect(@item.user).to be_valid
      end
      it 'priceが300~9999999であれば登録できる' do
        @item.price = '1234'
        expect(@item.user).to be_valid
      end
      it 'priceが半角数字であれば登録できる' do
        @item.price = '1234'
        expect(@item.user).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'storyが空では登録できないこと' do
        @item.story = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Story can't be blank")
      end
      it 'category_idが---では登録できないこと' do
        @item.category_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it 'status_idが---であれば登録できないこと' do
        @item.status_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end
      it 'delivery_feeが---では登録できないこと' do
        @item.delivery_fee_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee Select')
      end
      it 'shipping_addressが---では登録できないこと' do
        @item.shipping_address_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping address Select')
      end
      it 'delivery_dateが---では登録できないこと' do
        @item.delivery_date_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery date Select')
      end
      it 'priceが300未満であれば登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが10000000以上であれば登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
