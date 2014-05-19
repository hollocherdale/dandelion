require 'state_machine'

class Adventure < ActiveRecord::Base
  has_ancestry
  belongs_to :user
  has_many :votes, :dependent => :destroy
  has_many :uploads, :dependent => :destroy
  validates :user_id, presence: true
  validates :story, presence: true
  validates :choice, presence: true

  state_machine :initial => :pending do
    event :archive do
      transition :pending => :archived
    end
  
    event :publish_open do
      transition :pending => :published_open 
    end

    event :publish_final do
      transition :published_open => :published_final
    end
  end
end
