class Adventure < ActiveRecord::Base
	has_ancestry
	belongs_to :user
	has_many :posts
	validates :user_id, presence: true
end
