require "rubygems"
require "bundler/setup"

require "bundler/gem_tasks"
require "rspec/core/rake_task"

require "wwtd/tasks"

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = "--format progress"
end

task :default => :spec
