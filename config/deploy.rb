require "bundler/capistrano"

set :deploy_via, :remote_cache
set :application, "devcon"
set :repository, "git://github.com/bryanbibat/devcon.git"
set :deploy_to, "/home/deploy/apps/devcon-release/"

set :scm, :git
set :branch, "release"

default_run_options[:pty] = true

server "devcon.ph", :app, :web, :db, :primary => true
set :user, "deploy"
set :use_sudo, false

depend :remote, :gem, "bundler"

set :rails_env, :production

# for carrierwave
set :shared_children, shared_children + %w{public/uploads}

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

before "deploy:finalize_update", :copy_production_database_configuration

task :copy_production_database_configuration do
  run "cp #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end

after "deploy:update", "deploy:cleanup" 
