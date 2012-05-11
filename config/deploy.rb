require "bundler/capistrano"
require "rvm/capistrano" 
load 'deploy/assets'

default_run_options[:pty] = true # password prompt
ssh_options[:forward_agent] = true # forward ssh agent to github

set :application, "blog"
#set :repository,  "git@github.com:volkert/blog.git"

set :scm, :git

server '10.21.1.181', :app, :web, :db, :primary => true
set :user, 'hano'

set :deploy_to, "/apps/#{application}"

after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end