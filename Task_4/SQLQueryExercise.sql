select * from Doctors;

select * from Patients
order by Age;

select * from Patients
order by Age
offset 5 rows
fetch next 10 rows only;

select top 5 *
from Doctors;

select distinct City
from Patients;

select *
from Patients
where Age = 25;

select *
from Patients
where Email is null;

select * 
from Doctors
where Experience = 'Advanced' 
and Specialty ='Cardiology';

select * 
from Doctors
where  Specialty in('Cardiology','Ophthalmology');

select * from Patients
where Age between 23 and 32;

select * from Doctors
where Name like 'D%';

select Name DoctorName ,Email DoctorEmail from Doctors;

select p.*,d.Name PatientName from Prescriptions p join Patients d
on d.UR_Number = p.Patient_UR_Number;

select City,count(UR_Number) Patients from Patients
group by City;

select City,count(UR_Number) Patients from Patients
group by City
having count(UR_Number) > 5;

select City,Age,count(UR_Number) Patients from Patients
group by GROUPING SETS(
(City,Age),(City),(Age),()
);

select City,Age,count(UR_Number) Patients from Patients
group by cube (City,Age);

select City,count(UR_Number) Patients from Patients
group by rollup (City);

select * from Patients pa join Prescriptions pr
on pr.Patient_UR_Number = pa.UR_Number;

select Name from Patients
union
select Name from Doctors;

insert into Doctors
values(2000,'Ahmed Khaled','ahmed@gmail.com','0128',
'IS','Expert');

insert into Patients
values
(2000,'Ahmed Khaled','Cairo','Giza','Tersa',27,
'ahmedk@gmail.com','01284','2X55QP30HK69' ),
(2001,'Ahmed','Cairo','Giza','Tersa',27,
'ahmedkh@gmail.com','012843','2X55QP30HK469' );
;

update Doctors
set Phone='0111'
where ID=2000;

delete from Patients
where UR_Number = 2001;

with cte_patient_doctor (PatientID , PatientName , DoctorName)as(
select pd.Patient_UR_Number , p.Name , d.Name 
from PrimaryDoctor pd join Patients p
on p.UR_Number = pd.Patient_UR_Number
join Doctors d 
on d.ID = pd.Doctor_ID
)
select PatientID , PatientName , DoctorName
from cte_patient_doctor;

begin transaction
insert into Doctors
values(2022,'Ahmed Kh','ah@gmail.com','0128343',
'IS','Expert');
insert into Patients
values
(2033,'Khaled','Cairo','Giza','Tersa',27,
'ahmeee@gmail.com','0128434','2X5435QP30HK69' );
commit;

select * from Doctor_Patient_info

create index Phone_index
on Patients(Phone);