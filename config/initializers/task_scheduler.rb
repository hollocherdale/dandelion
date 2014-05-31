require 'rubygems'
require 'rufus-scheduler'
load File.join(Rails.root, 'lib', 'tasks', 'publish.rake')

scheduler = Rufus::Scheduler.new

scheduler.every '1h' do
  rake publish:popular
end

scheduler.every '1d' do
  rake publish:normal
end