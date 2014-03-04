class AddFacebookPageIdToMashtag < ActiveRecord::Migration
  def change
    add_column :mashtags, :facebook_page_id, :string, :null => false, :default => ""
    add_index :mashtags, [:facebook_page_id, :user_name], :unique => true

  end
end
