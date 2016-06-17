require 'csv'

str = 'nameFirst, nameLast, nameFull, yearID, setID, cardNo, team, control, PU, SO, GB, FB, BB, 1B, 2B, HR, points, IP, hand, Pos
Freddy, Garcia, Freddy Garcia, 2000, BS, 390, Mariners, 3, 2, 5, 5, 4, 1, 2, 1, 0, 330, 6, R, Starter
John, Halama, John Halama, 2000, BS, 392, Mariners, 5, 2, 3, 6, 4, 1, 3, 1, 0, 490, 7, L, Starter
Jose, Mesa, Jose Mesa, 2000, BS, 397, Mariners, 4, 2, 3, 5, 4, 2, 4, 0, 0, 120, 1, R, Closer
Jamie, Moyer, Jamie Moyer, 2000, BS, 398, Mariners, 3, 3, 3, 6, 5, 0, 2, 1, 0, 470, 7, L, Starter
Jose, Paniagua, Jose Paniagua, 2000, BS, 399, Mariners, 3, 1, 5, 6, 3, 3, 2, 0, 0, 100, 1, R, Reliever
Manny, Aybar, Manny Aybar, 2000, BS, 402, Cardinals, 3, 2, 5, 4, 5, 1, 2, 1, 0, 100, 1, R, Reliever
Ricky, Bottalico, Ricky Bottalico, 2000, BS, 403, Cardinals, 2, 3, 5, 4, 3, 2, 2, 1, 0, 70, 1, R, Closer'



errors = []
csv = CSV.parse(str, headers: true)
csv.each do |row|
p = T1Pitchers.new(nameFirst:row['nameFirst'], nameLast:row['nameLast'], nameFull:row['nameFull'], yearID:row['yearID'].to_i, setID:row['setID'], cardNo:row['cardNo'].to_i, team:row['team'], control:row['control'].to_i, PU:row['PU'].to_i, SO:row['SO'].to_i, GB:row['GB'].to_i, FB:row['FB'].to_i, BB:row['BB'].to_i, _1B:row['_1B'].to_i, _2B:row['_2B'].to_i, _HR:row['_HR'].to_i, points:row['points'].to_i, IP:row['IP'].to_i, hand:row['hand'], Pos:row['Pos'])
p.save
rescue => e
errors << [row,e]
end
end
