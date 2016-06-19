class ApplicationController < ActionController::Base
  def authenticate
    if current_user.nil?
      redirect_to welcome_path, notice: "Please log in to see the library's contents"
    end
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # def logged_and_logged_out
  #    # debugger
  #   'logged_out' if @current_user.nil?
  # end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end