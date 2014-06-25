class AddPathLimitToAdventure < ActiveRecord::Migration
  def change
    add_column :adventures, :path_limit, :string, default: "none"
  end
end
