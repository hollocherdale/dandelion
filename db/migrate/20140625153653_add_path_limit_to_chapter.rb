class AddPathLimitToChapter < ActiveRecord::Migration
  def change
    add_column :chapters, :path_limit, :string, default: "none"
  end
end
