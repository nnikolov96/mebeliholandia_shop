class ApplicationController < ActionController::Base
  include Pagy::Backend
  helper_method :logged_in?, :current_user
  
  def logged_in?
    !!current_user
  end
  
  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  
end
