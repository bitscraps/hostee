set :application, "hostee"

set :deploy_to, "/var/www/vhosts/hosteeapp.co.uk/rails"

role :web, "91.199.154.79"                          # Your HTTP server, Apache/etc
role :app, "91.199.154.79"                          # This may be the same as your `Web` server
role :db,  "91.199.154.79", :primary => true # This is where Rails migrations will run

set :user, 'hosteeapp'
set :passphrase, 'tu7cw3ba'

default_run_options[:pty] = true
set :repository,  "git@github.com:bitscraps/hostee.git"
set :scm, :git
set :scm_username, 'hosteeapp'
set :scm_passphrase, "tu7cw3ba"  # The deploy user's password

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
 
 after "deploy:update_code", "gems:install"
 after "deploy:update_code", "docs:build"
 
namespace :gems do
  desc "Install gems"
  task :install, :roles => :app do
    run "cd #{current_release} && #{sudo} rake gems:install"
  end
end

namespace :docs do
  desc "Generate Build Docs"
  task :build, :roles => :app do
    system("rake doc:app") 
  end
end 