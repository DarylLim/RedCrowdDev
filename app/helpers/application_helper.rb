module ApplicationHelper
  def topbar_class_list
    return @topbar_class_list if @topbar_class_list
    @topbar_class_list = {}
    case params[:controller]
      when "admin/main"
        @topbar_class_list[:admin_root] = 'active'
      when "admin/companies"
        @topbar_class_list[:"admin_#{params[:action]}_companies"] = 'active'
      when "users/sessions"
        @topbar_class_list[:login] = 'active'
      when "users/registrations"
        @topbar_class_list[:sign_up] = 'active'
    end
    @topbar_class_list
  end
end
