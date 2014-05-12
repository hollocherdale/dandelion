require 'state_machine'

class Adventure < ActiveRecord::Base
  has_ancestry
  belongs_to :user
  has_many :votes
  validates :user_id, presence: true
  validates :story, presence: true
  validates :choice, presence: true

  state_machine :initial => :pending do
    event :archive do
      transition :pending => :archived
    end
  
    event :publish do
      transition :archived => :published 
    end
  end
end
