require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/image.jpg')
    end

    context '商品出品がうまくいくとき' do
      it 'すべての条件を満たしている時' do
      @item.valid?
      expect(@item).to be_valid
    end

    context '商品出品がうまくいかないとき' do
      it '画像がなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空では出品できない' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("info can't be blank")
      end

      it 'カテゴリーの情報が空では出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("category_id can't be blank")
      end
      it '商品の状態についての情報が空では出品できない' do
        @item.items_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("items_status_id can't be blank")
      end
      it '配送料の負担についての情報が空では出品できない' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("shipping_fee_id can't be blank")
      end
      it '発送元の地域についての情報が空では出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("prefecture_id can't be blank")
      end
      it '発送までの日数についての情報が空では出品できない' do
        @item.scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("scheduled_delivery_id can't be blank")
      end
      it '価格についての情報が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("price can't be blank")
      end
      it '価格の範囲が、¥299以下であれば出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("price can't be blank")
      end
      it '価格の範囲が、¥9,999,999以上であれば出品できない' do
        @item.price = 10_000_000
        binding.pry
        @item.valid?
        expect(@item.errors.full_messages).to include("price can't be blank")
      end
      it '販売価格は半角数字のみでないと出品できない' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("price can't be blank")
      end
    end
  end
end
