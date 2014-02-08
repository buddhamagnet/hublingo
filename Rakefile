require 'rake/testtask'

Rake::TestTask.new do |t|
	t.libs << 'test'
	t.pattern = 'test/*_test.rb'
end

desc "Run pre-rolled console"
task :console do
  require 'pry'
  require 'hublingo'
  ARGV.clear
  Pry.start
end

desc "Run tests"
task default: :test