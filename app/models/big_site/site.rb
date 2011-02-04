module BigSite
class Site < ActiveRecord::Base
  belongs_to :content_manager, :class_name => "BigCms::ContentManager"
  belongs_to :user
 
  validates_uniqueness_of :sub_domain, :case_sensitive => false
  validates_uniqueness_of :domain, :case_sensitive => false

  def self.find_by_host_name(host)
    host.downcase!

    # the subdomain is optional and will be nil in md[1] if it's not provided.
    md = host.match(/(?:([-\w]*)\.)?(\w*)\.([a-z]{2,6})$/i)
    subdomain = md[1]
    domain = md[2]
    tld = md[3]
    root = domain + "." + tld

    # Request for subdomain.#{service_domain}.com should find the site with that
    # subdomain. 
    if subdomain \
       and !BigSite::service_configs.empty? \
       and !BigSite::service_configs.include?(root) \
       and site = Site.find(:first, :conditions => ["LOWER(sub_domain) = ?", subdomain])
      site
    # Can we find an exact match on the request host?
    elsif site = Site.find(:first, :conditions => ["LOWER(domain) = ?", host])
      site
    # If the request is for domain.com but the custom_domain entered as
    # www.domain.com. If the request is for randomsubdomain.domain.com then we
    # want to return www.domain.com or domain.com only.
    elsif !BigSite::service_configs.include?(root) and ((site = Site.find(:first, :conditions => ["LOWER(domain) = ?", "www." + root])) or (site = Site.find(:first, :conditions => ["LOWER(domain) = ?", root])))
      site
    else
      nil
    end
  end

end
end
