CREATE TABLE Bank  (NumBank INTEGER NOT NULL , 
                    Name CHAR (20) ,
				    PRIMARY KEY (NumBank)) ;
	 
CREATE TABLE WorkerBank (ID_Worker CHAR(10) NOT NULL , 
                         FName_W CHAR(20) ,
                         LName_W CHAR(20) , 
                         DateOfBirth CHAR(10),
						 SeniorityInTheBank REAL , 
						 Salary REAL ,
                         PRIMARY KEY (ID_Worker));						 
						 
CREATE TABLE Manager (ID_Maneger CHAR(10) NOT NULL ,  
                      FName_W CHAR(20) ,
                      LName_W CHAR(20) ,
                      DateOfBirth CHAR(10),
				      SeniorityInTheBank REAL , 
					  Salary REAL ,
					  PRIMARY KEY (ID_Maneger),
                      FOREIGN KEY (ID_Maneger) 
                      REFERENCES WorkerBank (ID_Worker));

CREATE TABLE Falial (FNum INTEGER NOT NULL ,
                     NumBank INTEGER NOT NULL ,
                     ID_Maneger CHAR(10) NOT NULL ,					 
                     Address CHAR(30) , 
					 NameFalial CHAR(30) ,
					 PRIMARY KEY(FNum,NumBank),
					 FOREIGN key(NumBank)
					 REFERENCES Bank(NumBank),						  
					 FOREIGN key(ID_Maneger)
					 REFERENCES Manager(ID_Maneger)); 
					 
CREATE TABLE Account (NumAccount INTEGER NOT NULL , 
                      NumBank INTEGER NOT NULL , 
					  FNum INTEGER NOT NULL , 
					  AccountType CHAR(10) ,
					  CurrentAccountBalance REAL ,
					  BalanceDepositsAndSavings REAL , 
					  ValueOfASecuritiesPortfolio REAL , 
					  BalanceOfLoans REAL ,
					  PRIMARY KEY (NumAccount,FNum,NumBank),
					  FOREIGN KEY (NumBank)
					  REFERENCES Bank(NumBank),
					  FOREIGN KEY (FNum)
					  REFERENCES Falial(FNum));	

CREATE TABLE Clients (CID CHAR(10) NOT NULL , 
                      FName_W CHAR(20) ,
                      LName_W CHAR(20) , 
                      DateOfBirth CHAR(10),
                      PRIMARY KEY (CID));

CREATE TABLE AccountHolders	(NumAccount INTEGER NOT NULL , 
                             NumBank INTEGER NOT NULL , 
					         FNum INTEGER NOT NULL ,
                             Ac_CID CHAR(10) NOT NULL ,
                             PRIMARY KEY (NumAccount,NumBank,FNum),
                             FOREIGN KEY (NumBank)
					         REFERENCES Bank(NumBank),
					         FOREIGN KEY (FNum)
					         REFERENCES Falial(FNum),
                             FOREIGN KEY (NumAccount)
                             REFERENCES Account (NumAccount),
							 FOREIGN KEY (Ac_CID)
							 REFERENCES Clients (CID));  // מניח ש חשבון יכול לנהל יותר מבעל חשבון אחד // 
 							 