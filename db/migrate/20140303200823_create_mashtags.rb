class CreateMashtags < ActiveRecord::Migration
  def change
    create_table :mashtags do |t|
      t.string :user_name
      t.string :slug

      t.timestamps
    end
  end
end
