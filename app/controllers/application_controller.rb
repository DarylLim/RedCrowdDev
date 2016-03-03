class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  ActionView::Base.field_error_proc = Proc.new do |html_tag, object|
    # bootstrap validation
    html = Nokogiri::HTML::DocumentFragment.parse(html_tag)
    html = html.at_css("input") || html.at_css("textarea") || html.at_css("select")

    unless html.nil?
      css_class = html['class'] || "" 
      html['class'] = css_class.split.push("error").join(' ')
      html['data-error'] = object.error_message.join(". ")
      html_tag = html.to_s.html_safe
    end
    html_tag
  end


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
