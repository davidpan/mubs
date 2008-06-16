# config/database.yml 中采用sqlite且 test: database: ":memory:" 时有效
# def in_memory_database?
#   ENV["RAILS_ENV"] == "test" &&
#   ActiveRecord::Base.connection.class == ActiveRecord::ConnectionAdapters::SQLite3Adapter &&
#   Rails::Configuration.new.database_configuration['test']['database'] == ':memory:'
# end
# 
# if in_memory_database?
#   verbose = ActiveRecord::Schema.verbose
#   ActiveRecord::Schema.verbose = false
#   # puts "creating sqlite in memory database"
#   load "#{RAILS_ROOT}/db/schema.rb" # use db agnostic schema by default
#   # ActiveRecord::Migrator.up('db/migrate') # use migrations
#   ActiveRecord::Schema.verbose = verbose
# end