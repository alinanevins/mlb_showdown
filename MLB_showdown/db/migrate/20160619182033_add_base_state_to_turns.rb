class AddBaseStateToTurns < ActiveRecord::Migration
  def change
    add_column :turns, :base_state_id, :integer
  end
end
