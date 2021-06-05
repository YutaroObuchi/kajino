require 'rails_helper'
RSpec.describe 'グループ機能', type: :system do

  let(:group) {create :group}
  let(:user) {create :user}
  let(:partner) { create :user, :partner ,:only_login_user }

  describe 'グループの作成' do
   before do
     login(user)
     visit new_group_path
   end

    it 'グループの作成を正常に行うことができる' do
      fill_in 'グループ名', with: 'サンプルグループ'
      click_button '作成'
      expect(page).to have_content 'グループが作成されました'
    end

    it 'グループ名を空白で入力すると失敗する' do
      fill_in 'グループ名', with: ""
      click_button '作成'
      expect(page).to have_content 'グループ作成に失敗しました'
    end
  end

  describe 'マイページ機能' do
    before do
      login(user)
    end

    it 'グループ作成後マイページに遷移することができる' do
      visit group_path(group)
      expect(page).to have_content '今週の家事割合'
    end
  end

  describe 'マイページ内で家事ポイントをグラフで見ることができる' do
    fit '今日の家事を入力したら、グラフに表示される' do
      visit new_user_path
      fill_in 'ユーザー名', with: '999999'
      fill_in 'メールアドレス', with: '999999@999'
      fill_in 'パスワード', with: '999999'
      fill_in 'パスワード確認', with: '999999'
      click_button '新規登録'
      visit new_user_path
      fill_in 'ユーザー名', with: 'サンプルさん'
      fill_in 'メールアドレス', with: 'sample@aaa.com'
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード確認', with: 'password'
      click_button '新規登録'
      fill_in 'メールアドレス', with: 'sample@aaa.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
      fill_in 'グループ名', with: 'sampleグループ'
      click_button '作成'
      fill_in 'Email', with: '999999@999'
      click_button '招待する'
      page.all('.form-control')[1].set(10)
      page.all('.form-control')[3].set(10)
      page.all('.form-control')[5].set(10)
      page.all('.form-control')[7].set(10)
      page.all('.form-control')[9].set(10)
      click_button 'ポイントを付与する'
      click_on '今日の家事を入力する'
      page.all('.form-control')[0].set(10)
      page.all('.form-control')[1].set(10)
      page.all('.form-control')[2].set(10)
      page.all('.form-control')[3].set(10)
      page.all('.form-control')[4].set(10)
      click_button '入力する'
      click_on 'ログアウト'
      click_on 'ログイン'
      fill_in 'メールアドレス', with: '999999@999'
      fill_in 'パスワード', with: '999999'
      click_button 'ログイン'
      click_on '今日の家事を入力する'
      page.all('.form-control')[0].set(10)
      page.all('.form-control')[1].set(10)
      page.all('.form-control')[2].set(10)
      page.all('.form-control')[3].set(10)
      page.all('.form-control')[4].set(10)
      click_button '入力する'
      expect(page).to have_content 'サンプルさん'
    end
  end
end
