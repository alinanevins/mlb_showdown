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
    @batter = T1batter.find_by id: 3
    @pitcher = T2pitcher.first

    b = AdvantageService.new(a.roll_1, @pitcher['control'], @batter['onbase'])
    a.advantage = b.advantage

    c = ResultService.new(a.advantage, a.roll_2, @pitcher, @batter)
    a.result = c.calculate_result
    d = EndingBaseStateService.new(a.base_state_id, a.result, a.outs, a.home_runs, a.visitor_runs, a.at_bat, 0)
    a.ending_base_state_id = d.calculate_ending_base_state
    a.outs = d.outs
    a.home_runs = d.home_runs
    a.visitor_runs = d.visitor_runs


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


    a = Turn.new
    a.pitcher_id = 4
    a.batter_id = 8
    @batter = T1batter.find_by id: a.batter_id
    @pitcher = T2pitcher.find_by id: a.pitcher_id
    a.save

    if @pitcher.PU == 0
      @showSO = "-"
    elsif @pitcher.PU == 1
      @showPU = "1"
    elsif @pitcher.PU > 1
      @showPU = "1-" + @pitcher.PU.to_s
    end
    @cum = @pitcher.PU

    if @pitcher.SO == 0
      @showSO = "-"
    elsif @pitcher.SO== 1
      @showSO = @cum + 1
    elsif @pitcher.SO > 1
      @showSO = (1 + @cum).to_s + "-" + (@cum + @pitcher.SO).to_s
    end
    @cum = @cum + @pitcher.SO

    if @pitcher.GB == 0
      @showGB = "-"
    elsif @pitcher.GB== 1
      @showGB = @cum + 1
    elsif @pitcher.GB > 1
      @showGB = (1 + @cum).to_s + "-" + (@cum + @pitcher.GB).to_s
    end
    @cum = @cum + @pitcher.GB

    if @pitcher.FB == 0
      @showFB = "-"
    elsif @pitcher.FB== 1
      @showFB = @cum + 1
    elsif @pitcher.FB > 1
      @showFB = (1 + @cum).to_s + "-" + (@cum + @pitcher.FB).to_s
    end
    @cum = @cum + @pitcher.FB

    if @pitcher.BB == 0
      @showBB = "-"
    elsif @pitcher.BB== 1
      @showBB = @cum + 1
    elsif @pitcher.BB > 1
      @showBB = (1 + @cum).to_s + "-" + (@cum + @pitcher.BB).to_s
    end
    @cum = @cum + @pitcher.BB

    if @pitcher._1B == 0
      @show1B = "-"
    elsif @pitcher._1B== 1
      @show1B = @cum + 1
    elsif @pitcher._1B > 1
      @show1B = (1 + @cum).to_s + "-" + (@cum + @pitcher._1B).to_s
    end
    @cum = @cum + @pitcher._1B

    if @pitcher._2B == 0
      @show2B = "-"
    elsif @pitcher._2B== 1
      @show2B = @cum + 1
    elsif @pitcher._2B > 1
      @show2B = (1 + @cum).to_s + "-" + (@cum + @pitcher._2B).to_s
    end
    @cum = @cum + @pitcher._2B

    if @pitcher._HR == 0
      @showHR = "-"
    elsif @pitcher._HR== 1
      @showHR = @cum + 1
    elsif @pitcher._HR > 1
      @showHR = (1 + @cum).to_s + "-" + (@cum + @pitcher._HR).to_s
    end
    @cum = @cum + @pitcher._HR



    if @batter.SO == 0
      @showSO = "-"
    elsif @batter.SO == 1
      @showSO = "1"
    elsif @batter.SO > 1
      @showSO = "1-" + @batter.SO.to_s
    end
    @cum = @batter.SO

    if @batter.GB == 0
      @showGB = "-"
    elsif @batter.GB== 1
      @showGB = @cum + 1
    elsif @batter.GB > 1
      @showGB = (1 + @cum).to_s + "-" + (@cum + @batter.GB).to_s
    end
    @cum = @cum + @batter.GB

    if @batter.FB == 0
      @showFB = "-"
    elsif @batter.FB== 1
      @showFB = @cum + 1
    elsif @batter.FB > 1
      @showFB = (1 + @cum).to_s + "-" + (@cum + @batter.FB).to_s
    end
    @cum = @cum + @batter.FB

    if @batter.BB == 0
      @showBB = "-"
    elsif @batter.BB== 1
      @showBB = @cum + 1
    elsif @batter.BB > 1
      @showBB = (1 + @cum).to_s + "-" + (@cum + @batter.BB).to_s
    end
    @cum = @cum + @batter.BB

    if @batter._1B == 0
      @show1B = "-"
    elsif @batter._1B== 1
      @show1B = @cum + 1
    elsif @batter._1B > 1
      @show1B = (1 + @cum).to_s + "-" + (@cum + @batter._1B).to_s
    end
    @cum = @cum + @batter._1B

    if @batter._1Bplus == 0
      @show1Bplus = "-"
    elsif @batter._1Bplus== 1
      @show1Bplus = @cum + 1
    elsif @batter._1Bplus > 1
      @show1Bplus = (1 + @cum).to_s + "-" + (@cum + @batter._1Bplus).to_s
    end
    @cum = @cum + @batter._1Bplus

    if @batter._2B == 0
      @show2B = "-"
    elsif @batter._2B== 1
      @show2B = @cum + 1
    elsif @batter._2B > 1
      @show2B = (1 + @cum).to_s + "-" + (@cum + @batter._2B).to_s
    end
    @cum = @cum + @batter._2B

    if @batter._3B == 0
      @show3B = "-"
    elsif @batter._3B== 1
      @show3B = @cum + 1
    elsif @batter._3B > 1
      @show3B = (1 + @cum).to_s + "-" + (@cum + @batter._3B).to_s
    end
    @cum = @cum + @batter._3B

    if @batter._HR == 0
      @showHR = "-"
    elsif @batter._HR== 1
      @showHR = @cum + 1
    elsif @batter._HR > 1
      @showHR = (1 + @cum).to_s + "-" + (@cum + @batter._HR).to_s
    end
    @cum = @cum + @batter._HR


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
end
