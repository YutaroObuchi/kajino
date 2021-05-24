class CalculationsController < ApplicationController

  def new
  	insert_setup
    @calculation = Calculation.new
    houseworks = Housework.where(group_id: @group.id)
    array_extraction(houseworks)
  end

  def create
    array =  params[:calculation][:calculations]
    if Calculation.insert_all(array)
      insert_setup
      redirect_to group_path(@group), success: "完成"
      sum_culculation
    else
      flash.now[:danger] = "失敗"
      render :new
    end
  end


  private

  def insert_setup
    search_record = GroupUser.find_by(user_id: current_user.id)
    @group = Group.find(search_record.group_id)
    @time = Time.current
  end

  def array_extraction(houseworks)
  	@bath = houseworks[0]
  	@dishwash = houseworks[1]
  	@wash = houseworks[2]
  	@dust = houseworks[3]
  	@cook = houseworks[4]
  end

  def sum_culculation
    @null_dates = Calculation.where('sum IS NULL')
    @null_dates.each do |null_date|
      sum_date = null_date.time * null_date.housework_score
      null_date.update(sum: sum_date)
    end
  end
end
