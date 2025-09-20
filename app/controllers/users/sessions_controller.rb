# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def destroy
    sign_out(resource_name)
    redirect_to new_user_session_path, success: "ログアウトしました"
  end
end
