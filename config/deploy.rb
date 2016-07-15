# config valid only for Capistrano 3.1
lock '3.4.0'
set :application, 'landing'
set :repo_url, 'git@github.com:teacplusplus/landing.git'
set :rails_env, 'production'
set :migration_role, 'db'
set :domain, 'root@212.109.216.94'
#https://github.com/teacplusplus/nmir.git
# Default branch is :master
#ask :branch, :master

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/tea/var/www/landing'
# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 3
set :unicorn_pid, '/home/tea/var/www/landing/run/unicorn.pid'

namespace :deploy do

  desc 'Create symlink'
  task :symlink do
    on roles(:all) do
      execute "cp #{shared_path}/config/database.yml #{release_path}/config/database.yml"
      execute "cp #{shared_path}/config/secrets.yml #{release_path}/config/secrets.yml"
      execute "cp #{shared_path}/config/config.yml #{release_path}/config/config.yml"
    end
  end


  desc 'Restart unicorn'
  task :restart do
    on roles(:all) do
      if test "[ -f #{fetch(:unicorn_pid)} ]"
        execute :kill, "-QUIT `cat #{fetch(:unicorn_pid)}` 2>/dev/null; true"
        execute :rm, fetch(:unicorn_pid)
      end
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, 'exec unicorn', "-c #{release_path}/config/unicorn.rb -D -E #{fetch(:rails_env)}"
        end
      end
    end
  end
before 'deploy:compile_assets', 'deploy:symlink'
after 'deploy', 'deploy:migrate'
after 'deploy', 'deploy:restart'

end







