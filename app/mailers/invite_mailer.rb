class InviteMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  #def self.new_user_invite(invite, signup_url)
    #subject    'Invite'
    #recipients invite.recipient_email
    #from       'example@gmail.com'
    #body       :invite => invite, :signup_url => signup_url
    #invite.update_attribute(:sent_at, Time.now)
  #end

  def new_user_invite(invite, signup_url)
    @signup_url = signup_url
    #invite.update_attribute(:sent_at, Time.now)
    mail(to: invite.email, subject: 'Invite')
  end

  def invite
    @greeting = "Hi"
    mail to: "to@example.org"
  end
end
