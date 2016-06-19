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
        if row.result == "PU"
        		@outs += 1
        end
        if row.result == "SO"
            @outs += 1
        end
        if row.result == "GB"
          if @base_state_id == 1
        		@outs += 1
        	elsif @base_state_id == 2
        		@outs += 1
        		# doubleplay
        	elsif @base_state_id == 3
        		@outs += 1
            @ending_base_state_id = 4
        	elsif @base_state_id == 4
            @outs += 1
        		@ending_base_state_id = 1
            @pts_per_inning[@innings] += 1 # add to every run
        		if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
        	elsif @base_state_id == 5
            @outs += 1
        		@ending_base_state_id = 6
        		# doubleplay
        	elsif @base_state_id == 6
            @outs += 1
        		@ending_base_state_id = 2
            @pts_per_inning[@innings] += 1
        		if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
        		# doubleplay
        	elsif @base_state_id == 7
            @outs += 1
        		@ending_base_state_id = 4
            @pts_per_inning[@innings] += 1
        		if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
        	elsif @base_state_id == 8
            @outs += 1
        		@ending_base_state_id = 6
            @pts_per_inning[@innings] += 1
        		if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
        		# doubleplay
          end
        end
        if row.result == "FB"
          if @base_state_id == 1
        		@outs += 1
        	elsif @base_state_id == 2
        		@outs += 1
        	elsif @base_state_id == 3
        		@outs += 1
            #chance for 1 extra base
        	elsif @base_state_id == 4
            @outs += 1
            #chance for 1 extra base
        	elsif @base_state_id == 5
            @outs += 1
            #chance for 1 extra base
        	elsif @base_state_id == 6
            @outs += 1
            #chance for 1 extra base
        	elsif @base_state_id == 7
            @outs += 1
            #chance for 2 extra bases
        	elsif @base_state_id == 8
            @outs += 1
            #chance for 2 extra bases
        	end
        end
        if row.result == "BB"
          if @base_state_id == 1
        		@ending_base_state_id = 2
        	elsif @base_state_id == 2
        		@ending_base_state_id = 5
        	elsif @base_state_id == 3
        		@ending_base_state_id = 5
        	elsif @base_state_id == 4
            @ending_base_state_id = 6
        	elsif @base_state_id == 5
            @ending_base_state_id = 8
        	elsif @base_state_id == 6
            @ending_base_state_id = 8
        	elsif @base_state_id == 7
            @ending_base_state_id = 8
        	elsif @base_state_id == 8
            @ending_base_state_id = 8
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
        	end
        end
        if row.result == "_1B"
          if @base_state_id == 1
        		@ending_base_state_id = 2
        	elsif @base_state_id == 2
        		@ending_base_state_id = 5
            #chance for 1 extra base
        	elsif @base_state_id == 3
        		@ending_base_state_id = 6
            #chance for 1 extra base
        	elsif @base_state_id == 4
            @ending_base_state_id = 2
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
        	elsif @base_state_id == 5
            @ending_base_state_id = 8
            #chance for 2 extra bases
        	elsif @base_state_id == 6
            @ending_base_state_id = 5
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
            #chance for 1 extra base
        	elsif @base_state_id == 7
            @ending_base_state_id = 6
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
            #chance for 1 extra base
        	elsif @base_state_id == 8
            @ending_base_state_id = 8
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
            #chance for 2 extra bases
        	end
        end
        if row.result == "_1Bplus"
          if @base_state_id == 1
        		@ending_base_state_id = 3
        	elsif @base_state_id == 2
        		@ending_base_state_id = 5
            #chance for 1 extra base
        	elsif @base_state_id == 3
        		@ending_base_state_id = 7
            #chance for 1 extra base
        	elsif @base_state_id == 4
            @ending_base_state_id = 3
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
        	elsif @base_state_id == 5
            @ending_base_state_id = 8
            #chance for 2 extra bases
        	elsif @base_state_id == 6
            @ending_base_state_id = 5
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
            #chance for 1 extra base
        	elsif @base_state_id == 7
            @ending_base_state_id = 7
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
            #chance for 1 extra base
        	elsif @base_state_id == 8
            @ending_base_state_id = 8
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
            #chance for 2 extra bases
        	end
        end
        if row.result == "_2B"
          if @base_state_id == 1
            @ending_base_state_id = 3
          elsif @base_state_id == 2
            @ending_base_state_id = 7
            #chance for 1 extra base
          elsif @base_state_id == 3
            @ending_base_state_id = 3
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
          elsif @base_state_id == 4
            @ending_base_state_id = 3
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
          elsif @base_state_id == 5
            @ending_base_state_id = 7
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
            #chance for 1 extra base
          elsif @base_state_id == 6
            @ending_base_state_id = 7
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
            #chance for 1 extra base
          elsif @base_state_id == 7
            @ending_base_state_id = 3
            @pts_per_inning[@innings] += 2
            if row.at_bat == "visitor"
              @visitor_runs += 2
            elsif row.at_bat == "home"
              @home_runs += 2
            end
          elsif @base_state_id == 8
            @ending_base_state_id = 7
            @pts_per_inning[@innings] += 2
            if row.at_bat == "visitor"
              @visitor_runs += 2
            elsif row.at_bat == "home"
              @home_runs += 2
            end
            #chance for 1 extra base
          end
        end
        if row.result == "_3B"
          @ending_base_state_id = 4
          if @base_state_id == 1
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
          elsif @base_state_id == 2
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
          elsif @base_state_id == 3
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
          elsif @base_state_id == 4
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
          elsif @base_state_id == 5
            @pts_per_inning[@innings] += 2
            if row.at_bat == "visitor"
              @visitor_runs += 2
            elsif row.at_bat == "home"
              @home_runs += 2
            end
          elsif @base_state_id == 6
            @pts_per_inning[@innings] += 2
            if row.at_bat == "visitor"
              @visitor_runs += 2
            elsif row.at_bat == "home"
              @home_runs += 2
            end
          elsif @base_state_id == 7
            @pts_per_inning[@innings] += 2
            if row.at_bat == "visitor"
              @visitor_runs += 2
            elsif row.at_bat == "home"
              @home_runs += 2
            end
          elsif @base_state_id == 8
            @pts_per_inning[@innings] += 3
            if row.at_bat == "visitor"
              @visitor_runs += 3
            elsif row.at_bat == "home"
              @home_runs += 3
            end
          end
        end
        if row.result == "_HR"
          @ending_base_state_id = 1
          if @base_state_id == 1
            @pts_per_inning[@innings] += 2
            if row.at_bat == "visitor"
              @visitor_runs += 2
            elsif row.at_bat == "home"
              @home_runs += 2
            end
          elsif @base_state_id == 2
            @pts_per_inning[@innings] += 2
            if row.at_bat == "visitor"
              @visitor_runs += 2
            elsif row.at_bat == "home"
              @home_runs += 2
            end
          elsif @base_state_id == 3
            @pts_per_inning[@innings] += 2
            if row.at_bat == "visitor"
              @visitor_runs += 2
            elsif row.at_bat == "home"
              @home_runs += 2
            end
          elsif @base_state_id == 4
            @pts_per_inning[@innings] += 2
            if row.at_bat == "visitor"
              @visitor_runs += 2
            elsif row.at_bat == "home"
              @home_runs += 2
            end
          elsif @base_state_id == 5
            @pts_per_inning[@innings] += 3
            if row.at_bat == "visitor"
              @visitor_runs += 3
            elsif row.at_bat == "home"
              @home_runs += 3
            end
          elsif @base_state_id == 6
            @pts_per_inning[@innings] += 3
            if row.at_bat == "visitor"
              @visitor_runs += 3
            elsif row.at_bat == "home"
              @home_runs += 3
            end
          elsif @base_state_id == 7
            @pts_per_inning[@innings] += 3
            if row.at_bat == "visitor"
              @visitor_runs += 3
            elsif row.at_bat == "home"
              @home_runs += 3
            end
          elsif @base_state_id == 8
            @pts_per_inning[@innings] += 4
            if row.at_bat == "visitor"
              @visitor_runs += 4
            elsif row.at_bat == "home"
              @home_runs += 4
            end
          end
        end
        if row.result == "SB"
          if @base_state_id == 1
        		@outs += 1
        	elsif @base_state_id == 2
        		@outs += 1
            @ending_base_state_id = 3
        	elsif @base_state_id == 3
            @outs += 1
        		@ending_base_state_id = 4
        	elsif @base_state_id == 4
            @outs += 1
        		@ending_base_state_id = 4
        	elsif @base_state_id == 5
            @outs += 1
        		@ending_base_state_id = 7
        	elsif @base_state_id == 6
            @outs += 1
        		@ending_base_state_id = 7
        	elsif @base_state_id == 7
            @outs += 1
        		@ending_base_state_id = 7
        	elsif @base_state_id == 8
            @outs += 1
        		@ending_base_state_id = 8
          end
        end
        if row.result == "F1B"
          if @base_state_id == 1
        		#Should never happen
        	elsif @base_state_id == 2
        		#Should never happen
        	elsif @base_state_id == 3
            @outs += 1
        		@ending_base_state_id = 1
        	elsif @base_state_id == 4
            @outs += 1
        		@ending_base_state_id = 1
        	elsif @base_state_id == 5
            @outs += 1
        		@ending_base_state_id = 2
        	elsif @base_state_id == 6
            @outs += 1
        		@ending_base_state_id = 2
        	elsif @base_state_id == 7
            @outs += 1
        		@ending_base_state_id = 3
        	elsif @base_state_id == 8
            @outs += 1
        		@ending_base_state_id = 5
          end
        end
        if row.result == "S1B"
          if @base_state_id == 1
        		#Should never happen
        	elsif @base_state_id == 2
        		#Should never happen
        	elsif @base_state_id == 3
        		@ending_base_state_id = 4
        	elsif @base_state_id == 4
        		@ending_base_state_id = 1
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
        	elsif @base_state_id == 5
        		@ending_base_state_id = 6
        	elsif @base_state_id == 6
        		@ending_base_state_id = 2
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
        	elsif @base_state_id == 7
        		@ending_base_state_id = 3
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
        	elsif @base_state_id == 8
        		@ending_base_state_id = 5
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
          end
        end
        if row.result == "S2B"
          if @base_state_id == 1
        		#Should never happen
        	elsif @base_state_id == 2
        		#Should never happen
        	elsif @base_state_id == 3
        		#Should never happen
        	elsif @base_state_id == 4
        		#Should never happen
        	elsif @base_state_id == 5
        		#Should never happen
        	elsif @base_state_id == 6
        		#Should never happen
        	elsif @base_state_id == 7
        		@ending_base_state_id = 4
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
        	elsif @base_state_id == 8
        		@ending_base_state_id = 6
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
          end
        end
        if row.result == "F2BL"
          if @base_state_id == 1
        		#Should never happen
        	elsif @base_state_id == 2
        		#Should never happen
        	elsif @base_state_id == 3
        		#Should never happen
        	elsif @base_state_id == 4
        		#Should never happen
        	elsif @base_state_id == 5
        		#Should never happen
        	elsif @base_state_id == 6
        		#Should never happen
        	elsif @base_state_id == 7
        		@ending_base_state_id = 4
            @outs += 1
        	elsif @base_state_id == 8
        		@ending_base_state_id = 6
            @outs += 1
          end
        end
        if row.result == "F2BT"
          if @base_state_id == 1
        		#Should never happen
        	elsif @base_state_id == 2
        		#Should never happen
        	elsif @base_state_id == 3
        		#Should never happen
        	elsif @base_state_id == 4
        		#Should never happen
        	elsif @base_state_id == 5
        		#Should never happen
        	elsif @base_state_id == 6
        		#Should never happen
        	elsif @base_state_id == 7
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
        		@ending_base_state_id = 1
            @outs += 1
        	elsif @base_state_id == 8
            @pts_per_inning[@innings] += 1
            if row.at_bat == "visitor"
              @visitor_runs += 1
            elsif row.at_bat == "home"
              @home_runs += 1
            end
        		@ending_base_state_id = 2
            @outs += 1
          end
        end
        if row.result == "SS"
          if @base_state_id == 1
        		#Should never happen
        	elsif @base_state_id == 2
        		@ending_base_state_id = 3
        	elsif @base_state_id == 3
        		@ending_base_state_id = 4
        	elsif @base_state_id == 4
        		#Should never happen
        	elsif @base_state_id == 5
        		@ending_base_state_id = 6
        	elsif @base_state_id == 6
        		@ending_base_state_id = 7
        	elsif @base_state_id == 7
            #Should never happen
        	elsif @base_state_id == 8
            #Should never happen
          end
        end
        if row.result == "FS"
          if @base_state_id == 1
        		#Should never happen
        	elsif @base_state_id == 2
        		@ending_base_state_id = 1
            @outs += 1
        	elsif @base_state_id == 3
            @ending_base_state_id = 1
            @outs += 1
        	elsif @base_state_id == 4
        		#Should never happen
        	elsif @base_state_id == 5
            @ending_base_state_id = 2
            @outs += 1
        	elsif @base_state_id == 6
            @ending_base_state_id = 4
            @outs += 1
        	elsif @base_state_id == 7
            #Should never happen
        	elsif @base_state_id == 8
            #Should never happen
          end
        end



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
