class AddViewsToMashtag < ActiveRecord::Migration
  def change
    add_column :mashtags, :views, :integer, :default => true
  end
end
