require "bundler/gem_tasks"

require 'rspec/core/rake_task' 

desc 'Default: run unit specs.'
task :default => :spec
task :test => :spec

desc 'Test the GoogleGenomics plugin.'
RSpec::Core::RakeTask.new('spec') do |t|
    t.pattern = FileList['spec/**/*_spec.rb']
end

