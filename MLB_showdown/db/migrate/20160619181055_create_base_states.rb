class CreateBaseStates < ActiveRecord::Migration
  def change
    create_table :base_states do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
