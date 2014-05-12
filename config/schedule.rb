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

every :monday, :at => '12 am' do
  runner "Post.all.each do |post| archive"
end

every :monday, :at => '1 am' do
  runner "Post.all.archive"
end

Post.all.each do |post|
  post.archive
end

Adventure.where(state: "accepting_choices").each do |adventure|
  Adventure.create(
  	choice: adventure.posts.where(type: "Choice").order(:vote_count).first
  	user_id: adventure.posts.where(type: "Choice").order(:vote_count).first.user_id
  	)
  Adventure.create(
  	choice: adventure.posts.where(type: "Choice").order(:vote_count).second
  	user_id: adventure.posts.where(type: "Choice").order(:vote_count).second.user_id
  	)
  adventure.posts.each do |post|
  	post.archive
  end
end

	
Adventure.where(state: "accepting_stories").each do |adventure|
  Adventure.create(
  	story: adventure.posts.where(type: "Story").order(:vote_count).first
  	user_id: adventure.posts.where(type: "story").order(:vote_count).first.user_id
  	)
  Adventure.create(
  	choice: adventure.posts.where(type: "Choice").order(:vote_count).second
  	user_id: adventure.posts.where(type: "Choice").order(:vote_count).second.user_id
  	)
  adventure.posts.each do |post|
  	post.archive
  end
end

	