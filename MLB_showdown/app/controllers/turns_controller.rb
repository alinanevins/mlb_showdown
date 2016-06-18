class TurnsController < ApplicationController
  def index
    @turn = Turn.all
  end

  def create
    turn_hash = params.delete('turn')
    a = Turn.new
    a.at_bat = turn_hash['at_bat']
    a.bat_decision = turn_hash['bat_decision']
    a.pitch_decision = turn_hash['pitch_decision']

    if a.save
      # refresh_page
    end

  end

  def new
    @turn = Turn.new # create new row
    t = GameCalculatorService.new(1) # for now, stick with game 1
    # t = GameCalculatorService.new(g.id)
    # g = Game.new
    # g.save
    t.calculate
    t.innings = 1.5
    t.pts_per_inning {}
    @turn = Turn.new
  end
end
