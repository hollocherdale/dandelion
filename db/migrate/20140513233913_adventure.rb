class Adventure < ActiveRecord::Migration
  def change
  	add_attachment :adventures, :slides
  end
end
