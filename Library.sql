create database Library_Database;

use Library_Database;

create table Library
(
	Library_Name varchar(100) primary key,
	Library_ID_Number int not null,
	Library_Director_First_Name varchar(30) not null,--This should be ID which refers Employee table
	Library_Director_Last_Name varchar(30) not null,
	Library_Contact_Number varchar(15) not null,
	Library_Address varchar(100) not null,
	Library_City varchar(20) default 'Chicago',
	Library_State char(2) default 'IL',
	Library_ZipCode int default '60195',
	Library_Timings varchar(100) not null
);

select * from Library;

 create table Book
( 
	Book_ID int primary key,
	Book_Isbn_No int not null,
	Book_Published_Year int not null,
	Book_Title varchar(100) not null,
	Book_Author_First_Name varchar(30),
	Book_Author_Last_Name varchar(30) not null,
	Book_Language varchar(30),
	Book_Rating   int,
	Book_Price    int,
	Book_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	Book_Entry_Changed timestamp not null  default CURRENT_TIMESTAMP
);

create table eBook
( 
	eBook_ID int primary key,
	eBook_Isbn_no int not null,
	eBook_Release_Date date not null,
	eBook_Title varchar(100) not null,
	eBook_Author_First_Name varchar(30),
	eBook_Author_Last_Name varchar(30) not null,
	eBook_File_Size varchar(100),
	eBook_File_Path varchar(100),
	eBook_Duration time,
	eBook_Language varchar(30),
	eBook_Rating   int,
	eBook_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	eBook_Entry_Changed timestamp not null default CURRENT_TIMESTAMP 
);
 
create table Journal
(
	Journal_ID int primary key,
	Journal_Title varchar(100) not null,
	Journal_Alternate_Title varchar(100),
	Journal_Source varchar(100),
	Journal_ISSN_Number int not null,
	Journal_Published_Date date not null,
	Journal_End_Date date not null,
	Journal_Volume int,
	Journal_Author_Last_Name varchar(30),
	Journal_Author_First_Name varchar(30), 
	Journal_Price int,
	Journal_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	Journal_Entry_Changed timestamp not null default CURRENT_TIMESTAMP
);

create table eJournal
(
	eJournal_ID int primary key,
	eJournal_Title varchar(100) not null,
	eJournal_Alternate_Title varchar(100),
	eJournal_Source varchar(100),
	eJournal_ISSN_Number int not null,
	eJournal_Published_Date date not null,
	eJournal_End_Date date not null,
	eJournal_Volume int,
	eJournal_Author_Last_Name varchar(30),
	eJournal_Author_First_Name varchar(30) ,
	eJournal_File_Size varchar(100),
	eJournal_File_Path varchar(100),
	eJournal_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	eJournal_Entry_Changed timestamp not null default CURRENT_TIMESTAMP
);

create table Magazine
(
	Magazine_ID int primary key,
	Magazine_Name varchar(100) not null,
	Magazine_Published_Date date not null,
	Magazine_Volume_Num int,
	Magazine_Issue_Num int,
	Magazine_Publisher varchar(50),
	Magazine_Genre varchar(30), --This type should be enumeration or user datatype 
	Magazine_Price int,
	Magazine_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	Magazine_Entry_Changed timestamp not null default CURRENT_TIMESTAMP
);

create table Digital_Magazine
(
	Digital_Magazine_ID int primary key,
	Digital_Magazine_Name varchar(100) not null,
	Digital_Magazine_Published_Date date not null,
	Digital_Magazine_Volume_Num int,
	Digital_Magazine_Issue_Num int,
	Digital_Magazine_Publisher varchar(50),
	Digital_Magazine_Genre varchar(30), --This type should be enumeration or user datatype 
	Digital_Magazine_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	Digital_Magazine_Entry_Changed timestamp not null default CURRENT_TIMESTAMP
);

create table DVD
(
	DVD_ID int primary key,
	DVD_Isbn_No int not null,
	DVD_Title varchar(100),
	DVD_Genre varchar(30), --This type should be enumeration or user datatype
	DVD_Rating int,
	DVD_Release_Date date not null,
	DVD_Length time,
	DVD_VideoType varchar(15), 
	DVD_Language varchar(30),
	DVD_Author_First_Name varchar(30),
	DVD_Author_Last_Name varchar(30) not null,
	DVD_Publisher varchar(50),
	DVD_Summary varchar(100),
	DVD_Price int,
	DVD_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	DVD_Entry_Changed timestamp not null default CURRENT_TIMESTAMP  
)

create table CD
(
	CD_ID int primary key,
	CD_Title varchar(100),
	CD_Genre varchar(50), --This type should be enumeration or user datatype
	CD_Length time,
	CD_Release_Date date not null,
	CD_Language varchar(30),
	CD_Author_First_Name varchar(30),
	CD_Author_Last_Name varchar(30),
	CD_Publisher varchar(50),
	CD_Summary varchar(100),
	CD_Price int,
	CD_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	CD_Entry_Changed timestamp not null default CURRENT_TIMESTAMP 
)

create table Library_Member
(
	Library_Member_ID int primary key,
	Library_Parent_ID int, --this refers to another row in Library Member table of Parent
	Library_Member_First_Name varchar(30),
	Library_Member_Last_Name varchar(30),
	Library_Member_DOB date not null,
	Library_Member_Address varchar(100),
	Library_Member_City varchar(20) default 'Schaumburg',
	Library_Member_State char(2) default 'IL',
	Library_Member_Zip_code int default '60173'
);

drop table Library_Member; 

create table Employee_Staff
(
	Employee_Staff_ID int primary key,
	Employee_Staff_SSN int not null,
	Employee_Staff_Joining_Date date not null,
	Employee_Staff_DOB date not null,
	Employee_Staff_Hours_Worked varchar(30)  not null,
	Employee_Staff_First_Name varchar(50),
	Employee_Staff_Last_Name varchar(50),
	Employee_Staff_Address varchar(100),
	Employee_Staff_City varchar(20) default 'Schaumburg',
	Employee_Staff_State char(2) default 'IL',
	Employee_Staff_Zip_Code int default '60173'
);





























