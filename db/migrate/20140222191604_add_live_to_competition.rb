class AddLiveToCompetition < ActiveRecord::Migration
  def change
    add_column :competitions, :live, :boolean, :default => true
  end
end
