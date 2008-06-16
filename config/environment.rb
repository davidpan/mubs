# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.1.0' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  # See Rails::Configuration for more options.

  # Skip frameworks you're not going to use. To use Rails without a database
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Only load the plugins named here, in the order given. By default, all plugins 
  # in vendor/plugins are loaded in alphabetical order.
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Force all environments to use the same logger level
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Your secret key for verifying cookie session data integrity.
  # If you change this key, all old sessions will become invalid!
  # Make sure the secret is at least 30 characters and all random, 
  # no regular words or you'll be exposed to dictionary attacks.
  config.action_controller.session = {
    :session_key => '_mubs_session',
    :secret      => 'eb435a039b39ba664f3fc29e5b746f555c236b86dcb64423cad68801722f490b47227f9fff39a993ed75c058f26b85b1e6c226cd1d4a1d2490777b6d2dff481d'
  }

  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with 'rake db:sessions:create')
  # config.action_controller.session_store = :active_record_store

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector

  # Make Active Record use UTC-base instead of local time
  config.active_record.default_timezone = :utc
  
  # config.active_record.observers = :user_observer

  # rake gems             # List the gems that this rails application depends on
  # rake gems:install     # Installs all required gems for this application.
  # rake gems:unpack      # Unpacks all gems into vendor/gems.
  # rake gems:unpack:dependencies      # Unpack all dependencies
  # rake gems:unpack:dependencies GEM=foo #Unpack all dependencies for gem foo
  # rake gems:build       # for build native extensions.
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net" 
  # Require a gem that needs to require a file different than the gem's name
  # config.gem "aws-s3", :lib => "aws/s3"
  config.gem "erubis", :version => '>= 2.5.0'
  config.gem "tzinfo", :version => '>= 0.3.8'
  config.gem "ferret", :version => '>= 0.11.6'
  config.gem "idn" # 国际化域名库
  require 'idn'
  include IDN

  # Browser is limited to make only two connections to any single domain.
  # Enable serving of images, stylesheets, and javascripts from an asset server
  # config.action_controller.asset_host = "http://asset%d.jayesoui.com"
  
end