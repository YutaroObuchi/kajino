class HouseworksController < ApplicationController
  def new
  	@housework = Housework.new
  end

  def create
    search_record = GroupUser.find_by(user_id: current_user.id)
    group = Group.find(search_record.group_id)
    @housework = group.houseworks.build(housework_params)

    if @housework.save
      redirect_to root_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  private

  def housework_params
  	params.require(:housework).permit(:name, :score)
  end
end
