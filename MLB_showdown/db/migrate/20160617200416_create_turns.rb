class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.integer :game_id
      t.integer :pitcher_id
      t.integer :batter_id
      t.string :at_bat
      t.string :bat_decision
      t.string :pitch_decision
      t.integer :roll_1
      t.integer :roll_2
      t.string :advantage
      t.string :result

      t.timestamps null: false
    end
  end
end
