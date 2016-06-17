# x = row of the current pitcher
# y = row of the current pitcher

p = T2Pitcher.find(x)
b = T1Batter.find(y)

puts "The current pitcher is #{p.nameFull}"
puts "The current batter is #{b.nameFull}"

roll_1 = rand(1..20)
total_control = roll_1 + p.control

puts "Pitcher, you rolled a #{roll_1}.
Your control is #{p.control}.
Your roll plus your control is #{total_control}.\n"

if total_control > b.onbase
  puts "Therefore, the pitcher has the advantage."
  @advantage = "pitcher"
else
  puts "Therefore, the batter has the advantage."
  @advantage = "batter"
end

roll_2 = rand(1..20)

if advantage == "pitcher"
  if roll_2 < p.PU
    result = "PU"
  elsif roll_2 < ( p.PU + p.SO )
    result = "SO"
  elsif roll_2 < ( p.PU + p.SO + p.GB )
    result = "GB"
  elsif roll_2 < ( p.PU + p.SO + p.GB + p.FB )
    result = "FB"
  elsif roll_2 < ( p.PU + p.SO + p.GB + p.FB + p.BB )
    result = "BB"
  elsif roll_2 < ( p.PU + p.SO + p.GB + p.FB + p.BB + p._1B )
    result = "_1B"
  elsif roll_2 < ( p.PU + p.SO + p.GB + p.FB + p.BB + p._1B + p._2B )
    result = "_2B"
  elsif roll_2 < ( p.PU + p.SO + p.GB + p.FB + p.BB + p._1B + p._2B + p._HR )
    result = "_HR"
  end

else # advantage == "batter"
  if roll_2 < b.SO
    result = "SO"
  elsif roll_2 < ( b.SO + b.GB )
    result = "GB"
  elsif roll_2 < ( b.SO + b.GB + b.FB )
    result = "FB"
  elsif roll_2 < ( b.SO + b.GB + b.FB + b.BB )
    result = "BB"
  elsif roll_2 < ( b.SO + b.GB + b.FB + b.BB + b._1B )
    result = "_1B"
  elsif roll_2 < ( b.SO + b.GB + b.FB + b.BB + b._1B + b._1Bplus )
    result = "_1Bplus"
  elsif roll_2 < ( b.SO + b.GB + b.FB + b.BB + b._1B + b._1Bplus + b._2B )
    result = "_2B"
  elsif roll_2 < ( b.SO + b.GB + b.FB + b.BB + b._1B + b._1Bplus + b._2B + b._3B )
    result = "_3B"
  elsif roll_2 < ( b.SO + b.GB + b.FB + b.BB + b._1B + b._1Bplus + b._2B + b._3B + b._HR )
    result = "_HR"
  end
end
puts "Your result is #{result}."
