class HouseworksController < ApplicationController
  def new
  	@housework = Housework.new
  	search_record = GroupUser.find_by(user_id: current_user.id)
  	@group = Group.find(search_record.group_id)
  	@time = Time.current
  end

  def create
    array =  params[:housework][:houseworks]
    Housework.insert_all(array)
  end

  private

  def housework_params
  	params.require(:housework).permit(houseworks: [%w(name score created_at updated_at)])
  end
end
