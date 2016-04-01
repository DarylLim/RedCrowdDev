module ApplicationHelper
  def topbar_class_list
    return @topbar_class_list if @topbar_class_list
    @topbar_class_list = {}
    case params[:controller]
      when "admin/main"
        @topbar_class_list[:admin_root] = 'active'
      when "admin/companies"
        @topbar_class_list[:"admin_#{params[:action]}_companies"] = 'active'
        @topbar_class_list[:"admin_companies_root"] = 'active'
      when "admin/rewards"
        @topbar_class_list[:"admin_#{params[:action]}_rewards"] = 'active'
        @topbar_class_list[:"admin_rewards_root"] = 'active'
      when "investor/main"
        @topbar_class_list[:investor_root] = 'active'
      when "investor/companies"
        @topbar_class_list[:"investor_#{params[:action]}_companies"] = 'active'
        @topbar_class_list[:browse_companies] = 'active'
      when "investor/campaigns"
        @topbar_class_list[:"investor_#{params[:action]}_campaigns"] = 'active'
        @topbar_class_list[:browse_campaigns] = 'active'
      when "users/sessions"
        @topbar_class_list[:login] = 'active'
      when "users/registrations"
        @topbar_class_list[:sign_up] = 'active'
    end
    if @topbar_class_list == {}
      action = ([params[:action]] + params[:controller].split('/')).join('_')
      @topbar_class_list[action.to_sym] = 'active'
    end
    @topbar_class_list
  end

  def display_campaign_img(form, img_field)
    img_source  = form.send(img_field).try(:url)
    img_source ||= "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTcxIiBoZWlnaHQ9IjE4MCIgdmlld0JveD0iMCAwIDE3MSAxODAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzEwMCV4MTgwCkNyZWF0ZWQgd2l0aCBIb2xkZXIuanMgMi42LjAuCkxlYXJuIG1vcmUgYXQgaHR0cDovL2hvbGRlcmpzLmNvbQooYykgMjAxMi0yMDE1IEl2YW4gTWFsb3BpbnNreSAtIGh0dHA6Ly9pbXNreS5jbwotLT48ZGVmcz48c3R5bGUgdHlwZT0idGV4dC9jc3MiPjwhW0NEQVRBWyNob2xkZXJfMTUzOWU0MmZhNjAgdGV4dCB7IGZpbGw6I0FBQUFBQTtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMHB0IH0gXV0+PC9zdHlsZT48L2RlZnM+PGcgaWQ9ImhvbGRlcl8xNTM5ZTQyZmE2MCI+PHJlY3Qgd2lkdGg9IjE3MSIgaGVpZ2h0PSIxODAiIGZpbGw9IiNFRUVFRUUiLz48Zz48dGV4dCB4PSI2MC4xOTUzMTI1IiB5PSI5NC41Ij4xNzF4MTgwPC90ZXh0PjwvZz48L2c+PC9zdmc+"
    image_tag(img_source)
  end
end
