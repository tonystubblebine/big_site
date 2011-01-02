BigSite.setup do |config|
  
  # What domain does your service run as. Set this if you're lettting people create subdomains on your service. 
  #config.service_domains %w{crowdvine.com, hubnik.com, yak.ms}
  if Rails.env.production?
      
    # Configs for production mode go here
          
  elsif Rails.env.development?
          
    # Configs for development mode go here
      
  end
      
end
