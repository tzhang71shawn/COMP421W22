-- Include your INSERT SQL statements in this file.
--    ONLY AFTER the parent tables!
CONNECT TO cs421;

INSERT INTO Institute (instituteID,name,addr,phone,email,web) VALUES ('110001','Rosement','11 Rosement','1111111111','NULL','NULL');
INSERT INTO Institute (instituteID,name,addr,phone,email,web) VALUES ('110002','Hochelaga','122 Hochelaga','1111111112','NULL','NULL');
INSERT INTO Institute (instituteID,name,addr,phone,email,web) VALUES ('110003','Longueuil','2312 Longueuil','1111111113','NULL','NULL');
INSERT INTO Institute (instituteID,name,addr,phone,email,web) VALUES ('110004','Dorval','1223 Dorval','1111111114','NULL','NULL');
INSERT INTO Institute (instituteID,name,addr,phone,email,web) VALUES ('110005','Trudeau','1234 Trudeau','1111111115','NULL','NULL');
INSERT INTO Institute (instituteID,name,addr,phone,email,web) VALUES ('110006','Kirkland','8374 Kirkland','1111111116','NULL','NULL');
INSERT INTO Institute (instituteID,name,addr,phone,email,web) VALUES ('110007','Beaconsfield','3333 Beaconsfield','1111111117','NULL','NULL');
INSERT INTO Institute (instituteID,name,addr,phone,email,web) VALUES ('110008','Nuns','444 Nuns','1111111118','NULL','NULL');
INSERT INTO Institute (instituteID,name,addr,phone,email,web) VALUES ('110009','Verdun','53 Verdun','1111111119','NULL','NULL');
INSERT INTO Institute (instituteID,name,addr,phone,email,web) VALUES ('110010','Lasalle','435 Lasalle','1111111120','NULL','NULL');
INSERT INTO Institute (instituteID,name,addr,phone,email,web) VALUES ('110011','Brossard','2424 Brossard','1111111121','NULL','NULL');
INSERT INTO Institute (instituteID,name,addr,phone,email,web) VALUES ('110012','Lac-Saint-Louis','2334 Lac-Saint-Louis','1111111122','NULL','NULL');




INSERT INTO Birthingcenter (instituteID) VALUES ('110001');
INSERT INTO Birthingcenter (instituteID) VALUES ('110002');
INSERT INTO Birthingcenter (instituteID) VALUES ('110003');
INSERT INTO Birthingcenter (instituteID) VALUES ('110004');
INSERT INTO Birthingcenter (instituteID) VALUES ('110005');
INSERT INTO Birthingcenter (instituteID) VALUES ('110006');
INSERT INTO Birthingcenter (instituteID) VALUES ('110007');




