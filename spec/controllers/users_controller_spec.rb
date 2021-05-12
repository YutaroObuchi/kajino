require 'rails_helper'
RSpec.describe 'ユーザー作成', type: :system do
  let(:user) {create :user}

  describe 'ユーザーの作成' do
   before do
     login(user)
     visit new_user_path
   end

    it 'ユーザーの作成を正常に行うことができる' do
      fill_in 'ユーザー名', with: 'サンプルユーザー'
      fill_in 'メールアドレス', with: 'aaa@gmail.com'
      fill_in 'パスワード', with: 111111
      fill_in 'パスワード確認', with: 111111
      click_button '新規登録'
      expect(current_path).to eq login_path
    end

    it 'パスワードが5文字以下の場合ユーザー作成ができない' do
      fill_in 'ユーザー名', with: 'サンプルユーザー'
      fill_in 'メールアドレス', with: 'aaa@gmail.com'
      fill_in 'パスワード', with: 11111
      fill_in 'パスワード確認', with: 11111
      click_button '新規登録'
      expect(page).to have_content 'ユーザー登録に失敗しました'
    end

    it 'パスワード確認が入力されていない場合ユーザー作成ができない' do
      fill_in 'ユーザー名', with: 'サンプルユーザー'
      fill_in 'メールアドレス', with: 'aaa@gmail.com'
      fill_in 'パスワード', with: 111111
      fill_in 'パスワード確認', with: ""
      click_button '新規登録'
      expect(page).to have_content 'ユーザー登録に失敗しました'
    end

    it '同じメールアドレスが登録されていた場合、ユーザー作成ができない' do
      fill_in 'ユーザー名', with: 'サンプルユーザー'
      fill_in 'メールアドレス', with: 'zzz@gamil.com'
      fill_in 'パスワード', with: 111111
      fill_in 'パスワード確認', with: 111111
      click_button '新規登録'
      expect(page).to have_content 'ユーザー登録に失敗しました'
    end
  end
end
