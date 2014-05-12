# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

every :friday, :at => '12 am' do
  runner "Post.all.each do |post| archive"
end

# We want to act on all the adventures that are published_open, these are the ones that are accepting submissions.
Adventure.where(state: "published_open").each do |adventure|
  # We want to initially publish_close all those adventures so that they no longer accept submissions. We do this first to clear out all the published_open adventures, so they don't get 'contamincated' with the new adventures that will be published_open.
  adventure.publish_close
  # Take the top 2 voted children and publish_open those so that they will now accept submissions. How do I handle where there will only be one choice upvoted?
  adventure.children.order(:vote_count).first(2).each do |top_voted|
    top_voted.publish_open
  end
  # Now take all the remaining children which are still pending and archive them.
  adventure.children.where(state: "pending").each do |pending_adventure|
    pending_adventure.archive
  end
end