INSERT INTO CommunityClinic (instituteID) VALUES ('110008');
INSERT INTO CommunityClinic (instituteID) VALUES ('110009');
INSERT INTO CommunityClinic (instituteID) VALUES ('110010');
INSERT INTO CommunityClinic (instituteID) VALUES ('110011');
INSERT INTO CommunityClinic (instituteID) VALUES ('110012');
INSERT INTO Midwife (pracID,name,email,phone,instituteID) VALUES ('220001','Marion Girard
','marion@gmail.com','5145577890','110001');
INSERT INTO Midwife (pracID,name,email,phone,instituteID) VALUES ('220002','Bill Bores',' 
bill@gmail.com','5145577891','110002');
INSERT INTO Midwife (pracID,name,email,phone,instituteID) VALUES ('220003','James Bond','
james@gmail.com','5145577892','110003');
INSERT INTO Midwife (pracID,name,email,phone,instituteID) VALUES ('220004','Tom Will','too
m@gmail.com','5145577893','110004');
INSERT INTO Midwife (pracID,name,email,phone,instituteID) VALUES ('220005','Jenny Ford','
jenny@gmail.com','5145577894','110005');
INSERT INTO Midwife (pracID,name,email,phone,instituteID) VALUES ('220006','Jim Parsons',
'jim@gmail.com','5145577895','110006');
INSERT INTO Midwife (pracID,name,email,phone,instituteID) VALUES ('220007','Ben Harrison'
,'ben@gmail.com','5145577896','110007');
INSERT INTO Midwife (pracID,name,email,phone,instituteID) VALUES ('220008','Terry Wen','terry@gmail.com','5145577897','110008');
INSERT INTO Midwife (pracID,name,email,phone,instituteID) VALUES ('220009','Shawn Zed','shawn@gmail.com','5145577898','110009');
INSERT INTO Midwife (pracID,name,email,phone,instituteID) VALUES ('220010','Amy Pin','amyy
@gmail.com','5145577899','110010');
INSERT INTO Midwife (pracID,name,email,phone,instituteID) VALUES ('220011','Wendy Curry',
'wendy@gmail.com','5145577900','110011');
INSERT INTO Midwife (pracID,name,email,phone,instituteID) VALUES ('220012','Shames McKay'
,'shames@gmail.com','5145577901','110012');


INSERT INTO Mother (HCardID,email,dob,name,phone,profession,bloodtype,addr) VALUES ('330001','Jane@gmail.com','1971-01-01','Victoria Gutierrez','5145577001','NULL','A','NULL');
INSERT INTO Mother (HCardID,email,dob,name,phone,profession,bloodtype,addr) VALUES ('330002','Austin@gmail.com','1971-01-02','Austin','5145577002','NULL','B','NULL');
INSERT INTO Mother (HCardID,email,dob,name,phone,profession,bloodtype,addr) VALUES ('330003','Penny@gmail.com','1971-01-03','Penny','5145577003','NULL','O','NULL');
INSERT INTO Mother (HCardID,email,dob,name,phone,profession,bloodtype,addr) VALUES ('330004','Jay@gmail.com','1971-01-04','Jay','5145577004','NULL','AB
	','NULL');
INSERT INTO Mother (HCardID,email,dob,name,phone,profession,bloodtype,addr) VALUES ('330005','Xi@gmail.com','1971-01-05','Xi','5145577005','NULL','A','NULL');
INSERT INTO Mother (HCardID,email,dob,name,phone,profession,bloodtype,addr) VALUES ('330006','Julie@gmail.com','1971-01-06','Julie','5145577006','NULL','B','NULL');
INSERT INTO Mother (HCardID,email,dob,name,phone,profession,bloodtype,addr) VALUES ('330007','Olivia@gmail.com','1971-01-07','Olivia','5145577007','NULL','O','NULL');
INSERT INTO Mother (HCardID,email,dob,name,phone,profession,bloodtype,addr) VALUES ('330008','Monica@gmail.com','1971-01-08','Monica','5145577008','NULL','A','NULL');

INSERT INTO Father (fatherID,name,HCardID,email,dob,phone,profession,bloodtype,addr) VALUES ('440001','AA',null,'NULL','1973-02-03','776666','NULL','A','NULL');
INSERT INTO Father (fatherID,name,HCardID,email,dob,phone,profession,bloodtype,addr) VALUES ('440002','BB',null,'NULL','1973-02-04','776667','NULL','A','NULL');
INSERT INTO Father (fatherID,name,HCardID,email,dob,phone,profession,bloodtype,addr) VALUES ('440003','CC',null,'NULL','1973-02-05','776668','NULL','A','NULL');
INSERT INTO Father (fatherID,name,HCardID,email,dob,phone,profession,bloodtype,addr) VALUES ('440004','DD',null,'NULL','1973-02-06','776669','NULL','A','NULL');
INSERT INTO Father (fatherID,name,HCardID,email,dob,phone,profession,bloodtype,addr) VALUES ('440005','EE',null,'NULL','1973-02-07','776670','NULL','B','NULL');
INSERT INTO Father (fatherID,name,HCardID,email,dob,phone,profession,bloodtype,addr) VALUES ('440006','FF',null,'NULL','1973-02-08','776671','NULL','B','NULL');
INSERT INTO Father (fatherID,name,HCardID,email,dob,phone,profession,bloodtype,addr) VALUES ('440007','GG',null,'NULL','1973-02-09','776672','NULL','B','NULL');
INSERT INTO Father (fatherID,name,HCardID,email,dob,phone,profession,bloodtype,addr) VALUES ('440008','HH',NULL,'NULL','1973-02-10','776673','NULL','B','NULL');

INSERT INTO Couple (coupleID,HCardID,fatherID) VALUES ('550001','330001','440001');
INSERT INTO Couple (coupleID,HCardID,fatherID) VALUES ('550002','330002','440002');
INSERT INTO Couple (coupleID,HCardID,fatherID) VALUES ('550003','330003','440003');
INSERT INTO Couple (coupleID,HCardID,fatherID) VALUES ('550004','330004','440004');
INSERT INTO Couple (coupleID,HCardID,fatherID) VALUES ('550005','330005','440005');
INSERT INTO Couple (coupleID,HCardID,fatherID) VALUES ('550006','330006','440006');
INSERT INTO Couple (coupleID,HCardID,fatherID) VALUES ('550007','330007','440007');
INSERT INTO Couple (coupleID,HCardID,fatherID) VALUES ('550008','330008','440008');

INSERT INTO Technician (techID,name,phone) VALUES ('660001','AC','11111');
INSERT INTO Technician (techID,name,phone) VALUES ('660002','AB','11112');
INSERT INTO Technician (techID,name,phone) VALUES ('660003','AD','11113');
INSERT INTO Technician (techID,name,phone) VALUES ('660004','AE','11114');
INSERT INTO Technician (techID,name,phone) VALUES ('660005','AF','11115');

INSERT INTO Pregnancy (coupleID,num,expdueym,lmpdued,usounddued,estdued,interested,homebirth,ppracID,bpracID,InstituteID) VALUES ('550001','2','2022-07-01','','No','No','No','Yes','220001',null,'110001');
INSERT INTO Pregnancy (coupleID,num,expdueym,lmpdued,usounddued,estdued,interested,homebirth,ppracID,bpracID,InstituteID) VALUES ('550002','2','2022-03-01','','Yes','Yes','Yes','No','220002','220009','110002');
INSERT INTO Pregnancy (coupleID,num,expdueym,lmpdued,usounddued,estdued,interested,homebirth,ppracID,bpracID,InstituteID) VALUES ('550003','1','2022-07-01','','Yes','Yes','Yes','Yes','220003','220010','110003');
INSERT INTO Pregnancy (coupleID,num,expdueym,lmpdued,usounddued,estdued,interested,homebirth,ppracID,bpracID,InstituteID) VALUES ('550004','3','2022-03-01','','Yes','Yes','Yes','No','220004','220011','110004');
INSERT INTO Pregnancy (coupleID,num,expdueym,lmpdued,usounddued,estdued,interested,homebirth,ppracID,bpracID,InstituteID) VALUES ('550005','1','2022-03-01','','No','No','No','No','220001','220012','110001');
INSERT INTO Pregnancy (coupleID,num,expdueym,lmpdued,usounddued,estdued,interested,homebirth,ppracID,bpracID,InstituteID) VALUES ('550006','1','2022-06-01','','No','No','No','No','220001',null,'110001');
INSERT INTO Pregnancy (coupleID,num,expdueym,lmpdued,usounddued,estdued,interested,homebirth,ppracID,bpracID,InstituteID) VALUES ('550007','1','2022-06-01','','No','No','No','No','220012',null,'110012');
INSERT INTO Pregnancy (coupleID,num,expdueym,lmpdued,usounddued,estdued,interested,homebirth,ppracID,bpracID,InstituteID) VALUES ('550008','1','2022-07-01','','No','No','No','No','220012',null,'110012');

INSERT INTO Baby (babyid,gender,dob,btime,bloodtype,bname,pregnum,coupleID) VALUES ('770001','M','2022-07-07','22:10','','Opa','2','550001');
INSERT INTO Baby (babyid,gender,dob,btime,bloodtype,bname,pregnum,coupleID) VALUES ('770002','M','2022-02-22','23:10','','Lia','2','550002');
INSERT INTO Baby (babyid,gender,dob,btime,bloodtype,bname,pregnum,coupleID) VALUES ('770003','F','2022-03-06','0:10','','Pipi','1','550003');
INSERT INTO Baby (babyid,gender,dob,btime,bloodtype,bname,pregnum,coupleID) VALUES ('770004','F','2022-04-02','1:10','','Che','3','550004');
INSERT INTO Baby (babyid,gender,dob,btime,bloodtype,bname,pregnum,coupleID) VALUES ('770005','M','2022-04-08','2:10','','Nov','1','550005');
INSERT INTO Baby (babyid,gender,dob,btime,bloodtype,bname,pregnum,coupleID) VALUES ('770006','M','2022-02-20','12:00','','Ven','1','550006');
INSERT INTO Baby (babyid,gender,dob,btime,bloodtype,bname,pregnum,coupleID) VALUES ('770007','M','2022-02-20','12:05','','Xian','1','550006');
INSERT INTO Baby (babyid,gender,dob,btime,bloodtype,bname,pregnum,coupleID) VALUES ('770008','F','2022-02-20','12:10','','Gen','1','550006');

INSERT INTO Tests (testid,ttype,prescdate,sampdate,labdate,results,pracID,pregnum,coupleID,babyID,techID) VALUES ('880001','blood iron','2022-03-03','2022-03-05','2022-04-05','Decent blood iron level','220001','2','550001',null,'660001');
INSERT INTO Tests (testid,ttype,prescdate,sampdate,labdate,results,pracID,pregnum,coupleID,babyID,techID) VALUES ('880002','blood iron','2022-03-04','2022-03-06','2022-04-06','need more nutrition','220002','2','550002',null,'660002');
INSERT INTO Tests (testid,ttype,prescdate,sampdate,labdate,results,pracID,pregnum,coupleID,babyID,techID) VALUES ('880003','blood iron','2022-03-05','2022-03-07','2022-04-07','Not so good','220003','1','550003',null,'660003');
INSERT INTO Tests (testid,ttype,prescdate,sampdate,labdate,results,pracID,pregnum,coupleID,babyID,techID) VALUES ('880004','ultrasound','2022-03-06','2022-03-08','2022-04-08','Good','220004','3','550004',null,'660004');
INSERT INTO Tests (testid,ttype,prescdate,sampdate,labdate,results,pracID,pregnum,coupleID,babyID,techID) VALUES ('880005','blood iron','2022-03-07','2022-03-09','2022-04-09','A little low','220001','1','550005',null,'660005');
INSERT INTO Tests (testid,ttype,prescdate,sampdate,labdate,results,pracID,pregnum,coupleID,babyID,techID) VALUES ('880006','ultrasound','2022-03-08','2022-03-10','2022-04-10','Excellent condition','220001','1','550006',null,'660001');
INSERT INTO Tests (testid,ttype,prescdate,sampdate,labdate,results,pracID,pregnum,coupleID,babyID,techID) VALUES ('880007','blood iron','2022-03-09','2022-03-11','2022-05-05','Excellent blood iron level','220001','2','550001',null,'660001');

INSERT INTO InfoSession (infoID,sdate,stime,lang,practid) VALUES ('990001','2022-01-02','9:00','ENG','220001');
INSERT INTO InfoSession (infoID,sdate,stime,lang,practid) VALUES ('990002','2022-01-03','10:00','FRL','220002');
INSERT INTO InfoSession (infoID,sdate,stime,lang,practid) VALUES ('990003','2022-01-04','11:00','ENG','220003');
INSERT INTO InfoSession (infoID,sdate,stime,lang,practid) VALUES ('990004','2022-01-05','12:00','FRL','220004');
INSERT INTO InfoSession (infoID,sdate,stime,lang,practid) VALUES ('990005','2022-01-06','13:00','FRL','220005');
INSERT INTO Appointment (appointmentid,adate,atime,pregnum,coupleID,practid,instituteID) VALUES ('111001','2022-03-02','8:00','2','550001','220001','110001');
INSERT INTO Appointment (appointmentid,adate,atime,pregnum,coupleID,practid,instituteID) VALUES ('111002','2022-03-23','9:00','1','550005','220001','110001');
INSERT INTO Appointment (appointmentid,adate,atime,pregnum,coupleID,practid,instituteID) VALUES ('111003','2022-03-24','10:00','1','550006','220001','110001');
INSERT INTO Appointment (appointmentid,adate,atime,pregnum,coupleID,practid,instituteID) VALUES ('111004','2022-02-05','11:00','2','550002','220002','110002');
INSERT INTO Appointment (appointmentid,adate,atime,pregnum,coupleID,practid,instituteID) VALUES ('111005','2022-02-06','12:00','1','550003','220003','110003');
INSERT INTO InfoSessionRegistration (infoID,coupleID,attended) VALUES ('990001','550001','Yes');
INSERT INTO InfoSessionRegistration (infoID,coupleID,attended) VALUES ('990002','550002','Yes');
INSERT INTO InfoSessionRegistration (infoID,coupleID,attended) VALUES ('990003','550003','No');
INSERT INTO InfoSessionRegistration (infoID,coupleID,attended) VALUES ('990004','550004','No');
INSERT INTO InfoSessionRegistration (infoID,coupleID,attended) VALUES ('990005','550005','No');
INSERT INTO Notes (noteID,appointmentid,content,ndate,ntime) VALUES ('222001','111001','Great condition','2022-03-02','8:00');
INSERT INTO Notes (noteID,appointmentid,content,ndate,ntime) VALUES ('222002','111002','Eat healthy ','2022-03-23','9:00');
INSERT INTO Notes (noteID,appointmentid,content,ndate,ntime) VALUES ('222003','111003','Exercise','2022-03-24','10:00');
INSERT INTO Notes (noteID,appointmentid,content,ndate,ntime) VALUES ('222004','111004','Dont drink alcohol','2022-02-05','11:00');
INSERT INTO Notes (noteID,appointmentid,content,ndate,ntime) VALUES ('222005','111005','Stay rest','2022-02-06','12:00');

