class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :story
      t.text :choice
      t.integer :user_id
      t.integer :adventure_id
      t.boolean :selected, :default => false

      t.timestamps
    end
  end
end
