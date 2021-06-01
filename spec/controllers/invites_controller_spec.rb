require 'rails_helper'
RSpec.describe '招待機能', type: :system do

  let(:user) {create :user}
  let(:group) {create :group}

  before do
    login(user)
    creategroup
    binding.pry
    visit group_path(group)
  end

  describe 'ユーザーのグループ招待について' do
    describe '招待メールの送信'do

      fit '登録してないユーザーに招待メールを送ることができる' do
        click_button 'グループに招待する'
        fill_in 'メールアドレス', with: 'aaasample@gmail.com'
        click_button '招待する'
        expect(mail.subject).to eq('Invite')
        expect(mail.to).to eq(['aaasample@gmail.com'])
        expect(mail.from).to eq(['kajinomail88@gmail.com'])
        expect(mail.body.encoded).to match('/users/new')
        expect(page).to have_content '招待メールを送信しました'
      end
    end
  end
end