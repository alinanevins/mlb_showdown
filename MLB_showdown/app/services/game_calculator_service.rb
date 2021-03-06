# In controller
# t = GameCalculatorService.new(g.id)
# t.calculate
# t.innings = 1.5
# t.pts_per_inning {} ?
# @turn = turn.new -> new row

class GameCalculatorService
  # all turns:

  # attr_accessor :innings, :pts_per_inning, :base_state, :outs, :home_runs, :visitor_runs, :visitor_batter_count, :home_batter_count, :visitor_pitcher_count, :home_pitcher_count, :batter_id, :pitcher_id ? is this needed?

  def initialize
    @innings = 1.0
    @pts_per_inning = {}
    @base_state = 1
    @outs = 0
    @home_runs = 0
    @visitor_runs = 0
    @visitor_batter_count = 1
    @home_batter_count = 1
    @visitor_pitcher_count = 1
    @home_pitcher_count = 1
    @batter_id = 1
    @pitcher_id = 1
  end

  def pitch_lineup
    # show all pitchers and stats
    if at_bat == "visitor"
      #look at T1Pitcher
    elsif at_bat == "home"
      #look at T2Pitcher
    end
  end

  def batter_lineup
    # show all batters and stats
    if at_bat == "visitor"
      #look at T2Batter
    elsif at_bat == "home"
      #look at T1Batter
    end
  end

  # create a new row in turn table
  def ph_combo(pitch_decision, bat_decision)
    if pitch_decision == "W"
      @result = "BB"
    elsif pitch_decision == "R"
      # substitute pitcher
    elsif pitch_decision == "S"
      # substitute fielder
    elsif if pitch_decision == "P" && bat_decision == "P"
      # sub batter/runner
    elsif pitch_decision == "P" && bat_decision == "B"
      @result = "SB"
    elsif pitch_decision == "P" && bat_decision == "S"
      # steal attempt
    elsif pitch_decision == "P" && bat_decision == "H"
      @result = "calculate_advantage"
    end
  end

  def calculate_advantage(at_bat, pitcher_id, batter_id, roll_1)
    if at_bat == "visitor"
      # determine pitcher control
      if T1Pitcher.find(row.pitcher_id).control + roll_1 >  T2Batter.find(row.batter_id).on_base # does this need to be passed in?
        @advantage = "pitcher"
      else
        @advantage = "batter"
      end

    elsif at_bat == "home"
      if T2Pitcher.find(row.pitcher_id).control + roll_1 > T1Batter.find(row.batter_id).on_base
        @advantage = "pitcher"
      else
        @advantage = "batter"
      end
    end
    @result = "calculate_result"
  end

  def calculate_result(advantage, roll_2)
    if at_bat == "visitor"
      if advantage == "pitcher"
        if roll_2 < T1Pitcher.find(row.pitcher_id).PU
          @result = "PU"
        elsif roll_2 < ( T1Pitcher.find(row.pitcher_id).PU + T1Pitcher.find(row.pitcher_id).SO )
          @result = "SO"
        elsif roll_2 < ( T1Pitcher.find(row.pitcher_id).PU + T1Pitcher.find(row.pitcher_id).SO + T1Pitcher.find(row.pitcher_id).GB )
          @result = "GB"
        elsif roll_2 < ( T1Pitcher.find(row.pitcher_id).PU + T1Pitcher.find(row.pitcher_id).SO + T1Pitcher.find(row.pitcher_id).GB + T1Pitcher.find(row.pitcher_id).FB )
          @result = "FB"
        elsif roll_2 < ( T1Pitcher.find(row.pitcher_id).PU + T1Pitcher.find(row.pitcher_id).SO + T1Pitcher.find(row.pitcher_id).GB + T1Pitcher.find(row.pitcher_id).FB + T1Pitcher.find(row.pitcher_id).BB )
          @result = "BB"
        elsif roll_2 < ( T1Pitcher.find(row.pitcher_id).PU + T1Pitcher.find(row.pitcher_id).SO + T1Pitcher.find(row.pitcher_id).GB + T1Pitcher.find(row.pitcher_id).FB + T1Pitcher.find(row.pitcher_id).BB + T1Pitcher.find(row.pitcher_id)._1B )
          @result = "_1B"
        elsif roll_2 < ( T1Pitcher.find(row.pitcher_id).PU + T1Pitcher.find(row.pitcher_id).SO + T1Pitcher.find(row.pitcher_id).GB + T1Pitcher.find(row.pitcher_id).FB + T1Pitcher.find(row.pitcher_id).BB + T1Pitcher.find(row.pitcher_id)._1B + T1Pitcher.find(row.pitcher_id)._2B )
          @result = "_2B"
        elsif roll_2 < ( T1Pitcher.find(row.pitcher_id).PU + T1Pitcher.find(row.pitcher_id).SO + T1Pitcher.find(row.pitcher_id).GB + T1Pitcher.find(row.pitcher_id).FB + T1Pitcher.find(row.pitcher_id).BB + T1Pitcher.find(row.pitcher_id)._1B + T1Pitcher.find(row.pitcher_id)._2B + T1Pitcher.find(row.pitcher_id)._HR )
          @result = "_HR"
        end
      elsif advantage == "batter"
        if roll_2 < T2Batter.find(row.batter_id).SO
          @result = "SO"
        elsif roll_2 < ( T2Batter.find(row.batter_id).SO + T2Batter.find(row.batter_id).GB )
          @result = "GB"
        elsif roll_2 < ( T2Batter.find(row.batter_id).SO + T2Batter.find(row.batter_id).GB + T2Batter.find(row.batter_id).FB )
          @result = "FB"
        elsif roll_2 < ( T2Batter.find(row.batter_id).SO + T2Batter.find(row.batter_id).GB + T2Batter.find(row.batter_id).FB + T2Batter.find(row.batter_id).BB )
          @result = "BB"
        elsif roll_2 < ( T2Batter.find(row.batter_id).SO + T2Batter.find(row.batter_id).GB + T2Batter.find(row.batter_id).FB + T2Batter.find(row.batter_id).BB + T2Batter.find(row.batter_id)._1B )
          @result = "_1B"
        elsif roll_2 < ( T2Batter.find(row.batter_id).SO + T2Batter.find(row.batter_id).GB + T2Batter.find(row.batter_id).FB + T2Batter.find(row.batter_id).BB + T2Batter.find(row.batter_id)._1B + T2Batter.find(row.batter_id)._1Bplus )
          @result = "_1Bplus"
        elsif roll_2 < ( T2Batter.find(row.batter_id).SO + T2Batter.find(row.batter_id).GB + T2Batter.find(row.batter_id).FB + T2Batter.find(row.batter_id).BB + T2Batter.find(row.batter_id)._1B + T2Batter.find(row.batter_id)._1Bplus + T2Batter.find(row.batter_id)._2B )
          @result = "_2B"
        elsif roll_2 < ( T2Batter.find(row.batter_id).SO + T2Batter.find(row.batter_id).GB + T2Batter.find(row.batter_id).FB + T2Batter.find(row.batter_id).BB + T2Batter.find(row.batter_id)._1B + T2Batter.find(row.batter_id)._1Bplus + T2Batter.find(row.batter_id)._2B + T2Batter.find(row.batter_id)._3B )
          @result = "_3B"
        elsif roll_2 < ( T2Batter.find(row.batter_id).SO + T2Batter.find(row.batter_id).GB + T2Batter.find(row.batter_id).FB + T2Batter.find(row.batter_id).BB + T2Batter.find(row.batter_id)._1B + T2Batter.find(row.batter_id)._1Bplus + T2Batter.find(row.batter_id)._2B + T2Batter.find(row.batter_id)._3B + T2Batter.find(row.batter_id)._HR )
          @result = "_HR"
        end
      end

    elsif at_bat == "home"
      if advantage == "pitcher"
        if roll_2 < T2Pitcher.find(row.pitcher_id).PU
          @result = "PU"
        elsif roll_2 < ( T2Pitcher.find(row.pitcher_id).PU + T2Pitcher.find(row.pitcher_id).SO )
          @result = "SO"
        elsif roll_2 < ( T2Pitcher.find(row.pitcher_id).PU + T2Pitcher.find(row.pitcher_id).SO + T2Pitcher.find(row.pitcher_id).GB )
          @result = "GB"
        elsif roll_2 < ( T2Pitcher.find(row.pitcher_id).PU + T2Pitcher.find(row.pitcher_id).SO + T2Pitcher.find(row.pitcher_id).GB + T2Pitcher.find(row.pitcher_id).FB )
          @result = "FB"
        elsif roll_2 < ( T2Pitcher.find(row.pitcher_id).PU + T2Pitcher.find(row.pitcher_id).SO + T2Pitcher.find(row.pitcher_id).GB + T2Pitcher.find(row.pitcher_id).FB + T2Pitcher.find(row.pitcher_id).BB )
          @result = "BB"
        elsif roll_2 < ( T2Pitcher.find(row.pitcher_id).PU + T2Pitcher.find(row.pitcher_id).SO + T2Pitcher.find(row.pitcher_id).GB + T2Pitcher.find(row.pitcher_id).FB + T2Pitcher.find(row.pitcher_id).BB + T2Pitcher.find(row.pitcher_id)._1B )
          @result = "_1B"
        elsif roll_2 < ( T2Pitcher.find(row.pitcher_id).PU + T2Pitcher.find(row.pitcher_id).SO + T2Pitcher.find(row.pitcher_id).GB + T2Pitcher.find(row.pitcher_id).FB + T2Pitcher.find(row.pitcher_id).BB + T2Pitcher.find(row.pitcher_id)._1B + T2Pitcher.find(row.pitcher_id)._2B )
          @result = "_2B"
        elsif roll_2 < ( T2Pitcher.find(row.pitcher_id).PU + T2Pitcher.find(row.pitcher_id).SO + T2Pitcher.find(row.pitcher_id).GB + T2Pitcher.find(row.pitcher_id).FB + T2Pitcher.find(row.pitcher_id).BB + T2Pitcher.find(row.pitcher_id)._1B + T2Pitcher.find(row.pitcher_id)._2B + T2Pitcher.find(row.pitcher_id)._HR )
          @result = "_HR"
        end

      elsif advantage == "batter"
        if roll_2 < T1Batter.find(row.batter_id).SO
          @result = "SO"
        elsif roll_2 < ( T1Batter.find(row.batter_id).SO + T1Batter.find(row.batter_id).GB )
          @result = "GB"
        elsif roll_2 < ( T1Batter.find(row.batter_id).SO + T1Batter.find(row.batter_id).GB + T1Batter.find(row.batter_id).FB )
          @result = "FB"
        elsif roll_2 < ( T1Batter.find(row.batter_id).SO + T1Batter.find(row.batter_id).GB + T1Batter.find(row.batter_id).FB + T1Batter.find(row.batter_id).BB )
          @result = "BB"
        elsif roll_2 < ( T1Batter.find(row.batter_id).SO + T1Batter.find(row.batter_id).GB + T1Batter.find(row.batter_id).FB + T1Batter.find(row.batter_id).BB + T1Batter.find(row.batter_id)._1B )
          @result = "_1B"
        elsif roll_2 < ( T1Batter.find(row.batter_id).SO + T1Batter.find(row.batter_id).GB + T1Batter.find(row.batter_id).FB + T1Batter.find(row.batter_id).BB + T1Batter.find(row.batter_id)._1B + T1Batter.find(row.batter_id)._1Bplus )
          @result = "_1Bplus"
        elsif roll_2 < ( T1Batter.find(row.batter_id).SO + T1Batter.find(row.batter_id).GB + T1Batter.find(row.batter_id).FB + T1Batter.find(row.batter_id).BB + T1Batter.find(row.batter_id)._1B + T1Batter.find(row.batter_id)._1Bplus + T1Batter.find(row.batter_id)._2B )
          @result = "_2B"
        elsif roll_2 < ( T1Batter.find(row.batter_id).SO + T1Batter.find(row.batter_id).GB + T1Batter.find(row.batter_id).FB + T1Batter.find(row.batter_id).BB + T1Batter.find(row.batter_id)._1B + T1Batter.find(row.batter_id)._1Bplus + T1Batter.find(row.batter_id)._2B + T1Batter.find(row.batter_id)._3B )
          @result = "_3B"
        elsif roll_2 < ( T1Batter.find(row.batter_id).SO + T1Batter.find(row.batter_id).GB + T1Batter.find(row.batter_id).FB + T1Batter.find(row.batter_id).BB + T1Batter.find(row.batter_id)._1B + T1Batter.find(row.batter_id)._1Bplus + T1Batter.find(row.batter_id)._2B + T1Batter.find(row.batter_id)._3B + T1Batter.find(row.batter_id)._HR )
          @result = "_HR"
        end
      end
    end
  end
  

  def end_game(innings, home_runs, visitor_runs, outs)
    ninth_or_later = innings > 9
    home_ahead = (home_runs > visitor_runs)
    visitor_ahead_end_of_inning = (home_runs < visitor_runs && innings % 1 == 0.5 && outs = 3)
    if !(ninth_or_later && !home_ahead && !visitor_ahead_end_of_inning)
      #game is over
    end
  end

  def end_inning(outs)
    if outs >2
      @base_state_id = 1
      @outs = 0
      @innings += 0.5
      @pts_per_inning = 0
      if at_bat == "visitor"
        @batter_id = @home_batter_count
      elsif at_bat == "home"
        @batter_id = @away_batter_count
      end
    end
  end
end
end
