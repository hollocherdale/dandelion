require 'rubygems'
require 'rufus/scheduler'
load File.join(RAILS_ROOT, 'lib', 'tasks', 'publish_popular.rake')

scheduler = Rufus::Scheduler.start_new(:frequency => 600.0 )

scheduler.every '5m' do
  rake publish_popular
end

scheduler.every '1w' do
  rake publish_normal
end