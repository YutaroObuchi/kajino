class UserSessionsController < ApplicationController
  skip_before_action :require_login, only:[:new, :create]
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user && @user.groups.blank?
      redirect_to new_group_path, success: "ログインしました"
    elsif @user && @user.groups
      redirect_back_or_to group_path(@user.groups), success: "ログインしました"
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end




=begin
  def create
    @user = login(params[:email], params[:password])
    binding.pry
    if @user
      redirect_back_or_to new_group_path, success: "ログインしました"
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new
    end
  end
=end