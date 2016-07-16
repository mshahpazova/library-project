class SignUpsController < ApplicationController
  before_action :current_user
  layout :logged_and_logged_out

  def show
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login @user
    else
      redirect_to sign_up_path, notice: @user.errors
    end 
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end