class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :adventure
  has_many :votes
  validates :user_id, presence: true
  validates :content, presence: true
  validates :type, presence: true

  def top_stories
  	Post.find_in_batches do |post|
  		post.where(type: "Story").order(:vote_count).first(2)
  	end
  end

end
