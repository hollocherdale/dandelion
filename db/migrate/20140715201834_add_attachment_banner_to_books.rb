class AddAttachmentBannerToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :banner
    end
  end

  def self.down
    drop_attached_file :books, :banner
  end
end
