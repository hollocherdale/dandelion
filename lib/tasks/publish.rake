require 'rake'
namespace :publish do
  desc 'Publish only popular adventures'
  task :normal => :environment do
    Adventure.where(state: 'populated').each do |adventure|
      adventure.close
      adventure.children.order(:vote_count).first(2).each do |top_voted|
        top_voted.publish
      end
      adventure.children.where(state: 'pending').each do |pending_adventure|
        pending_adventure.archive
      end
    end
  end

  task :popular => :environment do
    Adventure.where(state: 'popular').each do |adventure|
      adventure.close
      adventure.children.order(:vote_count).first(2).each do |top_voted|
        top_voted.publish
      end
      adventure.children.where(state: 'pending').each do |pending_adventure|
        pending_adventure.archive
      end
    end
  end
end
