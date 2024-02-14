CREATE VIEW Doctor_Patient_info 
as
select pd.Patient_UR_Number , p.Name PatientName, d.Name DoctorName
from PrimaryDoctor pd join Patients p
on p.UR_Number = pd.Patient_UR_Number
join Doctors d 
on d.ID = pd.Doctor_ID;