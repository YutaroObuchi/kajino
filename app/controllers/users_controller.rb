class UsersController < ApplicationController

  skip_before_action :require_login, only:[:new, :create]

  def new
  	@user = User.new
    @token = params[:invite_token]
  end

  def create
    @user = User.create(user_params)
    @token = params[:invite_token]
    if @token != nil && @user.save
      member_group = Invite.find_by_token(@token).group
      @user.groups.push(member_group)
      redirect_to login_path, success: "【token】登録が完了しました"
    elsif @token != nil
      redirect_to "http://localhost:3000//users/new?invite_token=#{@token}", danger: "【token】入力に不備があります"
    elsif @token == nil && @user.save
      redirect_to login_path, success: "新規登録しました"
    else
      redirect_to new_user_path, danger: "入力に不備があります"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :invite_token)
  end
end
