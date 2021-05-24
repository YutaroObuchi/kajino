class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @user = current_user
    @group = @user.groups.build(group_params)
     if @user.save
       redirect_to group_path(@group), success: t('.success')
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
  end


  private

  def group_params
  	params.require(:group).permit(:name)
  end

  def identify_partner
    array = GroupUser.where.not(user_id: current_user.id)
    @partner_date = array.first
    @partner = User.find_by(id: @partner_date.user_id)
  end

  def percentage
    your_sums = Calculation.where(user_id: current_user.id).sum(:sum)
    partner_sums = Calculation.where(user_id: @partner.id).sum(:sum)
    group_sum = your_sums + partner_sums
    @yours = your_sums/group_sum.to_f*100
    @partners = partner_sums/group_sum.to_f*100
    @yours_last = @yours.ceil(1)
    @partners_last = @partners.ceil(1)
  end
end
