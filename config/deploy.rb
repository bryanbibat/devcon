require "bundler/capistrano"

set :deploy_via, :remote_cache
set :application, "devcon"
set :repository, "git://github.com/devcon-ph/devcon.git"
set :deploy_to, "/home/deploy/apps/devcon-release/"

set :scm, :git
set :branch, "release"

default_run_options[:pty] = true
default_run_options[:shell] = "/bin/bash --login"

server "devcon.ph", :app, :web, :db, :primary => true
set :user, "deploy"
set :use_sudo, false

depend :remote, :gem, "bundler"

set :rails_env, "production"

# for carrierwave
set :shared_children, shared_children + %w{public/uploads}

before "deploy:finalize_update", :copy_production_database_configuration, :replace_secret_token

task :copy_production_database_configuration do
  run "cp #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end

task :replace_secret_token do
  run "cp #{shared_path}/config/secret_token.rb #{release_path}/config/initializers/secret_token.rb"
end

after "deploy:update", "deploy:cleanup", "deploy:migrate" 

require "capistrano-unicorn"

after 'deploy:restart', 'unicorn:reload'
