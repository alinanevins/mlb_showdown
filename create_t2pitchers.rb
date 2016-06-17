require'csv'

str='nameFirst,nameLast,nameFull,yearID,setID,cardNo,team,control,PU,SO,GB,FB,BB,1B,2B,HR,points,IP,hand,Pos
Tim, Crabtree, Tim Crabtree, 2000, BS, 433, Rangers, 5, 2, 4, 6, 3, 1, 4, 0, 0, 150, 1, R, Reliever
Rick, Helling, Rick Helling, 2000, BS, 437, Rangers, 3, 2, 3, 5, 6, 1, 1, 1, 1, 190, 6, R, Starter
Mike, Morgan, Mike Morgan, 2000, BS, 439, Rangers, 0, 3, 2, 9, 4, 0, 1, 1, 0, 40, 5, R, Starter
Aaron, Sele, Aaron Sele, 2000, BS, 442, Rangers, 4, 2, 5, 5, 3, 1, 3, 1, 0, 330, 6, R, Starter
Mike, Venafro, Mike Venafro, 2000, BS, 444, Rangers, 4, 2, 3, 9, 2, 1, 3, 0, 0, 150, 1, L, Reliever
John, Wetteland, John Wetteland, 2000, BS, 445, Rangers, 6, 2, 5, 2, 6, 1, 3, 1, 0, 180, 1, R, Closer
Jeff, Zimmerman, Jeff Zimmerman, 2000, BS, 447, Rangers, 4, 2, 5, 5, 6, 1, 1, 0, 0, 180, 1, R, Reliever'


errors = []
csv = CSV.parse(str, headers: true)
csv.each do |row|
p = T2Pitchers.new(nameFirst:row['nameFirst'], nameLast:row['nameLast'], nameFull:row['nameFull'], yearID:row['yearID'].to_i, setID:row['setID'], cardNo:row['cardNo'].to_i, team:row['team'], control:row['control'].to_i, PU:row['PU'].to_i, SO:row['SO'].to_i, GB:row['GB'].to_i, FB:row['FB'].to_i, BB:row['BB'].to_i, _1B:row['_1B'].to_i, _2B:row['_2B'].to_i, _HR:row['_HR'].to_i, points:row['points'].to_i, IP:row['IP'].to_i, hand:row['hand'], Pos:row['Pos'])
p.save
rescue => e
errors << [row,e]
end
end
