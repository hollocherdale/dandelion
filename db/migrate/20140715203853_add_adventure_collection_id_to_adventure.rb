class AddAdventureCollectionIdToAdventure < ActiveRecord::Migration
  def change
    add_column :adventures, :adventure_collection_id, :integer
  end
end
