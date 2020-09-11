require 'rails_helper'

RSpec.describe AdressOrders, type: :model do
  before do
    @order = FactoryBot.build(:adress_orders)
  end
    
  describe '商品購入機能' do
   
    context '商品購入がうまくいくとき' do
      it 'すべての条件を満たしている時' do
      expect(@order).to be_valid
      end
    end


    context '商品購入がうまくいかないとき' do
      it 'tokenの情報がなければ購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_numberが空では購入できない' do
        @order.post_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post number can't be blank")
      end
      it 'post_numberが7桁、ハイフンがなければ購入できない' do
        @order.post_number = '810-0022'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post number can't be blank")
      end
      it 'prefectureが1だと購入できない' do
        @order.prefecture = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できない' do
        @order.city = 'nil'
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'adressが空だと購入できない' do
        @order.adress = 'nil'
        @order.valid?
        expect(@order.errors.full_messages).to include("Adress can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @order.phone_number = 'nil'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone_number can't be blank")
      end
      it 'phone_numberが半角数字で入力しないと購入できない' do
        @order.phone_number = '１２３全角'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone_number can't be blank")
      end
      it 'phone_numberはハイフン不要で１１桁以内で入力しないと購入できない' do
        @order.phone_number = '123456789-1234'
        @order.valid?
        binding.pry
        expect(@order.errors.full_messages).to include("Phone_number can't be blank")
      end
    end
  end
 end
