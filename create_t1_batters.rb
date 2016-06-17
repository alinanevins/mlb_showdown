require 'csv'

str = 'nameFirst,nameLast,nameFull,yearID,setID,cardNo,team,onbase,SO,GB,FB,BB,1B,1Bplus,2B,3B,HR,points,speed,hand,startingPos1,fielding1,startingPos2,fielding2,startingPos3,fielding3,startingPos4,fielding4,TO,xbh,numPos
David,Bell,David Bell,2000,BS,387,Mariners,7,0,2,2,4,6,1,2,0,3,220,15,R,2B,3,NULL,NULL,NULL,NULL,NULL,NULL,4,6,1
Jay,Buhner,Jay Buhner,2000,BS,388,Mariners,9,4,0,0,11,2,0,1,0,2,260,10,R,LFRF,0,NULL,NULL,NULL,NULL,NULL,NULL,4,3,1
Russ,Davis,Russ Davis,2000,BS,389,Mariners,6,1,0,2,3,7,0,1,0,6,220,15,R,3B,0,NULL,NULL,NULL,NULL,NULL,NULL,3,7,1
Ken,Griffey Jr.,Ken Griffey Jr.,2000,BS,391,Mariners,9,0,1,4,5,3,1,1,0,5,590,20,L,CF,2,LFRF,1,NULL,NULL,NULL,NULL,5,7,2
Brian,L. Hunter,Brian L. Hunter,2000,BS,393,Mariners,5,0,2,0,1,7,7,0,2,1,90,20,R,LFRF,2,NULL,NULL,NULL,NULL,NULL,NULL,2,10,1
Raul,Ibanez,Raul Ibanez,2000,BS,394,Mariners,6,0,1,1,2,9,2,1,0,4,190,15,L,LFRF,2,1B,0,NULL,NULL,NULL,NULL,2,7,2
Tom,Lampkin,Tom Lampkin,2000,BS,395,Mariners,8,0,2,3,2,7,0,2,1,3,340,15,L,C,9,NULL,NULL,NULL,NULL,NULL,NULL,5,6,1
Edgar,Martinez,Edgar Martinez,2000,BS,396,Mariners,10,1,1,0,7,7,0,2,0,2,430,15,R,DH,0,NULL,NULL,NULL,NULL,NULL,NULL,2,4,1
Alex,Rodriguez,Alex Rodriguez,2000,BS,400,Mariners,8,1,1,2,5,3,1,1,0,6,510,20,R,SS,5,NULL,NULL,NULL,NULL,NULL,NULL,4,8,1
Dan,Wilson,Dan Wilson,2000,BS,401,Mariners,7,2,1,2,1,9,1,2,1,1,170,15,R,C,4,NULL,NULL,NULL,NULL,NULL,NULL,5,5,1
Darren,Bragg,Darren Bragg,2000,BS,405,Cardinals,9,3,2,0,7,6,0,1,0,1,260,15,L,OF,2,NULL,NULL,NULL,NULL,NULL,NULL,5,2,1
Alberto,Castillo,Alberto Castillo,2000,BS,406,Cardinals,7,1,3,0,4,11,0,0,0,1,130,10,R,C,10,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1
Fred,Mcgriff,Fred Mcgriff,2000,BS,425,Devil Rays,10,2,2,1,5,6,0,1,0,3,430,10,L,1B,0,NULL,NULL,NULL,NULL,NULL,NULL,5,4,1'

errors = []
csv = CSV.parse(str, headers: true)
csv.each do |row|
p = T1Batters.new(nameFirst:row['nameFirst'], nameLast:row['nameLast'], nameFull:row['nameFull'], yearID:row['yearID'].to_i, setID:row['setID'], cardNo:row['cardNo'].to_i, team:row['team'], onbase:row['onbase'], SO:row['SO'].to_i, GB:row['GB'].to_i, FB:row['FB'].to_i, BB:row['BB'].to_i, _1B:row['_1B'].to_i, _1Bplus:row['_1Bplus'].to_i, _2B:row['_2B'].to_i, _3B:row['_3B'].to_i, _HR:row['_HR'].to_i, points:row['points'].to_i, speed:row['speed'].to_i, hand:row['hand'], startingPos1:row['startingPos1'], fielding1:row['fielding1'].to_i, startingPos2:row['startingPos2'], fielding2:row['fielding2'].to_i, startingPos3:row['startingPos3'], fielding3:row['fielding3'].to_i, startingPos4:row['startingPos4'], fielding4:row['fielding4'].to_i, TO:row['TO'].to_i, xbh:row['xbh'].to_i, numPos:row['numPos'].to_i)
begin
p.save
rescue => e
errors << [row,e]
end
end
