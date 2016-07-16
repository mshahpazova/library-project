class WelcomesController < ApplicationController
  # layout :logged_and_logged_out  
  def show
    render layout: 'welcome'
  end
end