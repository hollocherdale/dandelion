class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :adventure
  validates :user_id, presence: true
  has_many :votes
end
