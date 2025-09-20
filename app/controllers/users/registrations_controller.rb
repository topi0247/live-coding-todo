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
      render :new, status: :unprocessable_entity
    end
  end

  protected

  def after_inactive_sign_up_path_for(_resource)
    root_path
  end

  private

  def sign_up_params
    params.expect(user: %i[name email password password_confirmation])
  end
end
