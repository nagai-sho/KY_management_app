require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'user登録' do
    context 'user登録ができる' do
      it '全ての入力があればuser登録ができる' do
      end
      it 'positionが無くてもuser登録ができる' do
      end
    end
    context 'user登録ができない' do
      it 'companyが無いとuser登録ができない' do
      end
      it 'nameが無いとuser登録ができない' do
      end
      it 'name_kanaが無いとuser登録ができない' do
      end
      it 'name_kanaがカタカナ以外ではuser登録ができない' do
      end
      it 'mailが無いとuser登録ができない' do
      end
      it 'mailに@が無いとuser登録ができない' do
      end
      it '同じmailが入力されるとuser登録ができない' do
      end
      it 'passwordが無いとuser登録ができない' do
      end
      it 'passwordが5文字以下ではuser登録ができない' do
      end
      it 'passwordが129文字以上ではuser登録ができない' do
      end
      it 'passwordとpassword_confirmationが一致しないとuser登録ができない' do
      end
      it 'phone_numberが無いとuser登録ができない' do
      end
      it '同じphone_numberが入力されるとuser登録ができない' do
      end
    end
  end
end