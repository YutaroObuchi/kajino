class InvitesController < ApplicationController

  def new
  	@invite = Invite.new
  	insert_setup
  	@invite.group_id = @group.id
  end

  def create
    @invite = Invite.new(invite_params)
    @invite.sender_id = current_user.id
    @group = current_user.groups[0].id

    if @invite.save

      if @invite.recipient != nil
        InviteMailer.existing_user_invite(@invite).deliver
        @invite.recipient.groups.push(@invite.group)
        redirect_to new_group_housework_path(@group), success: "招待メールを送信しました"
      else
        InviteMailer.new_user_invite(@invite, new_user_path(invite_token: @invite.token)).deliver
        redirect_to new_group_housework_path(@group), success: "招待メールを送信しました"
      end
    else
      flash.now[:danger] = "送信に失敗しました"
      render :new
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:email, :recipient_id, :group_id, :sender_id)
  end
end
