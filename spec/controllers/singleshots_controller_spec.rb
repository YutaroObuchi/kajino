require 'rails_helper'
RSpec.describe '簡易版機能', type: :system do

  describe '簡易版家事投稿機能について' do
   before do
     visit new_singleshot_path
   end

    it 'ログインなしで家事比率を計算することができる' do
      fill_in 'singleshot[your_name]', with: 'サンプル太郎'
      fill_in 'singleshot[partner_name]', with: 'サンプル狸'
      click_button '送信'
      expect(page).to have_content '残りあと3問です！'
      fill_in 'singleshot[cook_point]', with: 20
      fill_in 'singleshot[dish_washing_point]', with: 20
      fill_in 'singleshot[laundry_point]', with: 20
      fill_in 'singleshot[bath_washing_point]', with: 20
      fill_in 'singleshot[vacuum_point]', with: 20
      click_button '送信'
      expect(page).to have_content '残り2問です！'
      fill_in 'your_cook', with: 1
      fill_in 'your_dish_washing', with: 1
      fill_in 'your_laundry', with: 1
      fill_in 'your_bath_washing', with: 1
      fill_in 'your_vacuum', with: 1
      click_button '送信'
      expect(page).to have_content 'ラスト1問！'
      fill_in 'partner_cook', with: 1
      fill_in 'partner_dish_washing', with: 1
      fill_in 'partner_laundry', with: 1
      fill_in 'partner_bath_washing', with: 1
      fill_in 'partner_vacuum', with: 1
      click_button '送信'
      expect(page).to have_content '家事負担の割合を確認しましょう！'
    end

    it '名前を入力しないとバリデーションに引っかかる' do
      fill_in 'singleshot[your_name]', with: 'サンプル太郎'
      fill_in 'singleshot[partner_name]', with: ''
      click_button '送信'
      expect(page).to have_content '入力に不備があります'
    end
  end
end
