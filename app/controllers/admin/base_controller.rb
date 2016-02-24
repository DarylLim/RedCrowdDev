class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :check_admin_credentials

  private
    def check_admin_credentials
      redirect_to root_url unless current_user.admin?
      true
    end
end
