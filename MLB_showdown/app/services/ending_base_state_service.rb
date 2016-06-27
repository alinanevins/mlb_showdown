class EndingBaseStateService

  attr_accessor :base_state_id, :result, :outs, :home_runs, :visitor_runs, :at_bat, :pts_per_inning

  def initialize(base_state_id, result, outs, home_runs, visitor_runs, at_bat, pts_per_inning)
    @base_state_id = base_state_id
    @result = result
    @outs = outs
    @home_runs = home_runs
    @visitor_runs = visitor_runs
    @pts_per_inning = pts_per_inning
    @at_bat = at_bat

  end

  def calculate_ending_base_state
    if @result == "PU"
      @outs += 1
    elsif @result == "SO"
      @outs += 1
    elsif @result == "GB"
      if @base_state_id == 1
        @outs += 1
      elsif @base_state_id == 2
        @outs += 1
        # doubleplay
      elsif @base_state_id == 3
        @outs += 1
        @base_state_id = 4
      elsif @base_state_id == 4
        @outs += 1
        @base_state_id = 1
        @pts_per_inning += 1
        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end

      elsif @base_state_id == 5
        @outs += 1
        @base_state_id = 6
        # doubleplay
      elsif @base_state_id == 6
        @outs += 1
        @base_state_id = 2
        @pts_per_inning += 1
        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end

        # doubleplay
      elsif @base_state_id == 7
        @outs += 1
        @base_state_id = 4
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


      elsif @base_state_id == 8
        @outs += 1
        @base_state_id = 6
        @pts_per_inning += 1
        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end
        # doubleplay
      end
    elsif @result == "FB"
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
    elsif @result == "BB"
      if @base_state_id == 1
        @base_state_id = 2
      elsif @base_state_id == 2
        @base_state_id = 5
      elsif @base_state_id == 3
        @base_state_id = 5
      elsif @base_state_id == 4
        @base_state_id = 6
      elsif @base_state_id == 5
        @base_state_id = 8
      elsif @base_state_id == 6
        @base_state_id = 8
      elsif @base_state_id == 7
        @base_state_id = 8
      elsif @base_state_id == 8
        @base_state_id = 8
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


      end
    elsif @result == "_1B"
      if @base_state_id == 1
        @base_state_id = 2
      elsif @base_state_id == 2
        @base_state_id = 5
        #chance for 1 extra base
      elsif @base_state_id == 3
        @base_state_id = 6
        #chance for 1 extra base
      elsif @base_state_id == 4
        @base_state_id = 2
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


      elsif @base_state_id == 5
        @base_state_id = 8
        #chance for 2 extra bases
      elsif @base_state_id == 6
        @base_state_id = 5
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


        #chance for 1 extra base
      elsif @base_state_id == 7
        @base_state_id = 6
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


        #chance for 1 extra base
      elsif @base_state_id == 8
        @base_state_id = 8
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


        #chance for 2 extra bases
      end
    elsif @result == "_1Bplus"
      if @base_state_id == 1
        @base_state_id = 3
      elsif @base_state_id == 2
        @base_state_id = 5
        #chance for 1 extra base
      elsif @base_state_id == 3
        @base_state_id = 7
        #chance for 1 extra base
      elsif @base_state_id == 4
        @base_state_id = 3
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


      elsif @base_state_id == 5
        @base_state_id = 8
        #chance for 2 extra bases
      elsif @base_state_id == 6
        @base_state_id = 5
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


        #chance for 1 extra base
      elsif @base_state_id == 7
        @base_state_id = 7
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


        #chance for 1 extra base
      elsif @base_state_id == 8
        @base_state_id = 8
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


        #chance for 2 extra bases
      end
    elsif @result == "_2B"
      if @base_state_id == 1
        @base_state_id = 3
      elsif @base_state_id == 2
        @base_state_id = 7
        #chance for 1 extra base
      elsif @base_state_id == 3
        @base_state_id = 3
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


      elsif @base_state_id == 4
        @base_state_id = 3
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


      elsif @base_state_id == 5
        @base_state_id = 7
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


        #chance for 1 extra base
      elsif @base_state_id == 6
        @base_state_id = 7
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


        #chance for 1 extra base
      elsif @base_state_id == 7
        @base_state_id = 3
        @pts_per_inning += 2

        if @at_bat == 'visitor'
          @visitor_runs += 2
        elsif @at_bat == 'home'
          @home_runs += 2
        end


      elsif @base_state_id == 8
        @base_state_id = 7
        @pts_per_inning += 2

        if @at_bat == 'visitor'
          @visitor_runs += 2
        elsif @at_bat == 'home'
          @home_runs += 2
        end


        #chance for 1 extra base
      end
    elsif @result == "_3B"
      @base_state_id = 4
      if @base_state_id == 1
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


      elsif @base_state_id == 2
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


      elsif @base_state_id == 3
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


      elsif @base_state_id == 4
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


      elsif @base_state_id == 5
        @pts_per_inning += 2

        if @at_bat == 'visitor'
          @visitor_runs += 2
        elsif @at_bat == 'home'
          @home_runs += 2
        end


      elsif @base_state_id == 6
        @pts_per_inning += 2

        if @at_bat == 'visitor'
          @visitor_runs += 2
        elsif @at_bat == 'home'
          @home_runs += 2
        end


      elsif @base_state_id == 7
        @pts_per_inning += 2

        if @at_bat == 'visitor'
          @visitor_runs += 2
        elsif @at_bat == 'home'
          @home_runs += 2
        end


      elsif @base_state_id == 8
        @pts_per_inning += 3

        if @at_bat == 'visitor'
          @visitor_runs += 3
        elsif @at_bat == 'home'
          @home_runs += 3
        end


      end
    elsif @result == "_HR"
      if @base_state_id == 1
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


      elsif @base_state_id == 2
        @pts_per_inning += 2

        if @at_bat == 'visitor'
          @visitor_runs += 2
        elsif @at_bat == 'home'
          @home_runs += 2
        end


      elsif @base_state_id == 3
        @pts_per_inning += 2

        if @at_bat == 'visitor'
          @visitor_runs += 2
        elsif @at_bat == 'home'
          @home_runs += 2
        end


      elsif @base_state_id == 4
        @pts_per_inning += 2

        if @at_bat == 'visitor'
          @visitor_runs += 2
        elsif @at_bat == 'home'
          @home_runs += 2
        end


      elsif @base_state_id == 5
        @pts_per_inning += 3

        if @at_bat == 'visitor'
          @visitor_runs += 3
        elsif @at_bat == 'home'
          @home_runs += 3
        end


      elsif @base_state_id == 6
        @pts_per_inning += 3

        if @at_bat == 'visitor'
          @visitor_runs += 3
        elsif @at_bat == 'home'
          @home_runs += 3
        end


      elsif @base_state_id == 7
        @pts_per_inning += 3

        if @at_bat == 'visitor'
          @visitor_runs += 3
        elsif @at_bat == 'home'
          @home_runs += 3
        end


      elsif @base_state_id == 8
        @pts_per_inning += 4

        if @at_bat == 'visitor'
          @visitor_runs += 4
        elsif @at_bat == 'home'
          @home_runs += 4
        end


      end
      @base_state_id = 1
    elsif @result == "SB"
      if @base_state_id == 1
        @outs += 1
      elsif @base_state_id == 2
        @outs += 1
        @base_state_id = 3
      elsif @base_state_id == 3
        @outs += 1
        @base_state_id = 4
      elsif @base_state_id == 4
        @outs += 1
        @base_state_id = 4
      elsif @base_state_id == 5
        @outs += 1
        @base_state_id = 7
      elsif @base_state_id == 6
        @outs += 1
        @base_state_id = 7
      elsif @base_state_id == 7
        @outs += 1
        @base_state_id = 7
      elsif @base_state_id == 8
        @outs += 1
        @base_state_id = 8
      end
    elsif @result == "F1B"
      if @base_state_id == 1
        #Should never happen
      elsif @base_state_id == 2
        #Should never happen
      elsif @base_state_id == 3
        @outs += 1
        @base_state_id = 1
      elsif @base_state_id == 4
        @outs += 1
        @base_state_id = 1
      elsif @base_state_id == 5
        @outs += 1
        @base_state_id = 2
      elsif @base_state_id == 6
        @outs += 1
        @base_state_id = 2
      elsif @base_state_id == 7
        @outs += 1
        @base_state_id = 3
      elsif @base_state_id == 8
        @outs += 1
        @base_state_id = 5
      end
    elsif @result == "S1B"
      if @base_state_id == 1
        #Should never happen
      elsif @base_state_id == 2
        #Should never happen
      elsif @base_state_id == 3
        @base_state_id = 4
      elsif @base_state_id == 4
        @base_state_id = 1
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


      elsif @base_state_id == 5
        @base_state_id = 6
      elsif @base_state_id == 6
        @base_state_id = 2
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


      elsif @base_state_id == 7
        @base_state_id = 3
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


      elsif @base_state_id == 8
        @base_state_id = 5
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


      end
    elsif @result == "S2B"
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
        @base_state_id = 4
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


      elsif @base_state_id == 8
        @base_state_id = 6
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


      end
    elsif @result == "F2BL"
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
        @base_state_id = 4
        @outs += 1
      elsif @base_state_id == 8
        @base_state_id = 6
        @outs += 1
      end
    elsif @result == "F2BT"
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
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


        @base_state_id = 1
        @outs += 1
      elsif @base_state_id == 8
        @pts_per_inning += 1

        if @at_bat == 'visitor'
          @visitor_runs += 1
        elsif @at_bat == 'home'
          @home_runs += 1
        end


        @base_state_id = 2
        @outs += 1
      end
    elsif @result == "SS"
      if @base_state_id == 1
        #Should never happen
      elsif @base_state_id == 2
        @base_state_id = 3
      elsif @base_state_id == 3
        @base_state_id = 4
      elsif @base_state_id == 4
        #Should never happen
      elsif @base_state_id == 5
        @base_state_id = 6
      elsif @base_state_id == 6
        @base_state_id = 7
      elsif @base_state_id == 7
        #Should never happen
      elsif @base_state_id == 8
        #Should never happen
      end
    elsif @result == "FS"
      if @base_state_id == 1
        #Should never happen
      elsif @base_state_id == 2
        @base_state_id = 1
        @outs += 1
      elsif @base_state_id == 3
        @base_state_id = 1
        @outs += 1
      elsif @base_state_id == 4
        #Should never happen
      elsif @base_state_id == 5
        @base_state_id = 2
        @outs += 1
      elsif @base_state_id == 6
        @base_state_id = 4
        @outs += 1
      elsif @base_state_id == 7
        #Should never happen
      elsif @base_state_id == 8
        #Should never happen
      end
    end
    @ending_base_state_id = @base_state_id
    binding.pry
  end
end
