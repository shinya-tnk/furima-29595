require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'すべて存在する' do
        expect(@user).to be_valid
      end
      it 'emailが@を含んでいる' do
        @user.email = 'sample@sample.com'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上ある' do
        @user.password = '1234ab'
        @user.password_confirmation = '1234ab'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合であること' do
        @user.password = 'abcd1234'
        @user.password_confirmation = 'abcd1234'
        expect(@user).to be_valid
      end
      it 'family_name, first_name, family_name_kana, first_name_kanaが全角である' do
        @user.family_name = '山田'
        @user.first_name = '太郎'
        @user.family_name_kana = 'ヤマダ'
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it 'emailが重複している' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスは既に使用されています。')
      end
      it 'emailが@を含んでいない' do
        @user.email = 'sample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを正しく入力してください')
      end
      it 'passwordが空' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください', 'パスワードは6文字以上の半角英数字混合で入力してください')
      end
      it 'passwordが5文字以下' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上の半角英数字混合で入力してください')
      end
      it 'passwordが全角' do
        @user.password = 'あいうえおかきくけこ'
        @user.password_confirmation = 'あいうえおかきくけこ'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上の半角英数字混合で入力してください')
      end
      it 'family_nameが空' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('性を入力してください')
      end
      it 'family_nameが半角' do
        @user.family_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('性は全角で入力してください')
      end
      it 'first_nameが空' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名を入力してください')
      end
      it 'first_nameが半角' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('名は全角で入力してください')
      end
      it 'family_name_kanaが空' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('フリガナ（性）を入力してください')
      end
      it 'family_name_kanaが半角' do
        @user.family_name_kana = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('フリガナ（性）は全角カナで入力してください')
      end
      it 'first_name_kanaが空' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('フリガナ（名）を入力してください')
      end
      it 'first_name_kanaが半角' do
        @user.first_name_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('フリガナ（名）は全角カナで入力してください')
      end
      it 'passwordが存在してもpassword_confirmationが空' do
        @user.password = '1234abcd'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('確認用パスワードがパスワードと一致していません')
      end
    end
  end
end
