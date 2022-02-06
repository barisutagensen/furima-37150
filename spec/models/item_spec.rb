require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品登録機能' do
    context '商品出品できる場合'
    it 'すべての項目の入力が存在すれば出品できる' do
      expect(@item).to be_valid
    end

    context '商品出品ができない場合' do
      it '商品名が空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品画像が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品の説明が空だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it '商品のカテゴリーがないと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を選択してください')
      end

      it '商品の状態の情報がないと出品できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition を選択してください')
      end

      it '配送料負担の情報がないと出品できない' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee を選択してください')
      end

      it '発送元の地域の情報がないと出品できない' do
        @item.prefectures_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefectures を選択してください')
      end

      it '発送までの日数の情報がないと出品できない' do
        @item.shipping_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping time を選択してください')
      end

      it '価格の情報がないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が¥300より少ない時は出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格が¥9,999,999より高い時は出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '価格が全角数値だと出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
