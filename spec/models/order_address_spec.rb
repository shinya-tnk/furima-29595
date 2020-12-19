require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入情報の保存' do
    context '購入機能がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存される' do
        expect(@order_address).to be_valid
      end

      it '建物名がなくても保存できる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '購入機能がうまくいかないとき' do
      it 'クレジットカード情報がないとき' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('クレジットカード情報を入力してください')
      end

      it '郵便番号がない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号が入力されていません。', '郵便番号はハイフンが必要です')
      end

      it '郵便番号にハイフンがない' do
        @order_address.postal_code = 1_234_567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号はハイフンが必要です')
      end

      it '都道府県が選択されていない' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('都道府県を選択してください')
      end

      it '都道府県のidが1' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('都道府県を選択してください')
      end

      it '市町村がない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('市町村を入力してください')
      end

      it '番地がない' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('番地を入力してください')
      end

      it '電話番号がない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号を入力してください')
      end

      it '電話番号が全角' do
        @order_address.phone_number = '０９０ー１１２２ー３３４４'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号はハイフンを含まない11桁以内の半角数字で入力してください')
      end

      it '電話番号が12桁以上ある' do
        @order_address.phone_number = '080112233445'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号はハイフンを含まない11桁以内の半角数字で入力してください')
      end
    end
  end
end
