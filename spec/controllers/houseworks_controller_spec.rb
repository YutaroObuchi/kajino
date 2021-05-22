require 'rails_helper'
RSpec.describe 'グループ機能', type: :system do

  let(:user) {create :user}
  let(:group) {create :group}

  before do
    login(user)
    creategroup
  end

  describe 'ハウスワークについて' do

    describe 'ハウスワークの作成について' do
      before do
        visit new_group_housework_path(group.id)
      end

      it 'ハウスワークを1度に複数作成することができる' do
        page.all('.form-control')[1].set(10)
        page.all('.form-control')[3].set(10)
        page.all('.form-control')[5].set(10)
        page.all('.form-control')[7].set(10)
        page.all('.form-control')[9].set(10)
        click_button 'ポイントを付与する'
        expect(page).to have_content '家事が登録されました'
      end

      it '1つのハウスワークに10ポイント以上付与することができない' do
        page.all('.form-control')[3].set(100)
        click_button 'ポイントを付与する'
        expect(page).to have_content '各家事の負担をポイントで教えてください(最大10ポイント)'
      end
    end

    describe 'ハウスワークの編集について'do
      before do
        create_houseworks(group)
        visit group_houseworks_path(group.id)
      end

      it 'ハウスワークポイントが正常に編集することができる' do
        click_on 'この家事を編集する', match: :first
        page.all('.form-control')[1].set(3)
        click_button 'ポイントを編集する'
        expect(page).to have_content '家事ポイントを更新しました'
      end
      it 'scoreに10以上の数値を入れると編集ができない' do
        click_on 'この家事を編集する', match: :first
        page.all('.form-control')[1].set(100)
        click_button 'ポイントを編集する'
        expect(page).to have_content '家事ポイントを編集する'
      end
    end
  end
end