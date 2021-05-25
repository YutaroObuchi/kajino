class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :info, :warning, :danger

  def not_authenticated
    redirect_to login_path
  end

  def insert_setup
    search_record = GroupUser.find_by(user_id: current_user.id)
    @group = Group.find(search_record.group_id)
    @time = Time.current
  end
end
