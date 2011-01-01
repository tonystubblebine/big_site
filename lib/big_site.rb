module BigSite
  require 'big_site/service_config'
  
  # Twitter & Facebook app configs
  mattr_accessor :service_configs
  @@service_configs = {}
  
  def self.setup
    yield self
  end
  
  def self.layouts(opts)
    @@service_configs[:layouts] = BigSite::ServiceConfig.new(opts)
  end

  require 'big_site/engine' if defined?(Rails) && Rails::VERSION::MAJOR >= 3
end
