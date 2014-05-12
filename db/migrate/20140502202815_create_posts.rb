class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.string :type
      t.string :state
      t.integer :vote_count
      t.integer :user_id
      t.integer :adventure_id
      t.boolean :selected, :default => false

      t.timestamps
    end
  end
end
