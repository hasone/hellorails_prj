require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
# require 'mina/rvm'
# require 'mina/rbenv'  # for rbenv support. (http://rbenv.org)
# require 'mina/rvm'    # for rvm support. (http://rvm.io)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

# set :rails_env,  ENV['RAILS_ENV'] || 'production'
set :environment, ENV['RAILS_ENV'] || 'development'
set :domain, '163.44.165.225'
set :user, 'luhuawen'
set :port, '11111'
set :deploy_to, '/fenxuekeji/depot'
set :repository, 'git@github.com:hasone/hellorails_prj.git'
set :branch, 'login'
# For system-wide RVM install.
#   set :rvm_path, '/usr/local/rvm/bin/rvm'

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['config/database.yml', 'config/secrets.yml', 'log']
set :app_path, lambda { "#{deploy_to}/#{current_path}" }

# set :bundle_bin, %{PATH="#{deploy_to}/bin:$PATH" GEM_HOME="#{deploy_to}/gems" RUBYLIB="#{deploy_to}/lib" RAILS_ENV=#{env} #{deploy_to}/bin/bundle}
# Optional settings:
#   set :user, 'foobar'    # Username in the server to SSH to.
#   set :port, '30000'     # SSH port number.
#   set :forward_agent, true     # SSH forward_agent.

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # queue %[source ~/.bashrc]
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  # invoke :'rvm:use[ruby-1.9.3-p125@default]'
end

task :down do
  invoke :restart
  invoke :logs
end

task :restart do
  queue 'sudo service nginx restart'
end

task :logs do
  queue 'tail -f /var/log/nginx/error.log'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/{log,sockets,pids}"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config"]

  queue! %[touch "#{deploy_to}/#{shared_path}/config/database.yml"]
  queue! %[touch "#{deploy_to}/#{shared_path}/config/secrets.yml"]
  queue  %[echo "-----> Be sure to edit '#{deploy_to}/#{shared_path}/config/database.yml' and 'secrets.yml'."]

  if repository
    repo_host = repository.split(%r{@|://}).last.split(%r{:|\/}).first
    repo_port = /:([0-9]+)/.match(repository) && /:([0-9]+)/.match(repository)[1] || '22'

    queue %[
      if ! ssh-keygen -H  -F #{repo_host} &>/dev/null; then
        ssh-keyscan -t rsa -p #{repo_port} -H #{repo_host} >> ~/.ssh/known_hosts
      fi
    ]
  end
end

# set :bundle_bin, %{RAILS_ENV=#{env} /usr/local/ruby/bin/bundle}

desc "Deploys the current version to the server."
task :deploy => :environment do
  to :before_hook do
    # Put things to run locally before ssh
  end
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    # invoke :'set_env_variables'
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'


    to :launch do
      # queue "mkdir -p #{deploy_to}/#{current_path}/shared/tmp/{sockets,pids,logs}"
      queue "mkdir -p #{deploy_to}/#{current_path}/tmp/"
      queue "touch #{deploy_to}/#{current_path}/tmp/restart.txt"
      invoke :'puma:restart'
    end
  end


=begin
    to :launch do
      queue "mkdir -p #{deploy_to}/#{current_path}/tmp/"
      queue "touch #{deploy_to}/#{current_path}/tmp/restart.txt"
    end
  end
=end

end

namespace :puma do
  desc "Start the application"
  task :start do
    queue 'echo "-----> Start Puma"'
    queue "cd #{app_path} && RAILS_ENV=#{stage} && chmod a+x bin/puma.sh && bin/puma.sh start", :pty => false
  end

  desc "Stop the application"
  task :stop do
    queue 'echo "-----> Stop Puma"'
    queue "cd #{app_path} && RAILS_ENV=#{stage} && chmod a+x bin/puma.sh && bin/puma.sh stop"
  end

  desc "Restart the application"
  task :restart do
    queue 'echo "-----> Restart Puma"'
    queue "cd #{app_path} && RAILS_ENV=#{stage} && chmod a+x bin/puma.sh && bin/puma.sh restart"
  end
end

=begin
desc "Set the environment variables."
task :set_env_variables => :environment do
  queue! "cd #{deploy_to}/"
  queue! "export GEM_HOME=$PWD/gems"
  queue! "export RUBYLIB=$PWD/lib"
  queue! "export PATH=$PWD/bin:$PATH"
  queue! "export LD_LIBRARY_PATH=$HOME/lib/"
end

to :prepare do
  run "bundle install"
end
commands(:prepare) == ["bundle install"]
=end
# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers

