CREATE TABLE TEACHER (TID CHAR(10) NOT NULL , 
                      FirstNAME char(20) ,
					  LastName CHAR(20),
					  SINYORITY REAL , 
					  Toar CHAR(20)
                      PRIMARY KEY (TID));
					  
CREATE TABLE PDerctor (TID CHAR(10) NOT NULL ,
                       Quantity REAL ,
					   PRIMARY KEY (TID),
					   FOREIGN KEY(TID)
                       REFERENCES TEACHER(TID));
					   
CREATE TABLE DDirector (TID CHAR(10) NOT NULL ,	
                        Quantity REAL ,
					    PRIMARY KEY (TID),
					    FOREIGN KEY(TID)
                        REFERENCES TEACHER(TID));
					   
CREATE TABLE PROJECT (TID CHAR(10) NOT NULL ,
                      ProjectNUM INTEGER NOT NULL,
				      StartP CHAR(11) ,
					  FinishP CHAR(11) , 
					  Name CHAR(10) ,
					  PRIMARY KEY (ProjectNUM),
					  FOREIGN KEY(TID)
                      REFERENCES PDerctor(TID));
					  						
CREATE TABLE MODER (TID CHAR(10) NOT NULL ,
                    ProjectNUM INTEGER NOT NULL ,
                    PRIMARY KEY (ProjectNUM,TID),
					FOREIGN KEY (ProjectNUM)
					REFERENCES PROJECT(ProjectNUM),
					FOREIGN KEY(TID)
                    REFERENCES TEACHER(TID));
					
CREATE TABLE DEPARTMENT (NumDepartment INTEGER NOT NULL ,
                         TID CHAR(10) NOT NULL ,
                         Name CHAR(10) ,
						 PhoneNUM CHAR(11),
						 PRIMARY KEY (NumDepartment),
						 FOREIGN KEY(TID)
                         REFERENCES DDerctor(TID));
						 
					   
CREATE TABLE WORKER	(TID CHAR(10) NOT NULL ,
                     NumDepartment INTEGER NOT NULL  ,
                     PRIMARY KEY (TID,NumDepartment),
					 FOREIGN KEY (TID)
					 REFERENCES TEACHER(TID),
					 FOREIGN KEY (NumDepartment)
					 REFERENCES DEPARTMENT(NumDepartment));
					 
CREATE TABLE STUDENT (SID CHAR(10) NOT NULL , 
                      ProjectNUM INTEGER NOT NULL,
					  NumDepartment INTEGER NOT NULL ,
                      FirstNAME char(20) ,
					  LastName CHAR(20),
					  Semester INTEGER ,
					  Avarege REAL ,
					  PRIMARY KEY (SID)
					  FOREIGN KEY(ProjectNUM)
                      REFERENCES PROJECT(ProjectNUM),
					  FOREIGN KEY(NumDepartment)
                      REFERENCES DEPARTMENT(NumDepartment));

						 

					




					 

		
					
                    						
				   
