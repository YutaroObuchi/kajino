class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
  	@group = Group.create(group_params)
     if @group.save
       redirect_to new_group_path, success: t('.success')
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
