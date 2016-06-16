require 'pry'

outs = 0
runs = 0

class At_bat

attr_accessor :base_state, :outs, :runs

def initialize(base_state, outs, runs)
	@base_state = base_state
	@outs = outs
	@runs = runs
end

def pu
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
end

def GB
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
@runs += 1
	elsif @base_state == 5
		@base_state = 6
		@outs += 1
		# doubleplay
elsif @base_state == 6
		@base_state = 2
@outs += 1
@runs += 1
# doubleplay
elsif @base_state == 7
		@base_state = 4
@outs += 1
@runs += 1
	elsif @base_state == 8
		@base_state = 6
@outs += 1
@runs += 1
# doubleplay
end

return "Base state: " + @base_state.to_s +
"\nOuts: " + @outs.to_s +
"\nRuns: " + @runs.to_s

end
end

batter1 = At_bat.new(8, 1, 1)
