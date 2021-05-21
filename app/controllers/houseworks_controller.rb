class HouseworksController < ApplicationController

  def index
    insert_setup
    @houseworks = Housework.includes(:group).where(group_id: @group.id)
  end


  def new
  	@housework = Housework.new
    insert_setup
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
    insert_setup
    @housework = Housework.find(params[:id])
  end

  def update
    insert_setup
    @housework = Housework.find(params[:id])

    if @housework.update(edit_housework_params)
      redirect_to group_houseworks_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  private

  def housework_params
  	params.require(:housework).permit(houseworks: [%w(name score created_at updated_at)])
  end

  def edit_housework_params
    params.permit(:name, :score)
  end

  def insert_setup
    search_record = GroupUser.find_by(user_id: current_user.id)
    @group = Group.find(search_record.group_id)
    @time = Time.current
  end
end
