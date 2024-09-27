require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'user登録' do
    context 'user登録ができる' do
      it '全ての入力があればuser登録ができる' do
        expect(@user).to be_valid
      end
      it 'positionが無くてもuser登録ができる' do
        @user.position = ''
        expect(@user).to be_valid
      end
    end
    context 'user登録ができない' do
      it 'companyが無いとuser登録ができない' do
        @user.company = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Company can't be blank")
      end
      it 'nameが無いとuser登録ができない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'name_kanaが無いとuser登録ができない' do
        @user.name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana can't be blank")
      end
      it 'name_kanaがカタカナ以外ではuser登録ができない' do
        @user.name_kana = '山田　たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana はカタカナで入力してください")
      end
      it 'mailが無いとuser登録ができない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'mailに@が無いとuser登録ができない' do
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '同じmailが入力されるとuser登録ができない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが無いとuser登録ができない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下ではuser登録ができない' do
        @user.password = '8fahA'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが129文字以上ではuser登録ができない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'passwordとpassword_confirmationが一致しないとuser登録ができない' do
        @user.password = '8fahAA'
        @user.password_confirmation = '8fahAB'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'phone_numberが無いとuser登録ができない' do
        @user.phone_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number can't be blank")
      end
      it '同じphone_numberが入力されるとuser登録ができない' do
        @user.save
        another_user = FactoryBot.build(:user, phone_number: @user.phone_number)
        another_user.phone_number = @user.phone_number
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Phone number has already been taken")
      end
    end
  end
end