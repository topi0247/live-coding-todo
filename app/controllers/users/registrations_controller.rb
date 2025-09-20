# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!

  def new
    super
    @user = User.new
  end

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?

    if resource.persisted?
      sign_up(resource_name, resource)
      redirect_to root_path, success: "アカウント登録に成功しました"
    else
      clean_up_passwords resource
      set_minimum_password_length
      flash.now[:error] = "アカウント登録に失敗しました"
      render :new, status: :unprocessable_content
    end
  end

  def update
    if current_user.update(update_params)
      redirect_to edit_user_registration_path, success: "アカウント情報の更新に成功しました"
    else
      flash.now[:error] = "アカウント情報の更新に失敗しました"
      render :edit, status: :unprocessable_content
    end
  end

  private

  def sign_up_params
    params.expect(user: %i[name email password password_confirmation])
  end

  def update_params
    params.expect(user: %i[name email])
  end
end
