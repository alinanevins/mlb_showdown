class CreateT2pitchers < ActiveRecord::Migration
  def change
    create_table :t2pitchers do |t|
      t.string :nameFirst
      t.string :nameLast
      t.string :nameFull
      t.integer :yearID
      t.string :setID
      t.integer :cardNo
      t.string :team
      t.integer :control
      t.integer :PU
      t.integer :SO
      t.integer :GB
      t.integer :FB
      t.integer :BB
      t.integer :_1B
      t.integer :_2B
      t.integer :_HR
      t.integer :points
      t.integer :IP
      t.string :hand
      t.string :Pos
      t.string :string

      t.timestamps null: false
    end
  end
end
