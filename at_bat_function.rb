def GB(base_state, outs, runs)
  if base_state == 1
  		outs += 1
  elsif base_state == 2
  		outs += 1
  		# doubleplay
  elsif base_state == 3
  		base_state = 4
      outs += 1
  elsif base_state == 4
  		base_state = 1
      outs += 1
      runs += 1
  elsif base_state == 5
  		base_state = 6
  		outs += 1
  		# doubleplay
  elsif base_state == 6
  		base_state = 2
      outs += 1
      runs += 1
      # doubleplay
  elsif base_state == 7
  		base_state = 4
      outs += 1
      runs += 1
  elsif base_state == 8
  		base_state = 6
      outs += 1
      runs += 1
      # doubleplay
  end
end
