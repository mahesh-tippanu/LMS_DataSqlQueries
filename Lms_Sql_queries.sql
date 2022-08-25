create database LMS;

use LMS;

create table UserDetails(
	user_id int  auto_increment PRIMARY KEY,
    email varchar(40),
    first_name varchar(20),
    last_name varchar(20),
    password varchar(20),
    contact_number long,
    verified varchar(10),
    creator_stamp  datetime,
    creator_user varchar(30)
);


create table HiredCandidates
(
	candidate_id int primary key,
    firstName varchar(20),
    middleName varchar(20),
    lastName varchar(20),
    email varchar(20),
    hiredCity varchar(20),
    hiredDate date,
    mobileNumber long,
    degree varchar(20),	
    hiredLab varchar(20),
    attitudeRemark varchar(20),
    communicationRemark varchar(20),
    knowledgeRemark varchar(20),
    status varchar(20),
    creatorUserId int,
    creatorStamp datetime,
    location varchar(20),
    aggrPer varchar(20),
    permanentPincode long 
);


create table FellowshipCandidate
 (
Candidate_ID int auto_increment PRIMARY KEY,
CIC_ID varchar(50),
FirstName varchar(225),
MiddleName varchar(225),
LastName varchar(225),
EmailId  varchar(225),
HiredCity varchar(225),
Degree  varchar(225),
HiredDate date,
Mobile_Number bigint,
Permanent_Pincode int,
HiredLab varchar(225),
Attitde varchar(225),
Communication_Remark varchar(225),
Knownledge_Remark varchar(225),
Aggregate_Remark int,
Creator_Stamp date,
Creator_User varchar(225),
BirthDate date,
Is_Birth_Date_Verfied bit,
Parent_Name varchar(225),
Parent_Occupation varchar(225),
Parents_Mobilenumber bigint,
Parents_Annual_Salary bigint,
LocalAddress varchar(225),
Permanent_Address varchar(225),
Photo_Path varchar(225),
Joining_Date date, 
Candidate_Status varchar(225),
Personal_Information varchar(225),
Bank_Information varchar(225),
Educational_Information varchar(225),
Document_Status varchar(225),
Remark varchar(225)
 );
 
 desc FellowshipCandidate;
 
  create table Candidate_BankDetails
( 
Id int auto_increment PRIMARY KEY,
Candidate_ID int,
Name varchar(225),
Account_Number bigint, 
Ifsc_code bigint, 
pan_number varchar(225), 
addhaar_num bigint,
creator_stamp date,
creator_user varchar(225),
foreign key (Candidate_ID) references FellowshipCandidate (Candidate_ID)
);

describe Candidate_BankDetails;

create table CandidateQualification
(  
Id int auto_increment PRIMARY KEY,
Candidate_ID int,
Diploma varchar(60),
Degree_Name varchar(60), 
Employee_Decipline varchar(60), 
Passing_Year date, 
Aggr_Per float, 
Final_Year_Per date, 
Training_Institute varchar(60), 
Training_Duration_Month varchar(60), 
Other_Training varchar(60), 
Creator_Stamp date, 
Creator_User varchar(60),
Foreign key (Candidate_ID) references FellowshipCandidate (Candidate_ID)
);

create table LMS.Candidate_Documents
(
ID int auto_increment PRIMARY KEY,
Candidate_ID int,
Doc_Type varchar(60),
Doc_Path varchar(60), 
Doc_Status varchar(60),
Creator_Stamp date,
Creator_User varchar(60),
Foreign key (Candidate_ID) references FellowshipCandidate (Candidate_ID)
);

desc Candidate_Documents;

create table Company
(
ID int auto_increment PRIMARY KEY,
Name varchar(60),
Address varchar(225),
Location varchar(60),
status varchar(60),
Creator_Stamp date, 
Creator_User varchar(60) 
);

desc Company;

create table Tech_Stack
(
Id int auto_increment PRIMARY KEY,
Tech_Name varchar(60), 
Image_Path varchar(260), 
Framework varchar(60), 
Cur_Status varchar(60),
Creator_Stamp date, 
Creator_User varchar(60)
);

desc Tech_Stack;

