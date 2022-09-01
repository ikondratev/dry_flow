require 'rubygems'
require 'rake'

desc 'Run spec'
task default: %i[rubocop spec ff]

desc 'Linter'
require 'rubocop/rake_task'
RuboCop::RakeTask.new do |task|
  task.fail_on_error = true
  task.requires << 'rubocop-rake'
end

desc 'Fitnessfunctions'
task :ff do
  ruby 'fitness_functions/main.rb'
end

# require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

namespace :db do
  require 'active_record'
  require 'pg'
  require 'logger'
  require 'dotenv'

  Dotenv.load('.env.prod', '.env.local')

  db_config = {
    adapter:  ENV["DB_ADAPTER"],
    host:     ENV["HOST"],
    encoding: ENV["ENC_DB"],
    database: ENV["DB"],
    username: ENV["USER_DB"],
    password: ENV["PASS"],
    port:     ENV["PORT"]
  }

  desc 'Migrate'
  task :migrate do
    ActiveRecord::Base.establish_connection(db_config)
    ActiveRecord::MigrationContext.new('db/migrate/').migrate
    ActiveRecord::Base.logger = Logger.new($stdout)
  end
end