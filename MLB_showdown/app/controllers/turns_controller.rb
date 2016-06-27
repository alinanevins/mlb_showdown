class TurnsController < ApplicationController
  def index
    @turn = Turn.all
  end

  def create
    a = Turn.new
    a.inning = params['inning']
    a.at_bat = params['at_bat']
    # a.base_state = turn_hash['name']
    a.bat_decision = params['bat_decision']
    a.pitch_decision = params['pitch_decision']
    a.roll_1 = params['roll_1']
    a.roll_2 = params['roll_2']
    a.game_id = 1
    params.delete('turn')

    @batter = T1batter.find_by id: 3
    @pitcher = T2pitcher.first

    b = AdvantageService.new(a.roll_1, @pitcher['control'], @batter['onbase'])
    a.advantage = b.advantage

    c = ResultService.new(a.advantage, a.roll_2, @pitcher, @batter)
    a.result = c.calculate_result

    a.result = c.calculate_result
    d = EndingBaseStateService.new(a.base_state_id, a.result, a.outs, a.home_runs, a.visitor_runs, a.at_bat, 0)
    a.ending_base_state_id = d.calculate_ending_base_state
    a.outs = d.outs
    a.home_runs = d.home_runs
    a.visitor_runs = d.visitor_runs

    if a.save
      a = Turn.last
      redirect_to turn_path(a.id)
    end

  end

  def next_turn
    @current_game_id = params['id']
  end


  def new
    @turn = Turn.new # create new row
    # @game = Game.last || Game.new
    # t = GameCalculatorService.new
    # t = GameCalculatorService.new(g.id)
    # g = Game.new
    # g.save
    # bat_decision = params.delete("bat_decision")
    # pitch_decision = params.delete("pitch_decision")
    # @result = t.ph_combo(bat_decision, pitch_decision)

    # this works
    @batter = T1batter.find_by id: 3
    @pitcher = T2pitcher.first

    l = Turn.last
    i = l.ending_base_state_id || 1
    @base_state_image = BaseState.find(i).image

    @turn.base_state_id = i
    @base_state_name = BaseState.find(i).name


  end

  def edit
    id = params[:id]
    @turn = Turn.find(id)
  end

  def show
    @current_game_id = params['game_id']
    id = params[:id]
    @turn = Turn.find(id)

    # base state image
    i = @turn.ending_base_state_id || 1
    @base_state_image = BaseState.find(i).image

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
