class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def login(user)
    cookies.permanent.signed[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: cookies.permanent.signed[:user_id])
  end

  def logged_and_logged_out
     # debugger
    'standard' if @current_user
  end
end
