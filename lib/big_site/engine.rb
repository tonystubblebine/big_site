require "rails"
require 'action_controller'
require "big_site"
require 'big_site/action_controller_ext'
module BigSite
 class Engine < Rails::Engine
    rake_tasks do
      load "big_site/railties/tasks.rake"
    end
  end
end
