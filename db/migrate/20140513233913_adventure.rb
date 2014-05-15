class Adventure < ActiveRecord::Migration
  def change
  	add_attachment :adventures, :photo
  end
end
