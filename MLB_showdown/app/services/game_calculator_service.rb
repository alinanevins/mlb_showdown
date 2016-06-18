# In controller
# t = GameCalculatorService.new(g.id)
# t.calculate
# t.innings = 1.5
# t.pts_per_inning {} ?
# @turn = turn.new -> new row

class GameCalculatorService
  # all turns:

  attr_accessor :innings, :pts_per_inning

  def initialize(game_id) # pass in game id
    @turns = Turn.where(game_id: game_id) # what does this do?
    @innings = 1.0
    @pts_per_inning = {}
  end

  def calculate # beginning of inning
  @base_state = 1
  @outs = 0
  @home_runs = 0
  @visitor_runs = 0

    @turns.each do |row| #on each turn
      if @outs == 3 # reset
        @base_state = 1
        @outs = 0
        @innings += 0.5
      end

      if row.at_bat == "visitor" # team_2 is at bat
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
            @pts_per_inning[@innings] += 1
        		@visitor_runs += 1
        		# doubleplay
        	elsif @base_state == 7
        		@base_state = 4
        		@outs += 1
            @pts_per_inning[@innings] += 1
        		@visitor_runs += 1
        	elsif @base_state == 8
        		@base_state = 6
        		@outs += 1
            @pts_per_inning[@innings] += 1
        		@visitor_runs += 1
        		# doubleplay
        	end

        elsif row.result == "SO"
          # copy logic from 3_at_bat_class but prepend runs with 'visitor_' and add '@pts_per_inning[@innings] += 1 ' for each run
        end

      end # end row.result for visitor batting

          # use result to determine ending base_state


      if row.at_bat == "home" # = team 1
        if row.result == "PU"
          if @base_state == 1
          		@outs += 1
          elsif @base_state == 2
          		@outs += 1
          elsif @base_state == 3
          		@outs += 1
          elsif @base_state == 4
          		@outs += 1
          elsif @base_state == 5
          		@outs += 1
          elsif @base_state == 6
          		@outs += 1
          elsif @base_state == 7
          		@outs += 1
          elsif @base_state == 8
          		@outs += 1
          end

        elsif row.result == "GB"
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
            @pts_per_inning[@innings] += 1
            @home_runs += 1
        	elsif @base_state == 5
        		@base_state = 6
        		@outs += 1
        		# doubleplay
        	elsif @base_state == 6
        		@base_state = 2
        		@outs += 1
            @pts_per_inning[@innings] += 1
            @home_runs += 1
        		# doubleplay
        	elsif @base_state == 7
        		@base_state = 4
        		@outs += 1
            @pts_per_inning[@innings] += 1
        		@home_runs += 1
        	elsif @base_state == 8
        		@base_state = 6
        		@outs += 1
            @pts_per_inning[@innings] += 1
        		@home_runs += 1
        		# doubleplay
        	end
        end
        # elsif # .... repeat
        # end

      end # end row.result for home advantage

    end # @turns.each do
  end # def calculate
end # class



# this logic can be used later
# determine pitcher control
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
