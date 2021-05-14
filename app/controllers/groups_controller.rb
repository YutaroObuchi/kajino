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

  def show;end

  def percentage

  end

  private

  def group_params
  	params.require(:group).permit(:name)
  end
end
