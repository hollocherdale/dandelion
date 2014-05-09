class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :adventure
  has_many :votes
  validates :user_id, presence: true
  validates :content, presence: true
  validates :type, presence: true
end
