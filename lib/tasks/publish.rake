require 'rake'
namespace :publish do
  # desc 'prepare adventures for publish'
  # task :prepare => :environment do
  #   Adventure.where(state: 'populated').each do |adventure|
  #     adventure.close
  #     adventure.children.order(:vote_count).first(2).each do |top_voted|
  #       top_voted.publish
  #     end
  #     adventure.children.where(state: 'pending').each do |pending_adventure|
  #       pending_adventure.archive
  #     end
  #   end

  desc 'Publish unpopular adventures'
  task :normal => :environment do
    Adventure.where(state: 'populated').each do |adventure|
      adventure.close
      catch :path_limiting do
        adventure.children.order(:vote_count).first(2).each do |top_voted|
          top_voted.publish
          throw :path_limiting if top_voted.single_path?
        end
      adventure.children.where(state: 'pending').each do |pending_adventure|
        pending_adventure.archive
      end
    end
  end
  
  desc 'Publish only popular adventures'
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
