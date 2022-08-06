require 'sidekiq'

unless Rails.env.test?
  host = 'localhost'
  port = '6379'
  namespace = 'sitename'

  Sidekiq.configure_server do |config|
    config.redis = { url: "redis://#{host}:#{port}", namespace: namespace }
    schedule_file = "config/schedule.yml"
    if File.exists?(schedule_file)
      Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
    end
    config.server_middleware do |chain|
      
    end
    config.client_middleware do |chain|
      
    end
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: "redis://#{host}:#{port}", namespace: namespace }
    config.client_middleware do |chain|
      
    end
  end
end