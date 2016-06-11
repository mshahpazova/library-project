class SignUpsController < ApplicationController
  def show
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    debugger
    if @user.save
       session[:user_id] = @user.id
      redirect_to books_path, notice: "Sign up successful"
    else
      redirect_to sign_up_path, notice: @user.errors
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end