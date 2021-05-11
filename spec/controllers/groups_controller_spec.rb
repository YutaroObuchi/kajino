require 'rails_helper'
RSpec.describe 'グループ機能', type: :system do

  let(:group) {create :group}

  describe 'グループの作成' do
   before do
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

    fit 'グループ作成後マイページに遷移することができる' do
      visit group_path(group)
      expect(page).to have_content '今週の家事の割合'
    end
  end

end
