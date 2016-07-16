class SignInsController < ApplicationController
  before_action :current_user
  layout :logged_and_logged_out

  def show
    @user = User.new 
  end

  def create
    @user = User.find_by(email: user_params[:email])
    if @user&.authenticate(user_params[:password])
      login @user
    else
      redirect_to sign_in_path, notice: @user&.errors        
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end