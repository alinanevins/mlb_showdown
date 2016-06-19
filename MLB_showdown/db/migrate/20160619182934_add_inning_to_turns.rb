class AddInningToTurns < ActiveRecord::Migration
  def change
    add_column :turns, :ending_base_state_id, :integer
    add_column :turns, :inning, :float
  end
end
