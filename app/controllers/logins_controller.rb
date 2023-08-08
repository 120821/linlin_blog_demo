class LoginsController < ApplicationController
  #skip_before_action :check_user_login

  def new
  end
  #layout :false

  def create
    if params[:username] == 'admin' && params[:password] == 'my_password_admin'
      session[:current_user] = 'admin'
      redirect_to blogs_path
      # 跳转到 首页
    else
      session[:current_user] = ''
      redirect_to blogs_path
      # 跳转到 登录页面
    end
  end
  #layout :false

  def logout
    session[:current_user] = nil
    redirect_to blogs_path
  end

end
