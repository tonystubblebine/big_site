ActionController::Base.class_eval do
  helper_method :current_site

  def current_site
    @current_site ||= BigSite::Site.find_by_host_name(request.host)
  end
end
