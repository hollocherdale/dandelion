require 'rubygems'
require 'rufus-scheduler'
require 'rake'

load File.join(Rails.root, 'lib', 'tasks', 'publish.rake')

scheduler = Rufus::Scheduler.new

scheduler.every '10m' do
  `rake publish:popular`
end

scheduler.every '1h' do
  `rake publish:normal`
end