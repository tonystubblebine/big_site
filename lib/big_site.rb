module BigSite
  require 'big_site/service_config'
  
  mattr_accessor :service_configs
  @@service_configs = {}
  
  def self.setup
    yield self
  end
  
  def self.service_domains(domains)
    @@service_configs[:service_domains] = BigSite::ServiceConfig.new(domains)
  end

  require 'big_site/engine' if defined?(Rails) && Rails::VERSION::MAJOR >= 3
end
