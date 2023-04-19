
 Select Atime, name, HcardID,A.coupleID,pregnum,adate  from
appointment as A left join (
    select name, c.hcardid, coupleid from
        couple as c left join mother as m
          on c.hcardid = m.hcardid
    ) as C
 on A.coupleID = C.coupleID
 where practid = 220001 and adate = '2022-03-02'

select  ppracID,bpracid,Case when ppracid = 220001 then 'P'
                             when bpracid = 220001 then 'B' end as isP ,coupleid,num from pregnancy

--show appointments
    select Atime,isP,Name,HcardID,appointmentid,pregnum,coupleid from (
    select ppracId, bpracid, Case when ppracid = 220001 then 'P'
    when bpracid = 220001 then 'B' end as isP
        , Atime, name, HcardID,appointmentid,pregnum,Ap.coupleid from
    ( Select Atime, name, HcardID, A.coupleID, pregnum, adate,appointmentid from
    appointment as A left join (
    select name, c.hcardid, coupleid from
    couple as c left join mother as m
    on c.hcardid = m.hcardid
    ) as C
    on A.coupleID = C.coupleID) as Ap left join
    ( select ppracID, bpracid, coupleid, num from pregnancy) as B
    on Ap.coupleID = B.coupleID and Ap.pregnum = B.num
    where (ppracid = 220001 or bpracid = 220001) and adate = '2022-03-02')



       select * from appointment
       where practid = 220001 and adate = '2022-03-02'

select ndate, ntime, content from notes
where appointmentid = '111001'



select prescdate, ttype,results from tests
where coupleid = 550001 and pregnum =2

select * from notes

    select MAX(NOTEID) from notes

INSERT INTO  notes (noteID,appointmentid,content,ndate,ntime)  VALUES ('220008', '111005','dwdwjnj','2022-03-09','14:00:00')
Delete from notes where noteid = '220006'

 INSERT INTO Tests (testid,ttype,prescdate,sampdate,labdate,results,pracID,pregnum,coupleID,babyID,techID) VALUES ('880001','blood iron','2022-03-03','2022-03-05','2022-04-05','Decent blood iron level','220001','2','550001',null,'660001');
 select * from Tests
                   select MAX(TestID) from Tests
 select MAX(TestID) from Tests
     SHOW CONSTRAINTS FROM tests;

a.i.
select * from midwife where pracid = '220099';

b.i.
select name from mother where hcardid in(
select Hcardid from couple where coupleid in(
select coupleid from pregnancy where num >= 2))
limit 1

viii.
select substring(content,1,50) as content,coupleid, pregnum from notes as N right join (
select appointmentid,pregnum,appointment.coupleid from appointment where coupleid in
(   select coupleid from couple where hcardid in(
select hcardid from mother where name = 'Victoria Gutierrez'))) as B
on N.appointmentid = B.appointmentid;

xi.
select ttype,results,T.coupleid, pregnum from tests as T right join (
  select coupleid from couple where hcardid in(
select hcardid from mother where name = 'Victoria Gutierrez')) as B
on T.coupleid = B.coupleid

c.i
 select ttype,results,T.coupleid, pregnum from tests as T right join (
     select coupleid from couple where hcardid in(
         select hcardid from mother where name = 'Xi')) as B
                                                                     on T.coupleid = B.coupleid
5
select Left(DOB,7), count(Left(DOB,7)) as count from baby
group by Left(DOB,7)

export to data.csv of del lobs to /home/2020/tzhang71/comp421p3
select date,count(date) from (
    select concat (concat (year (DOB), '-'), Month (DOB)) as date from baby
    )
group by date

select * from baby
where count >= 2




select * from appointment
select substring(ATIME,1,5) from appointment

 select ndate, ntime, substring(content,1,50) as content from notes
 where appointmentid = 111001
Order by ndate DESC, Ntime

 INSERT INTO Baby (babyid,gender,dob,btime,bloodtype,bname,pregnum,coupleID) VALUES ('770010','M','01/03/2022','12:11','','Jin','','');
 INSERT INTO Baby (babyid,gender,dob,btime,bloodtype,bname,pregnum,coupleID) VALUES ('770010','M','01/03/2022','12:11','A','Jin',null,null);
 INSERT INTO Baby (babyid,gender,dob,btime,bloodtype,bname,pregnum,coupleID) VALUES ('770012','F','03/03/2022','14:11','A','Lam',null,null);
 INSERT INTO Baby (babyid,gender,dob,btime,bloodtype,bname,pregnum,coupleID) VALUES ('770013','F','04/03/2022','15:11','A','Colt',null,null);
 select prescdate, ttype, substring(result,1,50) from(
                                                         select prescdate, ttype,case when results is null then 'Pending'
                                                                                      when results is not null then results
                                                             end as result
                                                         from tests
                                                         where coupleid = 550001 and pregnum =2
                                                         Order by prescdate DESC)






