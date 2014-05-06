class Adventure < ActiveRecord::Base
	has_ancestry
	has_many :posts
	belongs_to :user
	validates :user_id, presence: true
end
