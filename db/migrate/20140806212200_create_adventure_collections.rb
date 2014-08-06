class CreateAdventureCollections < ActiveRecord::Migration
  def change
    create_table :adventure_collections do |t|
      t.string 'title'

      t.timestamps
    end
  end
end
