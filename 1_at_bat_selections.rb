# Game Play
# At bat- for each team, repeat while outs < 3
# Begin with home team pitching, visitors at bat

outs = 0
basestate = 1
visitor_batter_count = 0
home_batter_count = 0
visitor_pitcher_selector = 1
home_pitcher_selector = 1

##########

ninth_or_later = innings >9
home_ahead = (home_runs > visitor_runs)
visitor_ahead_end_of_inning = (home_runs < visitor_runs && innings % 1 == .5 && outs = 3)
while (ninth_or_later && !home_ahead && !visitor_ahead_end_of_inning)

# Pitching User makes selection

visitor_batter_count = 1 + visitor_batter_count % 9
#second time through, home_batter_count = 1 + home_batter_count % 9


if home = "team_2"
  p = T2Pitcher.find(home_pitcher_selector)
  b = T1Batter.find(visitor_batter_count)
elsif home = "team_1"
  p = T1Pitcher.find(visitor_pitcher_selector)
  b = T2Batter.find(home_batter_count)
end


puts "The current pitcher is #{p.nameFull}"
puts "The current batter is #{b.nameFull}"


puts pitching_team + " team, your pitch.
Choose one of the following options:
Enter P to pitch to the batter
Enter W to intentionally walk the batter
		Enter R to substitute a new pitcher
		Enter S to substitute a fielder or change your defensive alignment"
		end
	pitch_choice = gets.chomp.strip.upcase
	if pitch_choice == "W"
		result = "BB"
	elsif pitch_choice == "R"
		puts pitching_team + " team, you want to .
		Choose one of the following options:
		Enter P to pitch to the batter
		Enter W to intentionally walk the batter
				Enter R to substitute a new pitcher
				Enter S to substitute a fielder or change your defensive alignment"
		# restart
	elsif pitch_choice == "S"
		# substitute a new fielder
		# restart
	# edge case if they didn’t enter any of them
	end


# Batting User makes selection
	puts batting_team + " team, choose one of the following options:
		Enter H to attempt to hit the ball (swing?)
		Enter S to attempt a steal
		Enter B to bunt the ball and sacrifice yourself
		Enter P to substitute a new batter or runner"
		end
	batter_choice = gets.chomp.strip.upcase
	if batter_choice == "S"
		at_bat.steal	# steal
	elsif batter_choice == "B"
		at_bat.steal	# bunt
	elsif batter_choice == "P"
		# substitute a new batter/runner
		# restart
	# edge case if they didn’t enter any of them

if (pitcher_choice == “P”) && (batter_choice == "H")
  a_roll = rand(1..20)
  if ( roll + pitcher_control ) > batter_onbase # will reference a column
	advantage = "pitcher"
  b_roll = rand(1..20)
  # enter at_bat class methods


# Batting User tags up/takes extra bases
If previous result == "FB" && post-at bat state %in% 3:8
	# Or If previous result %in% (1B, 1B+, 2B) AND post-at bat state %in% 5:8
  puts batting_team + " team, choose one of the following options:
	Enter 0 to try and advance no runners
  Enter 1 to try and advance the lead runner"
  if ( previous result == "FB" && post-at bat state %in% 7:8 ) || ( previous result %in% (1B, 1B+) && post-at bat state == 8 )
			puts "Enter 2 to try and advance both runners"
	end
end
