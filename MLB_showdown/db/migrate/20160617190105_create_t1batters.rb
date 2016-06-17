class CreateT1batters < ActiveRecord::Migration
  def change
    create_table :t1batters do |t|
      t.string :nameFirst
      t.string :nameLast
      t.string :nameFull
      t.integer :yearID
      t.string :setID
      t.integer :cardNo
      t.string :team
      t.integer :onbase
      t.integer :SO
      t.integer :GB
      t.integer :FB
      t.integer :BB
      t.integer :_1B
      t.integer :_1Bplus
      t.integer :_2B
      t.integer :_3B
      t.integer :_HR
      t.integer :points
      t.integer :speed
      t.string :hand
      t.string :startingPos1
      t.integer :fielding1
      t.string :startingPos2
      t.integer :fielding2
      t.string :startingPos3
      t.integer :fielding3
      t.string :startingPos4
      t.integer :fielding4
      t.integer :_TO
      t.integer :xbh
      t.integer :numPos

      t.timestamps null: false
    end
  end
end
