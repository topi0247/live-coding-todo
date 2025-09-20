# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate(auth_options)

    if resource
      flash[:success] = "ログインに成功しました"
      sign_in(resource_name, resource)
      redirect_to root_path
    else
      flash.now[:error] = "ログインに失敗しました"
      self.resource = resource_class.new
      render :new, status: :unprocessable_content
    end
  end

  def destroy
    sign_out(resource_name)
    redirect_to new_user_session_path, success: "ログアウトしました"
  end
end