create table Tech_Type
(
Tech_Type_Id int auto_increment PRIMARY KEY,
Type_Name varchar(60),
Cur_Status varchar(60),
Creator_Stamp date, 
Creator_User varchar(60)
);

desc Tech_Type;

create table MakerProgram
(
Id int auto_increment PRIMARY KEY,
Program_Name varchar(60),
Program_Type varchar(60), 
Program_Link varchar(2048),
Tech_Stack_Id int, 
Tech_Type_Id int, 
Description varchar(60), 
Status varchar(60),
Creator_Stamp date,
Creator_User varchar(60),
Foreign key (Tech_Stack_Id) references Tech_Stack (Id),
Foreign key (Tech_Type_Id) references Tech_Type (Tech_Type_Id)
);

desc MakerProgram;

create table Lab
(
Lab_ID int auto_increment PRIMARY KEY,
Name varchar(60),
Location varchar(60),
Address varchar(60), 
Status varchar(60),
Creator_Stamp date, 
Creator_User varchar(60)
);

desc Lab;

create table Mentor
(
Mentor_ID int auto_increment PRIMARY KEY, 
Name varchar(60),
Mentor_Type varchar(60),
Lab_ID int,
Status varchar(60),
Creator_Stamp date,
Creator_User varchar(60),
Foreign key (Lab_ID) references Lab (Lab_ID)
);

desc Mentor;


create table MentorTechStack
(
Mentor_Tech_Stack_ID int auto_increment PRIMARY KEY,
Mentor_Id int, 
Tech_Stack_Id int, 
Status varchar(60),
Creator_Stamp datetime, 
Creator_User varchar(60),
Foreign key (Mentor_Id) references Mentor (Mentor_ID),
Foreign key (Tech_Stack_Id) references Tech_Stack (Id)
);

desc MentorTechStack;

create table LabThreshold
(
Thresgold_Id int auto_increment PRIMARY KEY,
Lab_Id int,
Lab_Capacity int,
Lead_Threshold int,
Tdeation_Engg_Threshold varchar(60),
Buddy_Engg_Threshold varchar(60),
Status varchar(60),
Creator_Stamp date,
Creator_User varchar(60),
Foreign key (Lab_Id) references Lab (Lab_ID)
);

desc LabThreshold;


create table MentorIdeationMap
(
Id int auto_increment PRIMARY KEY, 
Parent_Mentor_Id int,
Mentor_Id int,
Status varchar(60),
Creator_Stamp date, 
Creator_User varchar(60),
Foreign key (Parent_Mentor_Id) references MakerProgram (Id),
Foreign key (Mentor_Id) references Mentor (Mentor_ID)
);

desc MentorIdeationMap;

create table Company_Requirement
(
ID int auto_increment PRIMARY KEY,
Company_Id int,
Requested_Month date, 
City varchar(60), 
Is_Doc_Verifrication boolean,
Requirement_Doc_Path nvarchar(260), 
No_of_Engg int,
Tech_Stack_Id int,
Tech_Type_Id int,
Maker_Program_Id int,
Lead_Id int,
Ideation_Engg_Id int,
Buddy_Engg_Id int,
Special_Remark varchar(60),
Status varchar(60),  
Creator_Stamp date,
Creator_User varchar(60),
Foreign key (Tech_Stack_Id) references Tech_Stack (Id),
Foreign key (Company_Id) references Company (ID),
Foreign key (Tech_Type_Id) references Tech_Type (Tech_Type_Id),
Foreign key (Maker_Program_Id) references MakerProgram (Id),
Foreign key (Lead_Id) references Mentor (Mentor_ID),
Foreign key (Ideation_Engg_Id) references MentorIdeationMap (Id),
Foreign key (Buddy_Engg_Id) references Mentor (Mentor_ID)
);

desc Company_Requirement;

create table Candidate_Stack_Assignment 
(
Id int primary key, 
Requirement_Id int,
Candidate_Id int, 
assign_date date, 
complete_date date,
Status varchar(60),
creator_stamp date,
creator_user varchar(40),
Foreign key (Requirement_Id) references Company_Requirement (ID),
Foreign key (Candidate_Id) references FellowshipCandidate (Candidate_ID)
);

desc Candidate_Stack_Assignment;
