pitcher_roll = rand(1..20)
batter_roll = rand(1..20)

# read the player 1's pitcher table
control = pitcher.control
# read the player 2's batter table
onbase = batter.onbase

# arr_of_arrs = CSV.read(filename)?
________
if pitcher_roll + control > onbase
  advantage = "pitcher"
else
  advantage = "batter"
end
_______
