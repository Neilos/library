# require 'rake/testtask'
require "rspec/core/rake_task" 

# Rake::TestTask.new(:test) do |t|
#   t.test_files = FileList['test/**/*_test.rb']
#   t.verbose = true
#   t.warning = true
# end


RSpec::Core::RakeTask.new(:rspec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = ['-cfs --backtrace']
end

task :default => [:rspec]