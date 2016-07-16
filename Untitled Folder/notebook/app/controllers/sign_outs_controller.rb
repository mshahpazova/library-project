class SignOutsController < ApplicationController
  before_action :current_user
  layout :logged_and_logged_out

  def destroy
    cookies.delete(:user_id) if @current_user
  end
end