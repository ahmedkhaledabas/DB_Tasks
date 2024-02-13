create database ParwonHealthe
use ParwonHealthe

CREATE TABLE Patients (
  UR_Number INT PRIMARY KEY,
  Name VARCHAR(20),
  City varchar(20),
  State varchar(20),
  Street varchar(20),
  Age INT,
  Email VARCHAR(50),
  Phone VARCHAR(15),
  Medicare_Number VARCHAR(10)
);

CREATE TABLE Doctors (
  ID INT PRIMARY KEY,
  Name VARCHAR(20),
  Email VARCHAR(50),
  Phone VARCHAR(15),
  Specialty VARCHAR(20),
  Experience INT
);

CREATE TABLE PrimaryDoctor (
  Doctor_ID INT,
  Patient_UR_Number INT,
  PRIMARY KEY (Doctor_ID, Patient_UR_Number),
  FOREIGN KEY (Doctor_ID) REFERENCES Doctors(ID),
  FOREIGN KEY (Patient_UR_Number) REFERENCES Patients(UR_Number)
);

CREATE TABLE Pharmaceutical_Companies (
  Comp_ID INT PRIMARY KEY,
  Name VARCHAR(20),
  City VARCHAR(20),
  State VARCHAR(20),
  Street VARCHAR(20),
  Phone VARCHAR(15)
);

CREATE TABLE Drugs (
  Drug_ID INT PRIMARY KEY,
  Trade_Name VARCHAR(20),
  Strength VARCHAR(10),
  Comp_ID INT,
  FOREIGN KEY (Comp_ID) REFERENCES Pharmaceutical_Companies(Comp_ID)
);

CREATE TABLE Prescriptions (
  Prescription_ID INT PRIMARY KEY,
  Doctor_ID INT,
  Patient_UR_Number INT,
  Quantity INT,
  Date DATE,
  Medicare_card_numbers VARCHAR(10),
  FOREIGN KEY (Doctor_ID) REFERENCES Doctors(ID),
  FOREIGN KEY (Patient_UR_Number) REFERENCES Patients(UR_Number)
);

CREATE TABLE Prescribed_Drugs (
  Prescription_ID INT,
  Drug_ID INT,
  PRIMARY KEY (Prescription_ID, Drug_ID),
  FOREIGN KEY (Prescription_ID) REFERENCES Prescriptions(Prescription_ID),
  FOREIGN KEY (Drug_ID) REFERENCES Drugs(Drug_ID)
);