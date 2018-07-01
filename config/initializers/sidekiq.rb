Sidekiq.configure_server do |config|
  config.redis = { url: Rails.application.credentials.env.redis[:server], password: Rails.application.credentials.env.redis[:password] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: Rails.application.credentials.env.redis[:server], password: Rails.application.credentials.env.redis[:password] }
end

Sidekiq.default_worker_options = { retry: false, 'backtrace' => true }
Sidekiq::Extensions.enable_delay!