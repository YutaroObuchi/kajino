class UsersController < ApplicationController

  skip_before_action :require_login, only:[:new, :create]

  def new
  	@user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to login_path, success: "登録したよ"
    else
      flash.now[:danger] = "失敗したよ"
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
