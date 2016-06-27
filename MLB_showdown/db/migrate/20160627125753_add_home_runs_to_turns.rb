class AddHomeRunsToTurns < ActiveRecord::Migration
  def change
    add_column :turns, :home_runs, :integer
  end
end
