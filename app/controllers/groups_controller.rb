class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @user = current_user
    @group = @user.groups.build(group_params)
     if @user.save
       redirect_to new_invite_path, success: "メンバーを招待しましょう"
     else
       flash.now[:danger] = t('.fail')
       render :new
     end
  end

  def show
    @date = GroupUser.find_by(user_id: current_user.id)
    @group = Group.find_by(id: @date.group_id)
    identify_partner
    percentage
    unless @yours.blank?
      @sum = [[current_user.name, @yours], [@partner_name.name, @partners]]
    end
  end


  private

  def group_params
  	params.require(:group).permit(:name)
  end

  def identify_partner
    group_number = current_user.group_users[0].group_id
    array = GroupUser.where(group_id: group_number)
    @partner_array = array.where.not(user_id: current_user.id)

    unless @partner_array.blank?
      @partner = @partner_array[0].user_id
      @partner_name = User.find_by(id: @partner)
    end
  end

  def percentage
    unless @partner.blank?
      @week = Time.current.all_week
      your_sums = Calculation.where(user_id: current_user.id, created_at: @week).sum(:sum)
      partner_sums = Calculation.where(user_id: @partner, created_at: @week).sum(:sum)
      group_sum = your_sums + partner_sums
      @yours = your_sums/group_sum.to_f*100
      @partners = partner_sums/group_sum.to_f*100
    end
  end
end
