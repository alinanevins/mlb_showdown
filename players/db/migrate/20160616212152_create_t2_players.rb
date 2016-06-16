class CreateT2Players < ActiveRecord::Migration
  def change
    create_table :t2_players do |t|

      t.timestamps null: false
    end
  end
end
