class TurnsController < ApplicationController
  def index
    @turn = Turn.all
  end

  def create
    turn_hash = params.delete('turn')
    a = Turn.new
    a.game_id = @current_game_id
    a.inning = turn_hash['inning']
    a.at_bat = turn_hash['at_bat']
    a.base_state_id = turn_hash['base_state_id']
    # a.base_state = turn_hash['name']
    a.bat_decision = turn_hash['bat_decision']
    a.pitch_decision = turn_hash['pitch_decision']
    a.roll_1 = turn_hash['roll_1']
    a.roll_2 = turn_hash['roll_2']
    # if @at_bat == "home"
    #   batter_id = T1Batter.find(batter_id)
    # else
    #   T2Pitcher.find(pitcher_id)

    if a.save
      a = Turn.last
      redirect_to turn_path(a.id)
    end

  end

  def create_turn
    binding.pry
  end

  def next_turn
    @current_game_id = params['id']
  end


  def new
    @turn = Turn.new # create new row
    @game = Game.last || Game.new
    t = GameCalculatorService.new
    # t = GameCalculatorService.new(g.id)
    # g = Game.new
    # g.save
    bat_decision = params.delete("bat_decision")
    pitch_decision = params.delete("pitch_decision")
    @result = t.ph_combo(bat_decision, pitch_decision)
    if @result == "calculate_advantage"
      # t.calculate_advantage(at_bat, pitcher_id, batter_id, roll_1)
    end
    if @result == "calculate_result"
      # t.calculate_result(xxxxxxx) !!!!!!
    end
    # t.execute_result()
    # t.innings = 1.5
    # t.pts_per_inning


  end

  def edit
    id = params[:id]
    @turn = Turn.find(id)
  end

  def show
    @current_game_id = params['id']
    # id = params[:id]
    # @turn = Turn.find(id)
  end

  def update
    id = params['id']
    turn_hash = params.delete('turn')
    @turn = Turn.find(id)
    @turn.game_id = turn_hash['game_id']


    if @turn.save
      redirect_to turn_path(@turn.id)
    end
  end

  def destroy
    id = params['id']
    Turn.delete(id)
    flash[:notice] = "You've deleted turn #{id}"
    redirect_to turn_path
  end
end
