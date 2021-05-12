class UsersController < ApplicationController

  skip_before_action :require_login, only:[:new, :create]

  def new
  	@user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to login_path, success: "新規登録しました"
    else
      flash.now[:danger] = "ユーザー登録に失敗しました"
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
