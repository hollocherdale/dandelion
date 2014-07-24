class AddAttachmentBannerToAdventureCollections < ActiveRecord::Migration
  def self.up
    change_table :adventure_collections do |t|
      t.attachment :banner
    end
  end

  def self.down
    drop_attached_file :adventure_collections, :banner
  end
end
