class HouseworksController < ApplicationController
  def new
  	@housework = Housework.new
  	search_record = GroupUser.find_by(user_id: current_user.id)
  	@group = Group.find(search_record.group_id)
  	@time = Time.current
  end

  def create
    array =  params[:housework][:houseworks]
    if Housework.insert_all(array)
      redirect_to group_path(current_user.group_users), success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def edit

  end

  def update

  end

  private

  def housework_params
  	params.require(:housework).permit(houseworks: [%w(name score created_at updated_at)])
  end
end
