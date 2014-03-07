class AddMashTagToFacebookPageTab < ActiveRecord::Migration
  def change
    add_column :facebook_page_tabs, :mashtag_id, :integer
  end
end
