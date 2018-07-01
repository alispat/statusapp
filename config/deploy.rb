lock "~> 3.11.0"
set :application, "statusapp"

set :repo_url, "git://github.com/alispat/statusapp"
set :branch, "master"
set :deploy_to, "/home/git/statusapp"
set :rails_env, 'production'
set :conditionally_migrate, true
set :migration_role, :app
set :assets_roles, [:web]
set :rails_assets_groups, :assets
set :passenger_restart_with_touch, true
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'storage', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads', 'public/.well-known')
set :keep_releases, 5

task :restart_sidekiq do
  on roles(:app) do
    sudo "service sidekiq restart"
  end
end
after "deploy:published", "restart_sidekiq"

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"
set :linked_files, %w{config/master.key config/credentials.yml.enc}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
