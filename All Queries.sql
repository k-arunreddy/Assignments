use Recruitment

select * from ExternalCandidate

select cCandidateCode, vFirstName,vLastName, siTestScore
from ExternalCandidate

--Arthimetic Operators

select cCandidateCode, vFirstName+vLastName as Name, siTestScore
from ExternalCandidate

select cCandidateCode, 'Name'=vFirstName+space(1)+vLastName, siTestScore
from ExternalCandidate


select cCandidateCode, vFirstName+space(1)+vLastName 'Candidate Name', siTestScore
from ExternalCandidate

select 'name'+vFirstName, vLastName from ExternalCandidate


select cCandidateCode, 'Name'=vFirstName+space(1)+vLastName, siTestScore,'newMarks'=10+siTestScore
from ExternalCandidate

--syntax check
--resource check
--performance optimization -- index
--execution plan
--execute

--where clause
--note MSsql is case-insensitive by dadfault

-- where clause

select cCandidateCode, vFirstName,vLastName, siTestScore
from ExternalCandidate where vFirstName='angela'

select cCandidateCode, vFirstName, vLastName, siTestScore 
from ExternalCandidate where cCandidateCode='000202'

select cCandidateCode, vFirstName, vLastName, siTestScore 
from ExternalCandidate where sitestscore=80


select cCandidateCode, vFirstName, vLastName, siTestScore 
from ExternalCandidate where sitestscore between 80 and 90

-- <,>,<=,>=,!=,<>
-- comparision operators


select cCandidateCode, vFirstName, vLastName, siTestScore 
from ExternalCandidate where sitestscore>80 and sitestscore<90

--get all candidates from city Norton and Mentor
select * from ExternalCandidate where cCity='Norton' or cCity='Mentor'
select * from ExternalCandidate where cCity='Mentor' or cCity='Norton'


select * from ExternalCandidate where
cCity='Norton' and siTestScore<90
select * from ExternalCandidate where
siTestScore<90 and cCity='Norton'

select * from ExternalCandidate 
where cCity='Norton' or cCity='Mentor' or cCity='Seattle'
select * from ExternalCandidate 
where cCity in('Norton','Mentor','Seattle')

--Like 

select * from ExternalCandidate
where vAddress like '%street'
select * from ExternalCandidate
where vAddress like '%street%'


select * from ExternalCandidate
where vFirstName like '%N'
select * from ExternalCandidate
where vFirstName like 'N%'

select * from ExternalCandidate
where cCandidateCode like '%1'
select * from ExternalCandidate
where cCandidateCode like '%1_'

select * from ExternalCandidate
where cCandidateCode like '%1[268]'
select * from ExternalCandidate
where cCandidateCode like '%1[2-8]'

select * from ExternalCandidate
where (vFirstName like 'b%' or vFirstName like 'a%' or vFirstName like 'j%')and (vFirstName like '%h' or vFirstName like '%a' or vFirstName like '%y')

--distinct
select cCity from ExternalCandidate
select distinct cCity from ExternalCandidate

select distinct cCity,cState from ExternalCandidate
select distinct cState, cCity from ExternalCandidate

--select vFirstName, distinct cCity,cState from ExternalCandidate

--Order by
select cState, cCity, vFirstName, cCandidateCode from ExternalCandidate
order by cState
select cState, cCity, vFirstName, cCandidateCode from ExternalCandidate
order by cState,cCity

sp_help ExternalCandidate

create index idxstateexcan on externalCandidate(cstate, ccity)

select cstate, ccity, ccandidatecode, vfirstname, vlastname, sitestscore
from ExternalCandidate
order by cstate, ccity desc

select cstate, ccity, ccandidatecode, vfirstname, vlastname, sitestscore
from ExternalCandidate
order by siTestScore desc

select top 10 percent ccandidatecode, vfirstname, vlastname, sitestscore
from ExternalCandidate
order by sitestscore desc

select top 5 ccandidatecode, vfirstname, vlastname, sitestscore
from ExternalCandidate
order by sitestscore 

