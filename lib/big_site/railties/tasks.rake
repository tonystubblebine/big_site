require 'generators/big_site/big_site_generator'
namespace :big_site do 
  namespace :generate do
    desc "generate database migration"
    task :migration do
      BigSiteGenerator.new.create_migration_file
    end

    desc "copy assets"
    task :copy_assets do
      BigSiteGenerator.new.copy_assets
    end

    desc "copy initializers"
    task :copy_initializers do
      BigSiteGenerator.new.copy_initializers
    end
  end
end
