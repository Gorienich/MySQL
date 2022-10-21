CREATE TABLE Worker (ID_W CHAR(10) NOT NULL , 
                     Fname CHAR(20) ,
                     Lname CHAR(20) , 
                     Seniority REAL , 
                     Salary REAL ,
                     DateOfBirth CHAR (9) ,
                     PRIMARY KEY (ID_W));
					 
				  
CREATE TABLE FDerector (ID_W CHAR(10) NOT NULL ,
                        PRIMARY KEY (ID_W),
	                    FOREIGN KEY(ID_W)
                        REFERENCES Worker(ID_W));

					
CREATE TABLE BBanker (ID_W CHAR(10) NOT NULL , 
                        PRIMARY KEY (ID_W),
	                    FOREIGN KEY(ID_W)
                        REFERENCES Worker(ID_W));	

CREATE TABLE InvCounseling (ID_W CHAR(10) NOT NULL , 
                        PRIMARY KEY (ID_W),
						FOREIGN KEY(ID_W)
                        REFERENCES Worker(ID_W));

CREATE TABLE PBanker (ID_W CHAR(10) NOT NULL , 
                        PRIMARY KEY (ID_W),
						FOREIGN KEY(ID_W)
                        REFERENCES Worker(ID_W));	

CREATE	TABLE Teller (ID_W CHAR(10) NOT NULL , 
                        PRIMARY KEY (ID_W),
						FOREIGN KEY(ID_W)
                        REFERENCES Worker(ID_W));

CREATE TABLE Bank(NumBank CHAR(10) NOT NULL , 
                    Name CHAR (20) ,
				    PRIMARY KEY (NumBank)) ;
					
CREATE TABLE Falial (FNum CHAR(10) NOT NULL ,
                     NumBank CHAR(10) NOT NULL ,
                     ID_W CHAR(10) NOT NULL ,					 
                     Address CHAR(30) , 
					 NameFilial CHAR(30) ,
					 PRIMARY KEY(FNum),
					 FOREIGN KEY(ID_W)
                     REFERENCES FDerector(ID_W),
					 FOREIGN key(NumBank)
					 REFERENCES Bank(NumBank));
					
CREATE TABLE Bill (Bill_N CHAR(10) NOT NULL ,
                   FNum CHAR(10) NOT NULL ,
                   DepositsAndSavings REAL ,
				   CurrentAccountBalance REAL ,
				   SecuritiesPortfolio REAL ,
                   Credits REAL , 
				   PRIMARY KEY (Bill_N) ,
				   FOREIGN KEY (FNum)
				   REFERENCES Falial(FNum));
				   
CREATE TABLE Bill_B (Bill_N CHAR(10) NOT NULL ,
                   FNum CHAR(10) NOT NULL ,
				   PRIMARY KEY (Bill_N) ,
				   FOREIGN KEY (FNum)
				   REFERENCES Falial(FNum));
					 
CREATE TABLE Bill_P (Bill_N CHAR(10) NOT NULL ,
                   FNum CHAR(10) NOT NULL ,
				   PRIMARY KEY (Bill_N) ,
				   FOREIGN KEY (FNum)
				   REFERENCES Falial(FNum));
					 
CREATE TABLE Client (ID_C CHAR(10) NOT NULL , 
                     Fname CHAR(20) ,
                     Lname CHAR(20) , 				 
                     DateOfBirth CHAR(9) ,
                     PRIMARY KEY (ID_C));
					 
CREATE TABLE AccountHolder (ID_C CHAR (10) NOT NULL ,
                            Bill_N CHAR(10) NOT NULL ,
                            PRIMARY KEY (ID_C),
							FOREIGN KEY (Bill_N)
				            REFERENCES Bill(Bill_N),
							FOREIGN KEY (ID_C)
							REFERENCES Client (ID_C));

CREATE TABLE Confident (ID_C CHAR (10) NOT NULL ,							
					    Bill_N CHAR(10) NOT NULL ,
                        PRIMARY KEY (ID_C,Bill_N),
					    FOREIGN KEY (Bill_N)
				        REFERENCES Bill(Bill_N),
					    FOREIGN KEY (ID_C)
					    REFERENCES Client (ID_C));

CREATE TABLE TellerService (ID_W CHAR (10) NOT NULL , 
                            ID_C CHAR (10) NOT NULL , 
							PRIMARY KEY (ID_C,ID_W), 
							FOREIGN KEY (ID_C)
					        REFERENCES  Client (ID_C),
						    FOREIGN KEY (ID_W)
					        REFERENCES Teller (ID_W));
							
CREATE TABLE BankerService (ID_W CHAR (10) NOT NULL , 
                            ID_C CHAR (10) NOT NULL , 
							PRIMARY KEY (ID_C,ID_W), 
							FOREIGN KEY (ID_C)
					        REFERENCES  Client (ID_C),
						    FOREIGN KEY (ID_W)
					        REFERENCES PBanker (ID_W));
							
CREATE TABLE InvCounselingService (ID_W CHAR (10) NOT NULL , 
                                  Bill_N CHAR (10) NOT NULL , 
							      PRIMARY KEY (Bill_N,ID_W), 
							      FOREIGN KEY (Bill_N)
					              REFERENCES  Bill_P (Bill_N),
						          FOREIGN KEY (ID_W)
					              REFERENCES InvCounseling (ID_W));

CREATE TABLE BBankerService (ID_W CHAR (10) NOT NULL , 
                                  Bill_N CHAR (10) NOT NULL , 
							      PRIMARY KEY (Bill_N,ID_W), 
							      FOREIGN KEY (Bill_N)
					              REFERENCES  Bill_B (Bill_N),
						          FOREIGN KEY (ID_W)
					              REFERENCES BBanker (ID_W));























				   