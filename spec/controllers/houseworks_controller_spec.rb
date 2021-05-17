require 'rails_helper'
RSpec.describe 'グループ機能', type: :system do

  let(:user) {create :user}
  let(:group) {create :group}

  before do
    login(user)
    creategroup
    visit new_housework_path
  end

  describe 'ハウスワークについて' do

    describe 'ハウスワークの作成について' do
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
  end
end