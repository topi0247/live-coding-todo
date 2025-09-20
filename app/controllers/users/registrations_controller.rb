# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!

  def new
    super
    @user = User.new
  end

  def create
    super
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: "アカウントを登録しました"
    else
      flash.now[:error] = "アカウントの登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
