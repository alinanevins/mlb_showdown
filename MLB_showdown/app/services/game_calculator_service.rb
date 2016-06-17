class GameCalculatorService
  # all turns:
  def initialize(game_id)
    @turns = Turn.where(game_id: game_id)
    @inning = 1.0
    @pts_per_inning = {}
  end

  def calculate
    @turns.each do |row|
      row.pitcher_id
      if row.at_bat == "home"
        
      else # row.at_bat == "visitor"

    end
  end

end
