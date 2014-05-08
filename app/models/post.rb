class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :adventure
  validates :user_id, presence: true
  has_many :post_votes

  def self.by_votes
    select('postss.*, coalesce(value, 0) as votes').
    joins('left join post_votes on post_id=posts.id').
    order('votes desc')
  end

  def votes
    read_attribute(:votes) || post_votes.sum(:value)
  end
end
