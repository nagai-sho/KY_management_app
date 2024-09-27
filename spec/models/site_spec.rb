require 'rails_helper'

RSpec.describe Site, type: :model do
  before do
    @site = FactoryBot.build(:site)
  end

  describe '現場名の作成' do
    context '現場名が作成できる' do
      it '全ての項目が入力されていれば作成できる' do
        expect(@site).to be_valid
      end
      it '郵便番号が無くても作成できる' do
        @site.postal_code = ''
        expect(@site).to be_valid
      end
      it '住所が無くても作成できる' do
        @site.address = ''
        expect(@site).to be_valid
      end
    end
    context '現場名が作成できない' do
      it 'nameが無ければ作成できない' do
        @site.name = ''
        @site.valid?
        expect(@site.errors.full_messages).to include("Name can't be blank")
      end
      it '重複したnameが入力されれば作成できない' do
        @site.save
        another_user = FactoryBot.build(:site, name: @site.name )
        another_user.name = @site.name
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Name has already been taken")
      end
      it '郵便番号が「3桁の数字-4桁の数字」の形式でなければ作成できない' do
        @site.postal_code = '1234-567'
        @site.valid?
        expect(@site.errors.full_messages).to include("Postal code は「123-4567」の形式で入力してください")
      end
    end
  end
end
