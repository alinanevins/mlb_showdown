class AddOutsToTurns < ActiveRecord::Migration
  def change
    add_column :turns, :outs, :integer
  end
end
