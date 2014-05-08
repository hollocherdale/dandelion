class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :adventures
  has_many :posts
  has_many :post_votes

  def total_votes
    postVote.joins(:post).where(posts: {user_id: self.id}).sum('value')
  end

  def can_vote_for?(post)
    post_votes.build(value: 1, post: post).valid?
  end
end
