class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :adventure
	acts_as_votable
	validates :user_id, presence: true
end
