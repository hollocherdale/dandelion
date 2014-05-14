require 'state_machine'

class Adventure < ActiveRecord::Base
  has_ancestry
  belongs_to :user
  has_many :votes
  has_attached_file :slides, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates :user_id, presence: true
  validates :story, presence: true
  validates :choice, presence: true

  validates_attachment_presence :slides
  validates_attachment_size :slides, :less_than => 5.megabytes
  validates_attachment_content_type :slides, :content_type => ['image/jpeg', 'image/png']

  state_machine :initial => :pending do
    event :archive do
      transition :pending => :archived
    end
  
    event :publish_open do
      transition :pending => :published_open 
    end

    event :publish_close do
      transition :published_open => :published_close
    end
  end
end