select top 5 ccandidatecode, vfirstname, vlastname, sitestscore
from ExternalCandidate
order by sitestscore desc

--Aggragte Functions

select max=max(sitestscore),min=min(sitestscore),avg=avg(sitestscore),count=count(sitestscore)
from ExternalCandidate

select count(cCandidateCode) as total from ExternalCandidate 
where siTestScore>50

select avg(siTestScore) as Avg_Score from ExternalCandidate

select * from ExternalCandidate

select sum(mPrevAnnualSalary) AS Sum_Salary from ExternalCandidate
where mPrevAnnualSalary>30000

--Group by

--select cstate, 'TotalCandidates'=count(cCandidateCode) from ExternalCandidate

--select cstate,cCity, 'TotalCandidates'=count(cCandidateCode)
--from ExternalCandidate
--group by cState

select cstate,cCity, 'TotalCandidates'=count(cCandidateCode)
from ExternalCandidate
group by cState, cCity

select cstate, 'TotalCandidates'=count(cCandidateCode), sum(mPrevAnnualSalary) as cState_Sum_Salary
from ExternalCandidate 
group by cState

--having clause


select cstate, 'TotalCandidates'=count(cCandidateCode), sum(mPrevAnnualSalary) as cState_Sum_Salary
from ExternalCandidate 
group by cState
having count(cCandidateCode)>1


select cstate, 'TotalCandidates'=count(cCandidateCode), sum(mPrevAnnualSalary) as cState_Sum_Salary
from ExternalCandidate where cState in ('Nevada', 'Ohio','Kansas')
group by cState


select cstate, 'TotalCandidates'=count(cCandidateCode), sum(mPrevAnnualSalary) as cState_Sum_Salary
from ExternalCandidate
where cState in ('Nevada', 'Ohio','Kansas') and sitestscore > 70
group by cState


select cstate, 'TotalCandidates'=count(cCandidateCode), sum(mPrevAnnualSalary) as cState_Sum_Salary
from ExternalCandidate where siTestScore>70
group by cState
having cState in ('Nevada','ohio','texas')



select cstate, 'TotalCandidates'=count(cCandidateCode), sum(mPrevAnnualSalary) as cState_Sum_Salary
from ExternalCandidate 
where cState in ('Nevada', 'Ohio','Kansas')
group by cState

--joins

--inner join-->join
--outer join
--right join
--left join
--self join

Select * from RecruitmentAgencies

select cCandidateCode, vFirstName, vLastName, cAgencyCode
from ExternalCandidate
where cAgencyCode is NOT NULL

select cCandidateCode, vFirstName, vLastName
from ExternalCandidate as E
join RecruitmentAgencies as R
on E.cAgencyCode = R.cAgencyCode

select * from College
select * from ContractRecruiter
Select * from RecruitmentAgencies
Select * from ExternalCandidate
select * from Position


Select cCandidateCode,vFirstName, vDescription
from ExternalCandidate as e
join Position p
on e.cPositionCode=p.cPositionCode


select cCandidateCode,vFirstName, cname
from ExternalCandidate e
join ContractRecruiter c
on e.cContractRecruiterCode=c.cContractRecruiterCode


select cCandidateCode, vfirstName, cCollegeName
from ExternalCandidate e
join College c
on e.cCollegeCode=c.cCollegeCode

--Ambigioucloumn

select cCandidateCode, vFirstName, cname, cphone
from ExternalCandidate e
join RecruitmentAgencies r
on e.cAgencyCode=r.cAgencyCode

--resolved
select cCandidateCode, vFirstName,'cPhone'= e.cPhone, 'RPhone'=r.cphone
from ExternalCandidate e
join RecruitmentAgencies r
on e.cAgencyCode=r.cAgencyCode


select cCandidateCode, vFirstName, cname, RecruitmentAgencies.cphone
from ExternalCandidate 
join RecruitmentAgencies 
on ExternalCandidate.cAgencyCode=RecruitmentAgencies.cAgencyCode

