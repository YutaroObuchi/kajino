class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  def hello
    render html: "hello, world!"
  end
end
