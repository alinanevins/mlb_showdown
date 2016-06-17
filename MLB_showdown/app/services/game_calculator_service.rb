In controller
# c = GameCalculatorService.new(1)
# c.calculate
# c.innings 1.5
# c.pts_per_inning {}
# @turn = turn.new -> new row

class GameCalculatorService
  # all turns:

  attr_accessor :innings, :pts_per_inning

  def initialize(game_id)
    @turns = Turn.where(game_id: game_id)
    @innings = 1.0
    @pts_per_inning = {}
  end

  def calculate
  @base_state = 1
  @outs = 0
  @home_runs = 0
  @visitor_runs = 0

    @turns.each do |row|
      if @outs == 3
        @base_state = 1
        @outs = 0
        @innings += 0.5
      end
      if row.at_bat == "visitor" # team_2
        if row.result == "GB"
          if @base_state == 1
        		@outs += 1
        	elsif @base_state == 2
        		@outs += 1
        		# doubleplay
        	elsif @base_state == 3
        		@base_state = 4
        		@outs += 1
        	elsif @base_state == 4
        		@base_state = 1
        		@outs += 1
            @pts_per_inning[@innings] += 1 # add to every visitor runs
        		@visitor_runs += 1
        	elsif @base_state == 5
        		@base_state = 6
        		@outs += 1
        		# doubleplay
        	elsif @base_state == 6
        		@base_state = 2
        		@outs += 1
        		@visitor_runs += 1
        		# doubleplay
        	elsif @base_state == 7
        		@base_state = 4
        		@outs += 1
        		@visitor_runs += 1
        	elsif @base_state == 8
        		@base_state = 6
        		@outs += 1
        		@visitor_runs += 1
        		# doubleplay
        	end
        else

        end

          # use result to determine ending base_state


        else #row.advantage == "pitcher"
        end

      else

    end
  end

end



#determine pitcher control
# if T1Pitcher.find(row.pitcher_id).control > T2Batter.find(row.batter_id).on_base
#   advantage = "pitcher"
# else
#   advantage = "batter"
# end
#
# else # row.at_bat == "home"
# if T2Pitcher.find(row.pitcher_id).control > T1Batter.find(row.batter_id).on_base
#   advantage = "pitcher"
# else
#   advantage = "batter"
# end
