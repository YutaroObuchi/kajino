require 'rails_helper'
RSpec.describe '招待機能', type: :system do

  let(:user) {create :user}
  let(:partner) { create :user, :partner }
  let(:group) {create :group}


  before do
    login(user)
    login(partner)
    creategroup
  end

  describe 'ユーザーのグループ招待について' do
    describe '招待メールの送信'do
      let(:mail) { InviteMailer.existing_user_invite(partner) }

      fit 'ユーザーに招待メールを送ることができる' do
        fill_in 'Email', with: 'partner@gamil.com'
        click_button '招待する'
        expect(mail.subject).to eq('Invite')
        expect(mail.to).to eq(['partner@gamil.com'])
        expect(mail.from).to eq(['from@example.com'])
        expect(mail.body.encoded).to match('http://localhost:3000/login')
        expect(page).to have_content '招待メールを送信しました'
      end
    end
  end
end