require "bundler/capistrano"

set :deploy_via, :remote_cache
set :application, "devcon"
set :repository, "git://github.com/devcon-ph/devcon.git"
set :deploy_to, "/home/deploy/apps/devcon/"

set :scm, :git

default_run_options[:pty] = true
default_run_options[:shell] = "/bin/bash --login"

server "beta.devcon.ph", :app, :web, :db, :primary => true
set :user, "deploy"
set :use_sudo, false

depend :remote, :gem, "bundler"

set :rails_env, "production"

# for carrierwave
set :shared_children, shared_children + %w{public/uploads tmp/sockets}

before "deploy:restart", :'unicorn:restart'

before "deploy:finalize_update", :copy_production_database_configuration, :replace_secret_token

task :copy_production_database_configuration do
  run "cp #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end

task :replace_secret_token do
  run "cp #{shared_path}/config/secret_token.rb #{release_path}/config/initializers/secret_token.rb"
  run "cp #{shared_path}/config/devise.rb #{release_path}/config/initializers/devise.rb"
end

after "deploy:update", "deploy:cleanup", "deploy:migrate" 

require "capistrano-unicorn"

namespace :ckeditor do
  def copy_assets(regexp)
    Rails.application.assets.each_logical_path(regexp) do |name, path|
      asset = Rails.root.join('public', 'assets', name)
      p "Copy #{path} to #{asset}"
      FileUtils.cp path, asset
    end
  end

  desc 'Copy ckeditor assets, that cant be used with digest'
  task copy_nondigest_assets: :environment do
    copy_assets /ckeditor\/contents.css/
    copy_assets /ckeditor\/skins\/moono\/.+png/
  end
end

desc 'copy ckeditor nondigest assets'
task :copy_nondigest_assets, roles: :app do
  run "cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} ckeditor:copy_nondigest_assets"
end
after 'deploy:assets:precompile', 'copy_nondigest_assets'
