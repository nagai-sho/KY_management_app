require 'rails_helper'

RSpec.describe Project, type: :model do
  before do
    @site = FactoryBot.create(:site)
    @project = FactoryBot.create(:project, site: @site)
  end

  describe '工事件名の作成' do
    context '工事件名が作成できる' do
      it '全ての項目が入力されていれば作成できる' do
        expect(@project).to be_valid
      end
    end

    context '工事件名が作成できない' do
      it 'site_id が無いと作成できない' do
        
      end
    end
  end
end
