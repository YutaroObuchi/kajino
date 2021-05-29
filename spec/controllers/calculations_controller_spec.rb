require 'rails_helper'
RSpec.describe 'houseworkポイントの計算', type: :system do

  let(:group) {create :group}
  let(:user) {create :user}
  let(:partner) {create :partner}

  before do
    login(user)
    creategroup
    create_houseworks(group)
  end

  describe '日次の家事の入力について' do
    before do
      login(partner)
      visit new_calculation_path
    end
    it '入力が正常に動作する' do
      fill_in 'お風呂掃除', with: 1
      fill_in '食器洗い', with: 3
      fill_in '洗濯', with: 0
      fill_in '掃除機かけ', with: 1
      fill_in '料理', with: 3
      click_button '入力する'
      expect(page).to have_content '今日の家事が入力されました'
    end
  end
end
