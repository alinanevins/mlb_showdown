class TurnsController < ApplicationController
  def index
    @turn = Turn.all
  end

  def create

    a = Turn.new
    a.inning = params['inning']
    a.at_bat = params['at_bat']
    a.base_state_id = params['base_state_id']
    # a.base_state = turn_hash['name']
    a.bat_decision = params['bat_decision']
    a.pitch_decision = params['pitch_decision']
    a.roll_1 = params['roll_1']
    a.roll_2 = params['roll_2']
      if a.roll_1.blank?
        a.roll_1 = 1+rand(20)
      end
      if a.roll_2.blank?
        a.roll_2 = 1+rand(20)
      end
    a.outs = params['outs']
    a.home_runs = params['home_runs']
    a.visitor_runs = params['visitor_runs']
    @batter = T1batter.find_by id: Turn.last.batter_id
    @pitcher = T2pitcher.find_by id: Turn.last.pitcher_id
    a.game_id = 1
    params.delete('turn')
    b = AdvantageService.new(a.roll_1, @pitcher['control'], @batter['onbase'])
    a.advantage = b.advantage

    c = ResultService.new(a.advantage, a.roll_2, @pitcher, @batter)
    a.result = c.calculate_result
    d = EndingBaseStateService.new(a.base_state_id, a.result, a.outs, a.home_runs, a.visitor_runs, a.at_bat, 0)
    a.ending_base_state_id = d.calculate_ending_base_state
    a.outs = d.outs
    a.home_runs = d.home_runs
    a.visitor_runs = d.visitor_runs



    # if @at_bat == "home"
    #   batter_id = T1Batter.find(batter_id)
    # else
    #   T2Pitcher.find(pitcher_id)


    if a.save
      a = Turn.last
      redirect_to turn_path(a.id)
    end

  end

  def next_turn
    @current_game_id = params['id']
  end


  def new
    a = Turn.new
    a.pitcher_id = 4
    a.batter_id = 8
    @batter = T1batter.find_by id: a.batter_id
    @pitcher = T2pitcher.find_by id: a.pitcher_id
    a.save
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
    i = @turn.ending_base_state_id
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
