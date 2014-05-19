class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.integer :adventure_id

      t.timestamps
    end
  end
end