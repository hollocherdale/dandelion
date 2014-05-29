set :output, "#{path}/log/cron.log"
job_type :script, "'#{path}/script/:task' :output"

# Everything that has 50 votes in total, is marked for publishing for that night

every :day, at: "1:00 am" do
  script "publish_popular"
end

every :friday, at: "1:00 am" do
  script "publish_normal"
end


# We want to act on all the adventures that are published_open, these are the ones that are accepting submissions.
# Adventure.where(state: "published_open").each do |adventure|
#   # We want to initially publish_close all those adventures so that they no longer accept submissions. We do this first to clear out all the published_open adventures, so they don't get 'contaminated' with the new adventures that will be published_open.
#   adventure.publish_close
#   # Take the top 2 voted children and publish_open those so that they will now accept submissions. How do I handle where there will only be one choice upvoted?
#   adventure.children.order(:vote_count).first(2).each do |top_voted|
#     top_voted.publish_open
#   end
#   # Now take all the remaining children which are still pending and archive them.
#   adventure.children.where(state: "pending").each do |pending_adventure|
#     pending_adventure.archive
#   end
# end