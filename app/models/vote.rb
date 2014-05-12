class Vote < ActiveRecord::Base
  belongs_to :adventure
  belongs_to :user
  validates :user_id, uniqueness: { scope: :adventure_id }
end
