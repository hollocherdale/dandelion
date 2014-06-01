require 'state_machine'

class Adventure < ActiveRecord::Base
  has_ancestry
  belongs_to :user
  has_many :votes, :dependent => :destroy
# uploads are the model that has the paperclip attachment
  has_many :uploads, :dependent => :destroy, :limit => 4
  validates :user_id, presence: true
  validates :story, presence: true
  validates :choice, presence: true

  state_machine :initial => :pending do
    event :archive do
      transition :pending => :archived
    end
  
    event :publish do
      transition :pending => :accepting_subs 
    end

    event :upvoted do
      transition :accepting_subs => :accepting_subs_popular
    end

    event :close do
      transition [:accepting_subs, :accepting_subs_popular] => :closed
    end
  end

  private

    def self.publish_top_voted_children
      self.children.order(:vote_count).first(2).each do |top_voted|
        top_voted.publish
      end
    end

  def self.archive_pending_children
    self.children.where(state: 'pending').each do |pending_adventure|
      pending_adventure.archive
    end
end
