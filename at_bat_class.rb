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

def PU
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

def SO
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
end

def FB
	if @base_state == 1
		@outs += 1
	elsif @base_state == 2
		@outs += 1
	elsif @base_state == 3
		@outs += 1
		# extrabase
	elsif @base_state == 4
		@outs += 1
		# extrabase
	elsif @base_state == 5
		@outs += 1
		# extrabase
	elsif @base_state == 6
		@outs += 1
		# extrabase
	elsif @base_state == 7
		@outs += 1
		# extrabase x 2
	elsif @base_state == 8
		@outs += 1
		# extrabase x 2
	end
end

def BB
	if @base_state == 1
		@base_state = 2
	elsif @base_state == 2
		@base_state = 5
	elsif @base_state == 3
		@base_state = 5
	elsif @base_state == 4
		@base_state = 6
	elsif @base_state == 5
		@base_state = 8
	elsif @base_state == 6
		@base_state = 8
	elsif @base_state == 7
		@base_state = 8
	elsif @base_state == 8
		@base_state = 8
		@runs += 1
	end
end

def _1B
	if @base_state == 1
		@base_state = 2
	elsif @base_state == 2
		@base_state = 5
	elsif @base_state == 3
		@base_state = 6
	elsif @base_state == 4
		@base_state = 2
		@runs += 1
	elsif @base_state == 5
		@base_state = 8
	elsif @base_state == 6
		@base_state = 5
		@runs += 1
	elsif @base_state == 7
		@base_state = 6
		@runs += 1
	elsif @base_state == 8
		@base_state = 8
		@runs += 1
	end
end

def _1BP
	if @base_state == 1
		@base_state = 3
	elsif @base_state == 2
		@base_state = 5
	elsif @base_state == 3
		@base_state = 7
	elsif @base_state == 4
		@base_state = 3
		@runs += 1
	elsif @base_state == 5
		@base_state = 8
	elsif @base_state == 6
		@base_state = 5
		@runs += 1
	elsif @base_state == 7
		@base_state = 7
		@runs += 1
	elsif @base_state == 8
		@base_state = 8
		@runs += 1
	end
end

def _2B
	if @base_state == 1
		@base_state = 3
	elsif @base_state == 2
		@base_state = 7
	elsif @base_state == 3
		@base_state = 3
		@runs += 1
	elsif @base_state == 4
		@base_state = 3
		@runs += 1
	elsif @base_state == 5
		@base_state = 7
		@runs += 1
	elsif @base_state == 6
		@base_state = 7
		@runs += 1
	elsif @base_state == 7
		@base_state = 3
		@runs += 2
	elsif @base_state == 8
		@base_state = 7
		@runs += 2
	end
end

def _3B
	if @base_state == 1
		@base_state = 4
	elsif @base_state == 2
		@base_state = 4
		@runs += 1
	elsif @base_state == 3
		@base_state = 4
		@runs += 1
	elsif @base_state == 4
		@base_state = 4
		@runs += 1
	elsif @base_state == 5
		@base_state = 4
		@runs += 2
	elsif @base_state == 6
		@base_state = 4
		@runs += 2
	elsif @base_state == 7
		@base_state = 4
		@runs += 2
	elsif @base_state == 8
		@base_state = 4
		@runs += 3
	end
end

def _HR
	if @base_state == 1
		@base_state = 1
		@runs += 1
	elsif @base_state == 2
		@base_state = 1
		@runs += 2
	elsif @base_state == 3
		@base_state = 1
		@runs += 2
	elsif @base_state == 4
		@base_state = 1
		@runs += 2
	elsif @base_state == 5
		@base_state = 1
		@runs += 3
	elsif @base_state == 6
		@base_state = 1
		@runs += 3
	elsif @base_state == 7
		@base_state = 1
		@runs += 3
	elsif @base_state == 8
		@base_state = 1
		@runs += 4
	end
end

def IBB
	if @base_state == 1
		@base_state = 2
	elsif @base_state == 2
		@base_state = 5
	elsif @base_state == 3
		@base_state = 5
	elsif @base_state == 4
		@base_state = 6
	elsif @base_state == 5
		@base_state = 8
	elsif @base_state == 6
		@base_state = 8
	elsif @base_state == 7
		@base_state = 8
	elsif @base_state == 8
		@base_state = 8
		@runs += 1
	end
end

def SB
	if @base_state == 1
		@base_state = 1
		@outs += 1
	elsif @base_state == 2
		@base_state = 3
		@outs += 1
	elsif @base_state == 3
		@base_state = 4
		@outs += 1
	elsif @base_state == 4
		@base_state = 4
		@outs += 1
	elsif @base_state == 5
		@base_state = 7
		@outs += 1
	elsif @base_state == 6
		@base_state = 7
		@outs += 1
	elsif @base_state == 7
		@base_state = 7
		@outs += 1
	elsif @base_state == 8
		@base_state = 8
		@outs += 1
	end
end

def F1B
	if @base_state == 3
		@base_state = 1
		@outs += 1
	elsif @base_state == 4
		@base_state = 1
		@outs += 1
	elsif @base_state == 5
		@base_state = 2
		@outs += 1
	elsif @base_state == 6
		@base_state = 2
		@outs += 1
	elsif @base_state == 7
		@base_state = 3
		@outs += 1
	elsif @base_state == 8
		@base_state = 5
		@outs += 1
	end
end

	def S1B
		if @base_state == 3
			@base_state = 4
		elsif @base_state == 4
			@base_state = 1
			@runs += 1
		elsif @base_state == 5
			@base_state = 6
		elsif @base_state == 6
			@base_state = 2
			@runs += 1
		elsif @base_state == 7
			@base_state = 3
			@runs += 1
		elsif @base_state == 8
			@base_state = 5
			@runs += 1
		end
	end

	def S2B
		if @base_state == 7
			@base_state = 4
			@runs += 1
		elsif @base_state == 8
			@base_state = 6
			@runs += 1
		end
	end

	def F2BL
		if @base_state == 7
			@base_state = 4
			@outs += 1
		elsif @base_state == 8
			@base_state = 6
			@outs += 1
		end
	end

	def F2BT
		if @base_state == 7
			@base_state = 1
			@outs += 1
			@runs += 1
		elsif @base_state == 8
			@base_state = 2
			@outs += 1
			@runs += 1
		end
	end

	def SS
		if @base_state == 2
			@base_state = 3
		elsif @base_state == 3
			@base_state = 4
		elsif @base_state == 5
			@base_state = 6
		elsif @base_state == 6
			@base_state = 7
		end
	end

	def FS
		if @base_state == 2
			@base_state = 1
			@outs += 1
		elsif @base_state == 3
			@base_state = 1
			@outs += 1
		elsif @base_state == 5
			@base_state = 2
			@outs += 1
		elsif @base_state == 6
			@base_state = 4
			@outs += 1
		end
	end


return "Base state: " + @base_state.to_s +
"\nOuts: " + @outs.to_s +
"\nRuns: " + @runs.to_s

end
end

# batter1 = At_bat.new(8, 1, 1)
