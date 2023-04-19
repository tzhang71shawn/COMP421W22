-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

-- This is only an example of how you add create table ddls to this file.
--   You may remove it.

CREATE TABLE Institute( 
instituteID INTEGER NOT NULL,
name VARCHAR(30),
addr VARCHAR(50),
phone BIGINT,
email VARCHAR(50),
Web VARCHAR(50),
PRIMARY KEY(instituteID) ) ;

CREATE TABLE Midwife( 
pracID INTEGER NOT NULL, 
name VARCHAR(30) , 
email VARCHAR(50), 
phone BIGINT,
instituteID INTEGER NOT NULL,
PRIMARY KEY(pracID), 
FOREIGN KEY(instituteID) REFERENCES Institute ) ;

CREATE TABLE Birthingcenter( 
instituteID INTEGER NOT NULL,
PRIMARY KEY(instituteID), 
FOREIGN KEY(instituteID) REFERENCES Institute ) ;

CREATE TABLE CommunityClinic( 
instituteID INTEGER NOT NULL,
PRIMARY KEY(instituteID), 
FOREIGN KEY(instituteID) REFERENCES Institute ) ;

CREATE TABLE Mother( 
HCardID INTEGER NOT NULL,
email VARCHAR(50) NOT NULL,
dob DATE NOT NULL,
name VARCHAR(30) NOT NULL,
phone BIGINT NOT NULL,
profession VARCHAR(30),
bloodtype VARCHAR(2) ,
addr VARCHAR(50) ,
PRIMARY KEY(HCardID) ) ;

CREATE TABLE Father( 
fatherID INTEGER NOT NULL,
name VARCHAR(30) NOT NULL,
HCardID INTEGER,
email VARCHAR(50),
dob DATE,
phone BIGINT,
profession VARCHAR(30), 
bloodtype VARCHAR(2),
addr VARCHAR(50),
PRIMARY KEY(fatherID) );

CREATE TABLE Couple( 
coupleID INTEGER NOT NULL,
HCardID INTEGER NOT NULL,
fatherID INTEGER,
PRIMARY KEY(coupleID), 
FOREIGN KEY(HCardID) REFERENCES Mother,
FOREIGN KEY(fatherID) REFERENCES Father ) ;

CREATE TABLE Technician( 
techID INTEGER NOT NULL,
name VARCHAR(30) NOT NULL,
phone BIGINT NOT NULL,
PRIMARY KEY(techID) ) ;

CREATE TABLE Pregnancy( 
coupleID INTEGER NOT NULL, 
num INTEGER NOT NULL, 
expdueym DATE,
 lmpdued VARCHAR(3) NOT NULL, 
usounddued VARCHAR(3) NOT NULL, 
estdued VARCHAR(3) NOT NULL, 
interested VARCHAR(3), 
homebirth VARCHAR(30), 
ppracID INTEGER, 
bpracID INTEGER, 
instituteID INTEGER,
PRIMARY KEY(coupleID, num), 
FOREIGN KEY(coupleID) REFERENCES Couple,
FOREIGN KEY(instituteID) REFERENCES Institute,
FOREIGN KEY(ppracID) REFERENCES Midwife,
FOREIGN KEY(bpracID) REFERENCES Midwife) ;

CREATE TABLE Baby(
babyID INTEGER NOT NULL, 
gender VARCHAR(10) NOT NULL, 
dob DATE NOT NULL, 
btime TIME NOT NULL, 
bloodtype VARCHAR(2) , 
bname VARCHAR(30) NOT NULL, 
pregnum INTEGER NOT NULL, 
coupleID INTEGER NOT NULL,
PRIMARY KEY(babyID), 
FOREIGN KEY(coupleID,pregnum) REFERENCES Pregnancy ) ;

CREATE TABLE Tests(
testID INTEGER NOT NULL, 
ttype VARCHAR(30) NOT NULL, 
prescdate DATE NOT NULL, 
sampdate DATE NOT NULL, 
labdate DATE NOT NULL, 
results VARCHAR(100) NOT NULL, 
pracID INTEGER  NOT NULL, 
pregnum INTEGER, 
coupleID INTEGER, 
babyID INTEGER , 
techID INTEGER NOT NULL,
PRIMARY KEY(testID), 
FOREIGN KEY(pracID) REFERENCES Midwife,
FOREIGN KEY(coupleID,pregnum) REFERENCES Pregnancy,
FOREIGN KEY(babyID) REFERENCES Baby,
FOREIGN KEY(techID) REFERENCES Technician
) ;

CREATE TABLE InfoSession(
infoID INTEGER NOT NULL, 
sdate DATE NOT NULL, 
stime TIME NOT NULL, 
lang VARCHAR(10) NOT NULL, 
practID INTEGER NOT NULL,
PRIMARY KEY(infoID), 
FOREIGN KEY(practID) REFERENCES Midwife) ;


CREATE TABLE Appointment(
appointmentID INTEGER NOT NULL, 
adate DATE NOT NULL, 
atime TIME NOT NULL, 
pregnum INTEGER NOT NULL, 
coupleID INTEGER NOT NULL, 
practID INTEGER NOT NULL, 
instituteID INTEGER,
PRIMARY KEY(appointmentID), 
FOREIGN KEY(coupleID,pregnum) REFERENCES Pregnancy,
FOREIGN KEY(practID) REFERENCES Midwife,
FOREIGN KEY(instituteID) REFERENCES Institute
) ;

CREATE TABLE InfoSessionRegistration(
infoID INTEGER NOT NULL, 
coupleID INTEGER NOT NULL, 
attended VARCHAR(5) ,
PRIMARY KEY(infoID), 
FOREIGN KEY(infoID) REFERENCES InfoSession);


CREATE TABLE Notes(
noteID INTEGER NOT NULL,
Appointmentid INTEGER NOT NULL,
Content VARCHAR(100),
ndate DATE NOT NULL,
ntime TIME NOT NULL,
PRIMARY KEY(noteID), 
FOREIGN KEY(Appointmentid) REFERENCES Appointment) ;




