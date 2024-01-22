create database Movie
use Movie

create table Actors(
ActID int primary key,
ActFName char(20),
ActLName char(20),
ActGender char(1) );

create table Directors(
DirID int primary key,
DirFName char(20),
DirLName char(20) );

create table Movies(
MovId int primary Key,
MovTitle char(50),
MovYear int,
MovTime int,
MovLang char(50),
MovDtRel date,
MovRelCountry char(5) );


create table Movie_Direction(
DirID int,
MovID int,
constraint FK_Dir_Mov foreign key (DirID) 
references Directors(DirID),
constraint FK_Mov_Dir foreign key (MovID)
references Movies(MovID)
);

create table Reviewers(
RevID int primary key,
RevName char(30) );

create table Genres(
GenID int primary key,
GenTitle char(20) );

create table Movie_Genres(
MovID int,
GenID int,
constraint FK_Mov_MovGen foreign key (MovID) 
references Movies(MovID),
constraint Fk_Gen_MovGen foreign key (GenID) 
references Genres(GenID) );

create table Rating(
MovId int,
RevID int,
RevStars int,
NumOfRatings int,
constraint FK_MovRat foreign key (MovID) 
references Movies(MovID),
constraint FK_RevRat foreign key (RevID) 
references Reviewers(RevID) );

create table Movie_Cast(
ActID int,
MovID int,
Role char(30),
constraint FK_Mov_MovCast foreign key (MovID) 
references Movies(MovID),
constraint FK_Act_MovCast foreign key (ActID) 
references Actors(ActID) );