class InvitesController < ApplicationController
  def new
  	insert_setup
  	@invite = Invite.new
  end

  def create
    @invite = Invite.new(invite_params)
    @invite.sender_id = current_user.id
    if @invite.save
      InviteMailer.new_user_invite(@invite, new_user_path(invite_token: @invite.token)).deliver
    else
      render :new
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:email)
  end
end
