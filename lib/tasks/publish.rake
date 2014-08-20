require 'rake'
namespace :publish do
  desc 'Publish unpopular chapters'
  task :normal => :environment do
    Adventure.where(state: 'populated').each do |chapter|
      chapter.close
      chapter.children.order(vote_count: :desc).first(2).each do |top_voted|
        top_voted.publish
      end
      chapter.children.where(state: 'pending').each do |pending_chapter|
        pending_chapter.archive
      end
    end
  end
  
  desc 'Publish only popular chapters'
  task :popular => :environment do
    Adventure.where(state: 'popular').each do |chapter|
      chapter.close
      chapter.children.order(:vote_count).first(2).each do |top_voted|
        top_voted.publish
      end
      chapter.children.where(state: 'pending').each do |pending_chapter|
        pending_chapter.archive
      end
    end
  end
end
