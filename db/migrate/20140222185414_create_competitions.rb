class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :title
      t.text :body
      t.text :css

      t.timestamps
    end
  end
end
