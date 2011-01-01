require 'rails/generators'
require 'rails/generators/migration'

class BigSiteGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    File.join(File.dirname(__FILE__), 'templates')
  end

  # Implement the required interface for Rails::Generators::Migration.
  # taken from http://github.com/rails/rails/blob/master/activerecord/lib/generators/active_record.rb
  def self.next_migration_number(dirname) #:nodoc:
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end
  
  def create_migration_file
    %w{create_sites}.each do |migration|
      begin
        migration_template "#{migration}_migration.rb", "db/migrate/#{migration}.rb"
        sleep(2) # cheap hack to make sure migration numbers end up being different
      rescue
        puts $!
      end
    end
  end

  def copy_assets
    copy_file 'assets/stylesheets/big_site_admin.css',  'public/stylesheets/big_site_admin.css'
  end

  def copy_initializers
    copy_file 'big_site_initializer.rb',  'config/initializers/big_site.rb'
  end
end
