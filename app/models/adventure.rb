require 'state_machine'

class Adventure < ActiveRecord::Base
  has_ancestry
  belongs_to :user
  has_many :votes, :dependent => :destroy
# uploads are the model that has the paperclip attachment
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

    event :upvoted do
      transition :populated => :popular
    end

    event :close do
      transition [:populated, :popular] => :closed
    end
  end

  private

    def self.stage_top_voted_children
      self.children.order(:vote_count).first(2).each do |top_voted|
        top_voted.stage
      end
    end

    def self.archive_pending_children
      self.children.where(state: 'pending').each do |pending_adventure|
        pending_adventure.archive
      end
    end
end


