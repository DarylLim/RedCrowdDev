class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  private
    def after_sign_in_path_for(resource)
      request.env['omniauth.origin'] || stored_location_for(resource) || area_for_user
    end

    def area_for_user
      if current_user.admin?
        admin_root_path
      else
        investor_root_path
      end 
    end
end
