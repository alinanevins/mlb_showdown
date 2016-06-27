class AddVisitorRunsToTurns < ActiveRecord::Migration
  def change
    add_column :turns, :visitor_runs, :integer
  end
end
