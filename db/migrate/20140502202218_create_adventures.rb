class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|

      t.text :story
      t.text :choice
      t.string :ancestry
      t.string :state
      t.integer :user_id

      t.timestamps
    end

    add_index :adventures, :ancestry

  end
end