require 'rails_helper'

RSpec.describe OrderShippingInformation, type: :model do
  describe '購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_shipping_information = FactoryBot.build(:order_shipping_information, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '購入出来る場合' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@order_shipping_information).to be_valid
      end

      it 'building_nameが空でも購入できる' do
        @order_shipping_information.building_name = ''
        expect(@order_shipping_information).to be_valid
      end
    end

    context '購入できない場合' do
      it 'post_codeが空だと購入できない' do
        @order_shipping_information.post_code = ''
        @order_shipping_information.valid?
        expect(@order_shipping_information.errors.full_messages).to include('郵便番号を入力してください')
      end

      it 'post_codeにハイフンがないと購入できない' do
        @order_shipping_information.post_code = '1234567'
        @order_shipping_information.valid?
        expect(@order_shipping_information.errors.full_messages).to include('郵便番号は不正な値です')
      end

      it 'post_codeが全角だと購入できない' do
        @order_shipping_information.post_code = '１２３−４５６７'
        @order_shipping_information.valid?
        expect(@order_shipping_information.errors.full_messages).to include('郵便番号は不正な値です')
      end

      it 'prefectures_idが---だと購入できない' do
        @order_shipping_information.prefectures_id = 1
        @order_shipping_information.valid?
        expect(@order_shipping_information.errors.full_messages).to include('都道府県を選択してください')
      end

      it 'municipalitiesが空だと購入できない' do
        @order_shipping_information.municipalities = ''
        @order_shipping_information.valid?
        expect(@order_shipping_information.errors.full_messages).to include('市区町村を入力してください')
      end

      it 'addressが空だと購入できない' do
        @order_shipping_information.address = ''
        @order_shipping_information.valid?
        expect(@order_shipping_information.errors.full_messages).to include('番地を入力してください')
      end

      it 'telephone_numberが空だと購入できない' do
        @order_shipping_information.telephone_number = ''
        @order_shipping_information.valid?
        expect(@order_shipping_information.errors.full_messages).to include('電話番号を入力してください')
      end

      it 'telephone_numberが全角だと購入できない' do
        @order_shipping_information.telephone_number = '０９０１２３４５６７８'
        @order_shipping_information.valid?
        expect(@order_shipping_information.errors.full_messages).to include('電話番号は不正な値です')
      end

      it 'telephone_numberが9桁以内だと購入できない' do
        @order_shipping_information.telephone_number = '090123456'
        @order_shipping_information.valid?
        expect(@order_shipping_information.errors.full_messages).to include('電話番号は不正な値です')
      end

      it 'telephone_numberが12桁以上だと購入できない' do
        @order_shipping_information.telephone_number = '090123456789'
        @order_shipping_information.valid?
        expect(@order_shipping_information.errors.full_messages).to include('電話番号は不正な値です')
      end

      it 'tokenが空だと購入できない' do
        @order_shipping_information.token = ''
        @order_shipping_information.valid?
        expect(@order_shipping_information.errors.full_messages).to include('クレジットカードを入力してください')
      end

      it 'user_idが紐付いていないと購入できない' do
        @order_shipping_information.user_id = nil
        @order_shipping_information.valid?
        expect(@order_shipping_information.errors.full_messages).to include('Userを入力してください')
      end

      it 'item_idが紐付いていないと購入できない' do
        @order_shipping_information.item_id = nil
        @order_shipping_information.valid?
        expect(@order_shipping_information.errors.full_messages).to include('Itemを入力してください')
      end
    end
  end
end
