class SignInsController < ApplicationController
  def show
    @user = User.new
  end
  
  def create
    @user = User.find_by(username: user_params[:username])
     if @user.authenticate(user_params[:password])
      redirect_to books_path(@user)
      session[:user_id] = @user.id
    else
      redirect_to books_path
    end  
  end 

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
