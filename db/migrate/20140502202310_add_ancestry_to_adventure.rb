class AddAncestryToAdventure < ActiveRecord::Migration
  def change
    add_column :adventures, :ancestry, :string
  end
end
