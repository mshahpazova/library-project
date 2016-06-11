class SignOutsController < ApplicationController
  def log_out
    session.delete(:user_id)
  end
end