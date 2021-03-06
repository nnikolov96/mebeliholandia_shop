class Admin::SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to admin_root_path
    else
      redirect_to admin_login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
