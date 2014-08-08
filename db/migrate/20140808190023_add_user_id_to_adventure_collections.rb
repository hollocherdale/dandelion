class AddUserIdToAdventureCollections < ActiveRecord::Migration
  def change
    add_column :adventure_collections, :user_id, :integer
  end
end
