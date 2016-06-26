Creating Database:

1. in command line:
      `rails new #your_file_name --database=postgresql`
2. in command line:
      cd #your_file_name
3. in command line:
      `rails generate model t1batters nameFirst:string nameLast:string nameFull:string yearID:integer setID:string cardNo:integer team:string onbase:integer SO:integer GB:integer FB:integer BB:integer _1B:integer _1Bplus:integer _2B:integer _3B:integer _HR:integer points:integer speed:integer hand:string startingPos1:string fielding1:integer startingPos2:string fielding2:integer startingPos3:string fielding3:integer startingPos4:string fielding4:integer _TO:integer xbh:integer numPos:integer`

      `rails generate model t2batters nameFirst:string nameLast:string nameFull:string yearID:integer setID:string cardNo:integer team:string onbase:integer SO:integer GB:integer FB:integer BB:integer _1B:integer _1Bplus:integer _2B:integer _3B:integer _HR:integer points:integer speed:integer hand:string startingPos1:string fielding1:integer startingPos2:string fielding2:integer startingPos3:string fielding3:integer startingPos4:string fielding4:integer _TO:integer xbh:integer numPos:integer`

      `rails generate model t1pitchers nameFirst:string nameLast:string nameFull:string yearID:integer setID:string cardNo:integer team:string control:integer PU:integer SO:integer GB:integer FB:integer BB:integer _1B:integer _2B:integer _HR:integer points:integer IP:integer hand:string Pos: string`

      `rails generate model t2pitchers nameFirst:string nameLast:string nameFull:string yearID:integer setID:string cardNo:integer team:string control:integer PU:integer SO:integer GB:integer FB:integer BB:integer _1B:integer _2B:integer _HR:integer points:integer IP:integer hand:string Pos: string`

4. in command line:
      `createdb #your_file_name_development`
5. in command line:
      `rake db:migrate`
6. in command line:
      `rails console`
7. in rails console

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
      p = T1batter.new(nameFirst:row['nameFirst'], nameLast:row['nameLast'], nameFull:row['nameFull'], yearID:row['yearID'].to_i, setID:row['setID'], cardNo:row['cardNo'].to_i, team:row['team'], onbase:row['onbase'].to_i, SO:row['SO'].to_i, GB:row['GB'].to_i, FB:row['FB'].to_i, BB:row['BB'].to_i, _1B:row['1B'].to_i, _1Bplus:row['1Bplus'].to_i, _2B:row['2B'].to_i, _3B:row['3B'].to_i, _HR:row['HR'].to_i, points:row['points'].to_i, speed:row['speed'].to_i, hand:row['hand'], startingPos1:row['startingPos1'], fielding1:row['fielding1'].to_i, startingPos2:row['startingPos2'], fielding2:row['fielding2'].to_i, startingPos3:row['startingPos3'], fielding3:row['fielding3'].to_i, startingPos4:row['startingPos4'], fielding4:row['fielding4'].to_i, _TO:row['TO'].to_i, xbh:row['xbh'].to_i, numPos:row['numPos'].to_i)
      begin
      p.save
      rescue => e
      errors << [row,e]
      end
      end

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
      p = T2batter.new(nameFirst:row['nameFirst'], nameLast:row['nameLast'], nameFull:row['nameFull'], yearID:row['yearID'].to_i, setID:row['setID'], cardNo:row['cardNo'].to_i, team:row['team'], onbase:row['onbase'].to_i, SO:row['SO'].to_i, GB:row['GB'].to_i, FB:row['FB'].to_i, BB:row['BB'].to_i, _1B:row['1B'].to_i, _1Bplus:row['1Bplus'].to_i, _2B:row['2B'].to_i, _3B:row['3B'].to_i, _HR:row['HR'].to_i, points:row['points'].to_i, speed:row['speed'].to_i, hand:row['hand'], startingPos1:row['startingPos1'], fielding1:row['fielding1'].to_i, startingPos2:row['startingPos2'], fielding2:row['fielding2'].to_i, startingPos3:row['startingPos3'], fielding3:row['fielding3'].to_i, startingPos4:row['startingPos4'], fielding4:row['fielding4'].to_i, _TO:row['TO'].to_i, xbh:row['xbh'].to_i, numPos:row['numPos'].to_i)
      begin
      p.save
      rescue => e
      errors << [row,e]
      end
      end


      str='nameFirst,nameLast,nameFull,yearID,setID,cardNo,team,control,PU,SO,GB,FB,BB,1B,2B,HR,points,IP,hand,Pos
      Freddy,Garcia,Freddy Garcia,2000,BS,390,Mariners,3,2,5,5,4,1,2,1,0,330,6,R,Starter
      John,Halama,John Halama,2000,BS,392,Mariners,5,2,3,6,4,1,3,1,0,490,7,L,Starter
      Jose,Mesa,Jose Mesa,2000,BS,397,Mariners,4,2,3,5,4,2,4,0,0,120,1,R,Closer
      Jamie,Moyer,Jamie Moyer,2000,BS,398,Mariners,3,3,3,6,5,0,2,1,0,470,7,L,Starter
      Jose,Paniagua,Jose Paniagua,2000,BS,399,Mariners,3,1,5,6,3,3,2,0,0,100,1,R,Reliever
      Manny,Aybar,Manny Aybar,2000,BS,402,Cardinals,3,2,5,4,5,1,2,1,0,100,1,R,Reliever
      Ricky,Bottalico,Ricky Bottalico,2000,BS,403,Cardinals,2,3,5,4,3,2,2,1,0,70,1,R,Closer'

      errors = []
      csv = CSV.parse(str, headers: true)
      csv.each do |row|
      p = T1pitcher.new(nameFirst:row['nameFirst'], nameLast:row['nameLast'], nameFull:row['nameFull'], yearID:row['yearID'].to_i, setID:row['setID'], cardNo:row['cardNo'].to_i, team:row['team'], control:row['control'].to_i, PU:row['PU'].to_i, SO:row['SO'].to_i, GB:row['GB'].to_i, FB:row['FB'].to_i, BB:row['BB'].to_i, _1B:row['1B'].to_i, _2B:row['2B'].to_i, _HR:row['HR'].to_i, points:row['points'].to_i, IP:row['IP'].to_i, hand:row['hand'], Pos:row['Pos'])
      begin
      p.save
      rescue => e
      errors << [row,e]
      end
      end

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
      p = T2pitcher.new(nameFirst:row['nameFirst'], nameLast:row['nameLast'], nameFull:row['nameFull'], yearID:row['yearID'].to_i, setID:row['setID'], cardNo:row['cardNo'].to_i, team:row['team'], control:row['control'].to_i, PU:row['PU'].to_i, SO:row['SO'].to_i, GB:row['GB'].to_i, FB:row['FB'].to_i, BB:row['BB'].to_i, _1B:row['1B'].to_i, _2B:row['2B'].to_i, _HR:row['HR'].to_i, points:row['points'].to_i, IP:row['IP'].to_i, hand:row['hand'], Pos:row['Pos'])
      begin
      p.save
      rescue => e
      errors << [row,e]
      end
      end

      exit

8. in rails console
    psql (-d site_development)

9. in psql
    \connect #your_file_name_development
    \d   ###Check to see if it's all there!

-----------

After adding image column to BaseStates, add the images by going into rails c and entering the following:
a = BaseState.find(1)
a.image = 'bs1.jpg'
a.save
# repeat for the other 7
