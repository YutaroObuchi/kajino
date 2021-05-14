class KajisController < ApplicationController
  def new
  	@kaji = Kaji.new
  end

  def create
    search_record = GroupUser.find_by(user_id: current_user.id)
    group = Group.find(search_record.group_id)
    @kaji = group.kajis.build(kaji_params)

    if @kaji.save
      redirect_to root_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  private

  def kaji_params
  	params.require(:kaji).permit(:name, :score)
  end
end
