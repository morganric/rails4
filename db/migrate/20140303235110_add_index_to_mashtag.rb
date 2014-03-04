class AddIndexToMashtag < ActiveRecord::Migration
  def change
  	add_index :mashtags, :slug, unique: true
  end
end
