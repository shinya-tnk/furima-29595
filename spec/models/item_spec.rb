require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品登録機能' do
    context '出品登録がうまくいくとき' do
      it 'すべて存在する' do
        expect(@item).to be_valid
      end
    end

    context '出品登録がうまくいかないとき' do
      it '画像がない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像を選択してください')
      end
      it '商品名がない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it '商品の説明がない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end
      it 'カテゴリー情報がない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it '商品の状態の情報がない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end
      it '配送料についての情報がない' do
        @item.postage_type_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it '発送元の地域についての情報がない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end
      it '発送までの日数の情報がない' do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end
      it '価格が未入力' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力してください', '価格は数値で入力してください')
      end
      it '価格が299円以下' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it '価格が10,000,000円以上' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end
      it '販売価格が半角数字でない' do
        @item.price = '６６６'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
    end
  end
end
