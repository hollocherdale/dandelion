require 'rake'

namespace :publish do
  desc "Publish popular adventures"
  task :popular => :environment do
    Adventure.where(state: 'published_popular').each do |adventure|
      adventure.publish_close
      adventure.children.order(:vote_count).first(2).each do |top_voted|
        top_voted.publish_open
      end
      adventure.children.where(state: 'pending').each do |pending_adventure|
        pending_adventure.archive
      end
    end
  end

  desc "Publish any adventure"
  task :normal => :environment do
    Adventure.where(state: 'published_open').each do |adventure|
      adventure.publish_close
      adventure.children.order(:vote_count).first(2).each do |top_voted|
        top_voted.publish_open
      end
      adventure.children.where(state: 'pending').each do |pending_adventure|
        pending_adventure.archive
      end
    end
  end
end

