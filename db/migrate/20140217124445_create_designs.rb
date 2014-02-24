class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.string :image
      t.string :slug
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
