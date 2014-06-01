require 'rubygems'
require 'rufus-scheduler'
require 'rake'

load File.join(Rails.root, 'lib', 'tasks', 'publish.rake')

scheduler = Rufus::Scheduler.new

scheduler.every '5m' do
  rake :pub_pop
end

scheduler.every '10m' do
  rake :pub_norm
end