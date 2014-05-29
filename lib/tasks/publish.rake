desc "Publish popular adventures"
task :publish_popular do
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
task :publish_normal do
  Adventure.where(state: 'published_normal').each do |adventure|
    adventure.publish_close
    adventure.children.order(:vote_count).first(2).each do |top_voted|
      top_voted.publish_open
    end
    adventure.children.where(state: 'pending').each do |pending_adventure|
      pending_adventure.archive
    end
  end
end

