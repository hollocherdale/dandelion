class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :adventure
	acts_as_votable
end
