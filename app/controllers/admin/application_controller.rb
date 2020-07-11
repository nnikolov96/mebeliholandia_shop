class Admin::ApplicationController < ApplicationController
  before_action :authorized
  layout 'admin'

  private

  def authorized
    redirect_to admin_login_path unless logged_in?
  end
end
