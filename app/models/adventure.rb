require 'state_machine'

class Adventure < ActiveRecord::Base
  has_ancestry
  belongs_to :user
  has_many :posts
  validates :user_id, presence: true

  state_machine :initial => :accepting_choices do
    event :archive do
      transition :accepting_choices => :accepting_stories
    end
  
    event :publish do
      transition :accepting_stories => :published 
    end
  end
end
