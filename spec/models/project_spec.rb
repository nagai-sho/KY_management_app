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
      it '受注先が無くても作成できる' do
        @project.client = ''
        expect(@project).to be_valid
      end
      it '着工日が無くても作成できる' do
        @project.construction_start = ''
        expect(@project).to be_valid
      end
      it '竣工日が無くても作成できる' do
        @project.construction_completion = ''
        expect(@project).to be_valid
      end
      it '工事内容が無くても作成できる' do
        @project.construction_content = ''
        expect(@project).to be_valid
      end
    end

    context '工事件名が作成できない' do
      it 'name が無いと作成できない' do
        @project.name = ''
        @project.valid?
        expect(@project.errors.full_messages).to include("Name can't be blank")
      end
      it 'site_id が無いと作成できない' do
        @project.site_id = nil
        @project.valid?
        expect(@project.errors.full_messages).to include("Site must exist")
      end
    end
  end
end
