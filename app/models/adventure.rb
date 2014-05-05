class Adventure < ActiveRecord::Base
	has_ancestry
	belongs_to :user
	validates :user_id, presence: true
	# validates :parent_id, presence: true
end
