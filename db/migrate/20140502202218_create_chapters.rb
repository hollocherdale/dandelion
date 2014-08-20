class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.text :story
      t.text :choice
      t.string :state
      t.string :ancestry
      t.string :state
      t.integer :vote_count
      t.integer :user_id

      t.timestamps
    end

    add_index :chapters, :ancestry

  end
end