require 'state_machine'

class Chapter < ActiveRecord::Base
  UPVOTE_IMG = 'upvote.png'
  DOWNVOTE_IMG = 'downvote.png'
  UPVOTED_IMG = 'upvoted.png'
  DOWNVOTED_IMG = 'downvoted.png'

  acts_as_votable
  has_ancestry

  belongs_to :book
  belongs_to :user

  has_many :uploads, dependent: :destroy
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :story, presence: true, length: { maximum: 2000 }
  validates :choice, presence: true, length: { maximum: 140 }

  state_machine initial: :pending do
    event :archive do
      transition pending: :archived
    end

    event :publish do
      transition pending: :accepting_submissions
    end

    event :populate do
      transition accepting_submissions: :populated
    end

    event :unpopulate do
      transition populated: :accepting_submissions
    end

    event :upvoted do
      transition populated: :popular
    end

    event :close do
      transition [:populated, :popular] => :closed
    end
  end

  def single_path?
    return true if path_limit == 'single'
  end

  def evaluate_rank
    get_likes.size - get_dislikes.size
  end

  def get_vote_config(user)
    vote_config = {
      upvote_method: :post,
      upvote_image: UPVOTE_IMG,
      downvote_method: :post,
      downvote_image: DOWNVOTE_IMG
    }

    return vote_config unless user.voted_for?(self)

    if user.voted_as_when_voted_for(self)
      vote_config[:upvote_method] = :delete
      vote_config[:upvote_image] = UPVOTED_IMG
    else
      vote_config[:downvote_method] = :delete
      vote_config[:downvote_image] = DOWNVOTED_IMG
    end

    vote_config
  end
end
