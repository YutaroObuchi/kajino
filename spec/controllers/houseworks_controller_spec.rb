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
        visit new_housework_path
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
        page.all('.form-control')[1].set(10)
        page.all('.form-control')[3].set(100)
        click_button 'ポイントを付与する'
        expect(page).to have_content '各家事の負担をポイントで教えてください(最大10ポイント)'
      end
    end

    describe 'ハウスワークの編集について'do
      #before do
        #Createhouseworks
        #visit houseworks_path
      #end

      fit 'ハウスワークポイントが正常に編集することができる' do
        visit new_housework_path
        page.all('.form-control')[1].set(10)
        page.all('.form-control')[3].set(10)
        page.all('.form-control')[5].set(10)
        page.all('.form-control')[7].set(10)
        page.all('.form-control')[9].set(10)
        visit houseworks_path
        click_button 'ポイントを付与する'
        click_button 'この家事を編集する'
        find("#score").set(3)
        click_button 'ポイントを編集する'
        expect(page).to have_content '家事ポイントを更新しました'
      end
    end
  end
end