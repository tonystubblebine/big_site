ActionController::Base.class_eval do
  helper_method :current_site

  protected
  def current_site
    @current_site ||= BigSite::Site.first
  end
end
