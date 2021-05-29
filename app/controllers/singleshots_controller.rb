class SingleshotsController < ApplicationController
  skip_before_action :require_login

  def new
    @singleshot = Singleshot.new
  end

  def create
    @singleshot = Singleshot.create(name_params)
    if @singleshot.save
      redirect_to edit_singleshot_path(@singleshot), success: "残りあと3問です！"
    else
      flash.now[:danger] = "入力に不備があります"
      render :new
    end
  end

  def edit
    params_identification
  end

  def update
  	params_identification
    if @singleshot.update(name_params)
      redirect_to your_burden_singleshot_path(@singleshot), success: '残り2問です！'
    else
      flash.now[:danger] = "入力に不備があります"
      render :edit
    end
  end

  def show
    params_identification
    calculation_pie_chart
  end

  def your_burden
    params_identification
  end

  def your_burden_update
  	params_identification
    if @singleshot.update(singleshot_params)
      your_burden_calculation
      redirect_to partner_burden_singleshot_path(@singleshot), success: 'ラスト1問！'
    else
      flash.now[:danger] = "入力に不備があります"
      render :your_burden
    end
  end

  def partner_burden
    params_identification
  end

  def partner_burden_update
  	params_identification
    if @singleshot.update(singleshot_params)
      partner_burden_calculation
      redirect_to singleshot_path(@singleshot), success: '家事負担の割合を確認しましょう！'
    else
      flash.now[:danger] = "入力に不備があります"
      render :partner_burden
    end
  end


  private

  def name_params
    params.require(:singleshot).permit(:your_name, :partner_name, :cook_point, :dish_washing_point, :laundry_point, :bath_washing_point, :vacuum_point)
  end

  def singleshot_params
    params.permit(:your_name, :partner_name, :cook_point, :dish_washing_point, :laundry_point, :bath_washing_point, :vacuum_point, :your_cook, :your_dish_washing, :your_laundry, :your_bath_washing, :your_vacuum, :partner_cook, :partner_dish_washing, :partner_laundry, :partner_bath_washing, :partner_vacuum)
  end

  def params_identification
  	@singleshot = Singleshot.find(params[:id])
  end

  def your_burden_calculation
  	@your_cook          = @singleshot.your_cook * @singleshot.cook_point
    @your_dish_washing  = @singleshot.your_dish_washing * @singleshot.cook_point
    @your_laundry       = @singleshot.your_laundry * @singleshot.cook_point
    @your_bath_washing  = @singleshot.your_bath_washing * @singleshot.cook_point
    @your_vacuum        = @singleshot.your_vacuum * @singleshot.cook_point
    @all_sum            = @your_cook + @your_dish_washing + @your_laundry + @your_bath_washing + @your_vacuum
  	Singleshot.update(your_cook_sum: @your_cook, your_dish_washing_sum: @your_dish_washing,
  		your_laundry_sum: @your_laundry, your_bath_washing_sum: @your_bath_washing, your_vacuum_sum: @your_vacuum, your_sum: @all_sum )
  end

  def partner_burden_calculation
  	@partner_cook          = @singleshot.partner_cook * @singleshot.cook_point
    @partner_dish_washing  = @singleshot.partner_dish_washing * @singleshot.cook_point
    @partner_laundry       = @singleshot.partner_laundry * @singleshot.cook_point
    @partner_bath_washing  = @singleshot.partner_bath_washing * @singleshot.cook_point
    @partner_vacuum        = @singleshot.partner_vacuum * @singleshot.cook_point
    @all_sum               = @partner_cook + @partner_dish_washing + @partner_laundry + @partner_bath_washing + @partner_vacuum
  	Singleshot.update(partner_cook_sum: @partner_cook, partner_dish_washing_sum: @partner_dish_washing,
  		partner_laundry_sum: @partner_laundry, partner_bath_washing_sum: @partner_bath_washing, partner_vacuum_sum: @partner_vacuum, partner_sum: @all_sum )
  end

  def calculation_pie_chart
  	@sum = [[@singleshot.your_name, @singleshot.your_sum], [@singleshot.partner_name, @singleshot.partner_sum]]
    @cook_ration = [[@singleshot.your_name, @singleshot.your_cook_sum], [@singleshot.partner_name, @singleshot.partner_cook_sum]]
    @dish_washing_ration = [[@singleshot.your_name, @singleshot.your_dish_washing_sum], [@singleshot.partner_name, @singleshot.partner_dish_washing_sum]]
    @laundry_ration = [[@singleshot.your_name, @singleshot.your_laundry_sum], [@singleshot.partner_name, @singleshot.partner_laundry_sum]]
    @bath_washing_ration = [[@singleshot.your_name, @singleshot.your_bath_washing_sum], [@singleshot.partner_name, @singleshot.partner_bath_washing_sum]]
    @vacuum_ration = [[@singleshot.your_name, @singleshot.your_vacuum_sum], [@singleshot.partner_name, @singleshot.partner_vacuum_sum]]
  end

end
