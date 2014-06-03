# require 'rubygems'
# require 'rufus-scheduler'
# require 'rake'

# load File.join(Rails.root, 'lib', 'tasks', 'publish.rake')

# scheduler = Rufus::Scheduler.new

# scheduler.every '30s' do
#   rake :popular
# end

# scheduler.every '1m' do
#   rake :normal
# end