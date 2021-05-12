module ApplicationHelper

  #for user_sessionscontroller
  def logged_in?
    !current_user.nil?
  end
end
