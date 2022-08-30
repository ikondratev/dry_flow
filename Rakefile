require "rubygems"
require "rake"

desc "Run spec"
task default: %i[rubocop ff]

# require "rubocop/rake_task"
# RuboCop::RakeTask.new do |task|
#   task.fail_on_error = true
#   task.requires << 'rubocop-rake'
# end

desc "Fitnessfunctions"
task :ff do
  ruby "fitness_functions/cross_context_calls_checker.rb"
end