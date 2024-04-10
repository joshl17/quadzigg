require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  # if Rails.root.join('tmp', 'caching-dev.txt').exist?
  #   config.action_controller.perform_caching = true
  #   config.action_controller.enable_fragment_cache_logging = true

  #   config.cache_store = :memory_store
  #   config.public_file_server.headers = {
  #     'Cache-Control' => "public, max-age=#{2.days.to_i}"
  #   }
  # else
  #   config.action_controller.perform_caching = false

  #   config.cache_store = :null_store
  # end

  config.cache_store = :memory_store

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :letter_opener
  config.action_mailer.perform_deliveries = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true


  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true
  config.active_record.legacy_connection_handling = false
  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true

  config.web_console.permissions = '13.42.77.46'

  # add UUID for each request made to logs 
  config.log_tags = %i[uuid]

  # add controller params visibility to logs 
  config.lograge.custom_payload do |controller|
  {
    request_id: controller.request.uuid,
    params: controller.request.params,
   # agent: controller.request.env[‘HTTP_USER_AGENT’]
  }
  end

  # added additional config.logger config 
  config.logger = ::Logger.new(STDOUT)
  config.logger.formatter = proc do |severity, datetime, _progname, msg|
  %Q({time: #{datetime}, severity: #{severity}, message: #{msg.strip}, request: #{self}\n)
  end

  config.lograge.formatter = Lograge::Formatters::Json.new
  config.lograge.enabled = true
  config.lograge.base_controller_class = ['ActionController::Base']
  config.lograge.custom_options = lambda do |event|
    {
      request_time: Time.now,
      application: Rails.application.class.module_parent_name,
      process_id: Process.pid,
      host: event.payload[:host],
      remote_ip: event.payload[:remote_ip],
      ip: event.payload[:ip],
      x_forwarded_for: event.payload[:x_forwarded_for],
      params: event.payload[:params].to_json,
      rails_env: Rails.env,
      exception: event.payload[:exception]&.first,
      request_id: event.payload[:headers]['action_dispatch.request_id'],
      sub_id: event.payload[:sub_id]
    }.compact
  end
end
