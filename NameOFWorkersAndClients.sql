INSERT INTO BANK(NumBank,NAME)
VALUE                 (10,'DISKONT'),
                      (11,'BenLeumi'),
                      (12,'HaPoalim');
                    
INSERT INTO Clients (CID , FName_W,LName_W,DateOfBirth)
 VALUE                    ('1','Igor','Gribnuk','2001/02/12'),
                          ('2','Andrey','Velihuro','1940/02/12') ,
						  ('3','Igor','Bogomolov','1985/04/15'),
						  ('4','Hofit','Doron','1996/15/04'),
						  ('5','Ben','Isakov','1993/04/15'),
						  ('6','lila','hankin','1985/03/28'),
						  ('7','stas','shoval','1991/01/20'),
						  ('8','ron','Isakov','2001/02/12'),
						   ('9','anna','buson','1990/03/28'),
						  ('10','vlad','kolov','1940/01/20'),
						  ('11','yaron','Isakov','2007/02/12');


INSERT INTO  WorkerBank (ID_Worker ,FName_W,LName_W,DateOfBirth,SeniorityInTheBank,Salary)
VALUE                         ('1A','Anna','Kramer','10-12-1992',7,20000),
							  ('2A','Maxsim','Franklin','25-05-1984',6,12000),
							  ('3A','Victor','Kaken','20-09-1996',2,7500),
                        	  ('1B','Ben','Amsalem','07-01-1990',1.5,13000),
                              ('2B','Rami','Kaken','20-09-1996',2,7500),
                        	  ('3B','Yosef','Amsalem','07-01-1990',1.5,12000),
                              ('1C','Shoshi','Boiko','20-09-1996',2,7500),
                        	  ('2C','Yosef','Amsalem','07-01-1990',1.5,10000),	  							  
							  ('3C','Sonia','Blade','19-03-1985',15,29000);

INSERT INTO  Manager (ID_Maneger,FName_W,LName_W,DateOfBirth,SeniorityInTheBank,Salary )
VALUE						('1A','Anna','Kramer','10-12-1992',7,20000),
	                        ('1B','Ben','Amsalem','07-01-1990',1.5,13000),
							('1C','Shoshi','Boiko','20-09-1996',2,7500),
							('2A','Maxsim','Franklin','25-05-1984',6,12000),
							('2B','Rami','Kaken','20-09-1996',2,7500),
							('2C','Yosef','Amsalem','07-01-1990',1.5,10000);
							
INSERT INTO Falial (FNum , NumBank, ID_Maneger , Address , NameFalial )	
VALUE                     (1, 10, '1A','Hankin-Josha 15','Afula') ,
                          (1, 11, '1B','Shaked 34', 'Migdal-Haemeq'),
                          (1, 12, '1C','Kadesh 3', 'Haifa'),
                          (2, 10, '2A','Hadar 43','Haifa'),
						  (2, 11, '2B','Neve-ganim 34','Hadera'),
						  (2, 12, '2C','Neve-ganim 34','Hadera');
                         
							  
INSERT INTO Account (NumAccount,NumBank,FNum,AccountType,CurrentAccountBalance,BalanceDepositsAndSavings,ValueOfASecuritiesPortfolio,BalanceOfLoans)
VALUE            	 (111,  10,  1, 'Ragil',     10000,  566641, 5515, 8480),
				     (111,  11,  2, 'heski',     108585,  566641, 520055, 85450),
					 (111,  12,  1, 'premium',   1789789, 566641, 5225, 8520),
					 (112,  10,  2, 'Ragil',     10564, 123585, 52525, 846424),
					 (112,  11,  1, 'premium',   15652, 35525, 585525, 856345),
					 (112,  12,  2, 'Ragil',     165564, 15633, 5525, 84532),
					 (113,  10,  1, 'heski',     195125, 75368, 5515, 84532),
					 (114,  11,  2, 'premium',   15652, 35525, 585525, 856345),
					 (114,  12,  1, 'Ragil',     165564, 15633, 5525, 84532),
					 (115,  10,  2, 'heski',     195125, 75368, 5515, 84532),
					 (116,  11,  1, 'Ragil',     135, 19100, 5515, 1901);
					 
INSERT INTO AccountHolders ( NumAccount, NumBank, FNum,  Ac_CID)
VALUE                      ( 111,          10,        1,      '1'),
                           ( 111,          11,        2,      '2'),
						   ( 111,          12,        1,      '3'),
                           ( 112,          10,        2,      '4'),
						   ( 112,          11,        1,      '5'),
                           ( 112,          12,        2,      '6'),
						   ( 113,          10,        1,      '7'),
                           ( 114,          11,        2,      '8'),
						   ( 114,          12,        1,      '9'),
                           ( 115,          10,        2,      '10'),
						   ( 116,          11,        1,      '11');
						   
						   /*
						   INSERT INTO Account (NumAccount,NumBank,FNum,AccountType,CurrentAccountBalance,BalanceDepositsAndSavings,ValueOfASecuritiesPortfolio,BalanceOfLoans)
VALUE            	 (1101,  11,  1, 'Ragil',     -10000,  566641, 15869, 8480),
				     (1101,  12,  2, 'heski',     108585,  -566641, 520055, 1285450);
					                   
INSERT INTO Clients (CID , FName_W,LName_W,DateOfBirth)
 VALUE                    ('12','lue','kan','1973/01/01');
 
 					 
INSERT INTO AccountHolders ( NumAccount, NumBank, FNum,  Ac_CID)
VALUE                      ( 1101,          11,        1,      '12'),
                           ( 1101,          12,        2,      '12');
					 */