--alias
select cCandidateCode, vFirstName, cname, r.cPhone
from ExternalCandidate e
join RecruitmentAgencies r
on e.cAgencyCode=r.cAgencyCode


select * from College
select * from ContractRecruiter
Select * from RecruitmentAgencies
Select * from ExternalCandidate
select * from Position

SELECT 
    ec.ccandidatecode,
    ec.vFirstname,
    p.vDescription
FROM 
    externalcandidate ec
left JOIN 
    position p ON ec.cPositionCode = p.cPositionCode;


SELECT 
    ec.ccandidatecode,
    ec.vFirstname,
    c.cname
FROM 
    externalcandidate ec
full outer JOIN 
    ContractRecruiter c ON ec.cContractRecruiterCode = c.cContractRecruiterCode;

SELECT 
    ec.ccandidatecode,
    ec.vFirstname,
    clg.cCollegeName
FROM 
    externalcandidate ec
right JOIN 
    college clg ON ec.cCollegeCode = clg.cCollegeCode;




--
select * from Employee

update employee
set cSupervisorCode='000001'
where cEmployeecode like '%[5-9]'

update employee
set cSupervisorCode='000002'
where cEmployeecode like '%[3-4]'

update employee
set cSupervisorCode='000001'
where cEmployeecode like '%[2]'

update employee
set cSupervisorCode='000003'
where cEmployeecode like '%1[1-2]'


select "Employee"=emp.vFirstName+space(1)+emp.vLastName, 'Supervisor'=sp.vFirstName+space(1)+sp.vLastName
from Employee emp
join Employee sp
on emp.cSupervisorCode=sp.cEmployeeCode

select ccandidatecode, vfirstname, cname 'Recruiter'
from ExternalCandidate e, RecruitmentAgencies r 
where e.cAgencyCode=r.cAgencyCode

select cCandidateCode, p.cPositionCode
from ExternalCandidate e
cross join Position p
where p.cPositionCode like '%[12]'
order by cCandidateCode

--subquery

select cRating from ExternalCandidate
where vFirstName='Angela'
select cCandidateCode, vFirstName, vLastName
from ExternalCandidate
where cRating=8

select cCandidateCode, vFirstName, vLastName, cRating
from ExternalCandidate
where cRating in (Select cRating from ExternalCandidate 
where vFirstName='David')

select cCandidateCode, vFirstName, vLastName, cRating
from ExternalCandidate
where cRating in (Select cRating from ExternalCandidate 
where vFirstName in ('David','Angela'))

select cCandidateCode, vFirstName, vLastName, cRating, siTestScore
from ExternalCandidate
where siTestScore= (select min(siTestScore) from ExternalCandidate
where vFirstName in ('Angela', 'Barbara'))


select cCandidateCode, vFirstName, vLastName, cRating, siTestScore
from ExternalCandidate
where siTestScore <all(select min(siTestScore) from ExternalCandidate
where vFirstName in ('Angela', 'Barbara'))


--join substitute
select e.cCandidateCode, e.vFirstName, e.vLastName
from ExternalCandidate e
join ExternalCandidate o
on e.cRating=o.cRating
where o.vFirstName='Angela'


select cCandidateCode, vFirstName, vLastName, cRating, siTestScore
from ExternalCandidate
where siTestScore <all(select max(siTestScore) from ExternalCandidate
where vFirstName in ('Angela', 'Barbara'))


select cCandidateCode, vFirstName, vLastName, cRating, siTestScore
from ExternalCandidate
where siTestScore <any(select min(siTestScore) from ExternalCandidate
where vFirstName in ('Angela', 'Barbara'))



select cCandidateCode, vFirstName, vLastName, cRating, siTestScore
from ExternalCandidate
where siTestScore >(select avg(sitestscore) from ExternalCandidate)


select cCandidateCode, vFirstName, vLastName, cRating, siTestScore
from ExternalCandidate o
where siTestScore >(select avg(sitestscore) from ExternalCandidate i where i.cState=o.cState)






