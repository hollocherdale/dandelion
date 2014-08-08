class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :adventures
  has_many :adventure_collections
  acts_as_voter
end
