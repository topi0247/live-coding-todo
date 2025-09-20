class ApplicationController < ActionController::Base
  add_flash_types :success, :error
  before_action :authenticate_user!
end
