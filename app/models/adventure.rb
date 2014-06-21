require 'state_machine'

class Adventure < ActiveRecord::Base
  acts_as_votable
  has_ancestry
  belongs_to :user
  has_many :uploads, :dependent => :destroy
  validates :user_id, presence: true
  validates :story, presence: true
  validates :choice, presence: true

  state_machine :initial => :pending do
    event :archive do
      transition :pending => :archived
    end
  
    event :publish do
      transition :pending => :accepting_submissions 
    end

    event :populate do
      transition :accepting_submissions => :populated
    end

    event :unpopulate do
      transition :populated => :accepting_submissions
    end

    event :upvoted do
      transition :populated => :popular
    end

    event :close do
      transition [:populated, :popular] => :closed
    end
  end

  
  def get_rank
    rank = self.get_likes.size - self.get_dislikes.size
  end

  def get_vote_config(user_id)
    current_user = User.find(user_id)
    vote_config = {
      :upvote_method => :post,
      :upvote_image => 'upvote.png',
      :downvote_method => :post,
      :downvote_image => 'downvote.png'
    }

    if current_user.voted_for? self
      if (current_user.voted_for? self) && (current_user.voted_as_when_voted_for self)
        vote_config[:upvote_method] = :delete
        vote_config[:upvote_image] = 'upvoted.png'
      else
        vote_config[:upvote_method] = :post
        vote_config[:upvote_image] = 'upvote.png'
      end

      if (current_user.voted_for? self) && !(current_user.voted_as_when_voted_for self)
        vote_config[:downvote_method] = :delete
        vote_config[:downvote_image] = 'downvoted.png'
      else
        vote_config[:downvote_method] = :post
        vote_config[:downvote_image] = 'downvote.png'
      end
    end
    return vote_config
  end

  private

    def stage_top_voted_children
      self.children.order(:vote_count).first(2).each do |top_voted|
        top_voted.stage
      end
    end

    def archive_pending_children
      self.children.where(state: 'pending').each do |pending_adventure|
        pending_adventure.archive
      end
    end
end