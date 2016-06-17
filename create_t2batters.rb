require 'csv'

str = 'nameFirst,nameLast,nameFull,yearID,setID,cardNo,team,onbase,SO,GB,FB,BB,1B,1Bplus,2B,3B,HR,points,speed,hand,startingPos1,fielding1,startingPos2,fielding2,startingPos3,fielding3,startingPos4,fielding4,TO,xbh,numPos
Royce, Clayton, Royce Clayton, 2000, BS, 432, Rangers, 8, 3, 2, 0, 3, 7, 1, 1, 1, 2, 280, 15, R, SS, 4, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, 1
Juan, Gonzalez, Juan Gonzalez, 2000, BS, 434, Rangers, 9, 2, 0, 3, 2, 7, 0, 2, 0, 4, 460, 15, R, LFRF, 0, NULL, NULL, NULL, NULL, NULL, NULL, 5, 6, 1
Tom, Goodwin, Tom Goodwin, 2000, BS, 435, Rangers, 7, 0, 3, 1, 4, 6, 4, 0, 2, 0, 170, 20, L, CF, 2, LFRF, 1, NULL, NULL, NULL, NULL, 4, 6, 2
Rusty, Greer, Rusty Greer, 2000, BS, 436, Rangers, 10, 0, 3, 2, 6, 5, 0, 2, 0, 2, 360, 10, L, LFRF, 1, NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, 1
Mark, Mclemore, Mark Mclemore, 2000, BS, 438, Rangers, 8, 0, 2, 1, 6, 8, 1, 0, 1, 1, 240, 15, S, 2B, 3, NULL, NULL, NULL, NULL, NULL, NULL, 3, 3, 1
Rafael, Palmeiro, Rafael Palmeiro, 2000, BS, 440, Rangers, 10, 0, 0, 4, 5, 5, 0, 2, 0, 4, 520, 10, L, DH, 0, NULL, NULL, NULL, NULL, NULL, NULL, 4, 6, 1
Ivan, Rodriguez, Ivan Rodriguez, 2000, BS, 441, Rangers, 8, 0, 3, 1, 0, 8, 2, 2, 0, 4, 450, 20, R, C, 11, NULL, NULL, NULL, NULL, NULL, NULL, 4, 8, 1
Lee, Stevens, Lee Stevens, 2000, BS, 443, Rangers, 7, 2, 1, 0, 3, 7, 0, 3, 0, 4, 270, 15, L, 1B, 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, 7, 1
Todd, Zeile, Todd Zeile, 2000, BS, 446, Rangers, 8, 0, 2, 2, 3, 7, 0, 3, 0, 3, 280, 10, R, 3B, 1, NULL, NULL, NULL, NULL, NULL, NULL, 4, 6, 1
Tony, Batista, Tony Batista, 2000, BS, 448, Blue Jays, 7, 0, 0, 4, 2, 6, 0, 3, 0, 5, 310, 15, R, SS, 3, NULL, NULL, NULL, NULL, NULL, NULL, 4, 8, 1
Homer, Bush, Homer Bush, 2000, BS, 449, Blue Jays, 8, 1, 4, 0, 0, 8, 3, 2, 1, 1, 290, 20, R, 2B, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 7, 1
Jose, Cruz Jr., Jose Cruz Jr., 2000, BS, 450, Blue Jays, 8, 3, 1, 1, 7, 2, 1, 2, 1, 2, 320, 20, S, OF, 1, NULL, NULL, NULL, NULL, NULL, NULL, 5, 6, 1
Carlos, Delgado, Carlos Delgado, 2000, BS, 451, Blue Jays, 9, 2, 0, 3, 6, 3, 0, 2, 0, 4, 410, 10, L, 1B, 0, NULL, NULL, NULL, NULL, NULL, NULL, 5, 6, 1'
errors = []
csv = CSV.parse(str, headers: true)
csv.each do |row|
p = T2Batters.new(nameFirst:row['nameFirst'], nameLast:row['nameLast'], nameFull:row['nameFull'], yearID:row['yearID'].to_i, setID:row['setID'], cardNo:row['cardNo'].to_i, team:row['team'], onbase:row['onbase'], SO:row['SO'].to_i, GB:row['GB'].to_i, FB:row['FB'].to_i, BB:row['BB'].to_i, _1B:row['_1B'].to_i, _1Bplus:row['_1Bplus'].to_i, _2B:row['_2B'].to_i, _3B:row['_3B'].to_i, _HR:row['_HR'].to_i, points:row['points'].to_i, speed:row['speed'].to_i, hand:row['hand'], startingPos1:row['startingPos1'], fielding1:row['fielding1'].to_i, startingPos2:row['startingPos2'], fielding2:row['fielding2'].to_i, startingPos3:row['startingPos3'], fielding3:row['fielding3'].to_i, startingPos4:row['startingPos4'], fielding4:row['fielding4'].to_i, TO:row['TO'].to_i, xbh:row['xbh'].to_i, numPos:row['numPos'].to_i)
begin
p.save
rescue => e
errors << [row,e]
end
end
