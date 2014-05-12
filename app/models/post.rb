require 'state_machine'

class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :adventure
  has_many :votes
  validates :user_id, presence: true
  validates :content, presence: true
  validates :type, presence: true

  state_machine :initial => :voteable do
    event :archive do
      transition :voteable => :archived
    end
    
    event :publish do
      transition :archived => :published 
    end
  end
end
