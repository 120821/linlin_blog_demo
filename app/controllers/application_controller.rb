class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :check_user_login
  def check_user_login
    if session[:current_user].blank?
      redirect_to '/logins/new'
    else
    end
  end
  def root_path
    ::RAILS_ROOT
  end
end
