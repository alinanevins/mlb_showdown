class AddVisitorNameToGames < ActiveRecord::Migration
  def change
    add_column :games, :home_team_user_id, :integer
    add_column :games, :visitor_team_user_id, :integer
  end
end
