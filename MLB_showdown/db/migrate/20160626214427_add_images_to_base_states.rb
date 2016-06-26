class AddImagesToBaseStates < ActiveRecord::Migration
  def change
    add_column :base_states, :image, :string
  end
end
