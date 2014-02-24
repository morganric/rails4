class CreateFacebookPageTabs < ActiveRecord::Migration
  def change
    create_table :facebook_page_tabs do |t|
      t.integer :competition_id, :null => false
      t.string :facebook_page_id, :unique => true, :null => false

      t.timestamps
    end
  end
end
