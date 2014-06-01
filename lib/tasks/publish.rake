require 'rake'

namespace :publish do
  desc "Publish popular adventures"
  task :popular => :environment do
    Adventure.where(state: 'accepting_subs_popular').each do |adventure|
      adventure.close
      adventure.publish_top_voted_children
      adventure.archive_pending_children
    end
  end

  desc "Publish any adventure"
  task :normal => :environment do
    Adventure.where(state: 'accepting_subs').each do |adventure|
      adventure.close
      adventure.publish_top_voted_children
      adventure.archive_pending_children
    end
  end
end