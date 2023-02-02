use [Student Assesment Database];
-- Give list of students (id,name,section and gender ) which are taught by a given instructor in a given semster
select Student.sid, Student.fname,Student.lname,Student.section,Student.gender from Student 
join Registration on Student.sid = Registration.sid where Registration.INSTID like 'inst005%' and Registration.semester = '1'; 

--maintain continous assessment results
select * from Assesment where Assesment.SID like 'st001%' and Assesment.COURSE like 'Acct1020%' and Assesment.[Assesment name] like 'Final%';
--or
update Assesment
set weight='30',result='15',[assesment date]='2022-06-06'
where Assesment.SID='st010' and COURSE='Cosc4060' and [Assesment name]='MID Exam'

--List of students that are absent in a particular assessment
select * from Assesment where Assesment.result is NULL;

--continuous assessment result of a student in a given course for a specified semester and year
select Assesment.SID,Assesment.COURSE, [Assesment name] ,weight,result,semester,registration_year from Assesment join Registration on 
Registration.sid=Assesment.SID and Registration.code=Assesment.COURSE 
where Assesment.SID  like 'st001%' and Assesment.COURSE like 'Acct1020%' and  semester like '2%' and Registration.registration_year like '2005-01-01%';


--Summary of continuous assessment result of a given student for a specified course that includes full assessment informaion
select COURSE , SUM(result) as 'Total'  from Assesment join Registration on 
Registration.sid=Assesment.SID and Registration.code=Assesment.COURSE 
where Assesment.SID  like 'st001%' and COURSE like 'Acct1020%' group by COURSE

--Which course the students scored an 'F'
SELECT Assesment.SID,Assesment.COURSE ,SUM(result) as 'Total' , Grade='F'
FROM Assesment group by COURSE,SID having SUM(result)<45 and SUM(result)>=35; 

--list of students along with the total number of main courses,common courses and elective course they took
select Registration.sid,course.type, COUNT(*) as 'Total Number of Courses' from Registration join
 course on Registration.code =course.code group by type,Registration.sid;

--List of students along with the number of 'A's,'B's etc they scored so far

--list of instructors along with course titles and semester and year they teach each course
select Instructor.INSTID as 'Instructor id',Instructor.fname,Instructor.lname,course.title,Registration.semester,Registration.registration_year 
from Instructor join Registration on Instructor.INSTID = Registration.INSTID join course on Registration.code=course.code;

        
        
        
        use [Student Assesment Database]
        
        
        
--tools
select COURSE ,SUM(result) as 'Total'  from Assesment join Registration on 
Registration.sid=Assesment.SID and Registration.code=Assesment.COURSE 
where Assesment.SID  like 'st001%' and semester like '2%' group by COURSE
			
			
-- to calculate total in assesment table
select SID,COURSE,COALESCE(SUM(result),0)as 'TOTAL' from Assesment group by COURSE,SID



--to calculate grade 
select Registration.Grade from Registration where exists 
(SELECT Grade=
CASE
    when SUM(result)> 90 Then 'A+'
    WHEN SUM(result)>=80 and SUM(result)<90 THEN 'A'
    WHEN SUM(result)>=70 and SUM(result)<80 THEN 'B+'
    WHEN SUM(result)>=65 and SUM(result)<70 THEN 'B'
    WHEN SUM(result)>=60 and SUM(result)<65 THEN 'C+'
    WHEN SUM(result)>=55 and SUM(result)<60 THEN 'C'
    WHEN SUM(result)>=45 and SUM(result)<55 THEN 'D'                    
    WHEN SUM(result)<45  and SUM(result)>=35 THEN 'F'
    ELSE 'NG'
END 
FROM Assesment group by COURSE,SID);

update Registration
set Grade (select * from temp);










select COURSE , SUM(result) as 'Total'  from Assesment join Registration on 
Registration.sid=Assesment.SID and Registration.code=Assesment.COURSE 
where Assesment.SID  like 'st001%' and semester like '2%' group by COURSE






SELECT Assesment.SID,Assesment.COURSE ,grade=
CASE
    when SUM(result)> 90 Then 'A+'
    WHEN SUM(result)>=80 and SUM(result)<90 THEN 'A'
    WHEN SUM(result)>=70 and SUM(result)<80 THEN 'B+'
    WHEN SUM(result)>=65 and SUM(result)<70 THEN 'B'
    WHEN SUM(result)>=60 and SUM(result)<65 THEN 'C+'
    WHEN SUM(result)>=55 and SUM(result)<60 THEN 'C'
    WHEN SUM(result)>=45 and SUM(result)<55 THEN 'D'                    
    WHEN SUM(result)<45 and SUM(result)>=35 THEN 'F'
    ELSE 'NG'
END 
FROM Assesment join Registration on Registration.code=Assesment.COURSE and Registration.sid=Assesment.SID group by COURSE,Assesment.SID 



select (select course.title from course join Registration on Registration.code=course.code) from Registration


---fuck this
select course.code from course where course.code not in (select course.code from course join Registration on Registration.code = course.code 
join Assesment on Assesment.SID=Registration.sid  and Assesment.COURSE=Registration.code where [Assesment name] like 'assignment%');

select * from Registration left outer join Assesment on Registration.sid=Assesment.SID and Registration.code=Assesment.COURSE
where 


SELECT Assesment.SID,Assesment.COURSE, grade=
CASE
    when SUM(result)> 90 Then 'A+'
    WHEN SUM(result)>=80 and SUM(result)<90 THEN 'A'
    WHEN SUM(result)>=70 and SUM(result)<80 THEN 'B+'
    WHEN SUM(result)>=65 and SUM(result)<70 THEN 'B'
    WHEN SUM(result)>=60 and SUM(result)<65 THEN 'C+'
    WHEN SUM(result)>=55 and SUM(result)<60 THEN 'C'
    WHEN SUM(result)>=45 and SUM(result)<55 THEN 'D'                    
    WHEN SUM(result)<45 and SUM(result)>=35 THEN 'F'
    ELSE 'NG'
END 
FROM Assesment group by COURSE,SID;


SELECT Assesment.SID,Assesment.COURSE ,SUM(result) as 'Total' , Grade='F'
FROM Assesment group by COURSE,SID having SUM(result)<45 and SUM(result)>=35; 



select type,COUNT(*) as 'total' from Registration join course on Registration.code=course.code group by type;

selec