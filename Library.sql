create database Library;

use library;

create table Library
(
Library_Name varchar(30) primary key,
Library_ID_Number int not null,
Director_Name varchar(30) not null,
Contact_Number nvarchar(15) not null,
Address varchar(100) not null,
City varchar(20) default 'Chicago',
State char(2) default 'IL',
ZipCode int default '60195',
Timings varchar (100) not null
);
select * from Library;

create table Book
( 
Book_ID int primary key,
Book_Isbn_No int not null,
Book_Published_Year int not null,
Book_Title varchar(100) not null,
Book_Author_First_Name varchar(100),
Book_Author_Last_Name varchar(100) not null,
Book_Language varchar(50),
Book_Rating varchar(50),
Book_Price int,
Book_Bought_Date DATE not null,
Book_Entry_Changed TIMESTAMP not null
);

create table eBook
(
eBook_ID int primary key,
eBook_Isbn_No int not null,
eBook_Release_Date DATE not null,
eBook_Title varchar(100) not null,
eBook_Author_First_Name varchar(100),
eBook_Author_Last_Name varchar(100) not null,
eBook_File_Size varchar(100),
eBook_File_Path varchar(100),
eBook_Duration TIME,
eBook_Language varchar(50),
eBook_Rating varchar(50),
eBook_Bought_Date DATE not null,
eBook_Entry_Changed TIMESTAMP not null
);

create table Journal
(
Jouranl_Title varchar(50) not null,
Journal_Alternate_Title varchar(50),
Journal_ID int primary key,
Journal_Source varchar(100),
Journal_ISSN_Number int not null,
Journal_Published_Date date not null,
Journal_End_Date date not null,
Journal_Volume varchar(30),
Journal_Author_Last_Name varchar(30),
Journal_Author_First_Name varchar(30) 
);

create table eJournal
(
eJouranl_Title varchar(50) not null,
eJournal_Alternate_Title varchar(50),
eJournal_ID int primary key,
eJournal_Source varchar(100),
eJournal_ISSN_Number int not null,
eJournal_Published_Date date not null,
eJournal_End_Date date not null,
eJournal_Volume varchar(30),
eJournal_Author_Last_Name varchar(30),
eJournal_Author_First_Name varchar(30) ,
eJournal_File_Size varchar(100),
eJournal_File_Path varchar(100),
eJournal_Bought_Date timestamp not null default CURRENT_TIMESTAMP,
eJournal_Entry_Changed timestamp not null default CURRENT_TIMESTAMP
);

create table Library_Member
(
Library_ID int primary key,
First_Name varchar(30),
Last_Name varchar(30),
Lib_Mem_DOB date not null,
Address varchar(100),
City varchar(20) default 'Schaumburg',
State char(2) default 'IL',
Zip_code int default '60173'
);
drop table  Library_Member; 

create table Employee_Staff
(
Employee_ID int primary key,
Employee_SSN int not null,
Employee_Joining_Date int not null,
Hours_Worked varchar(30)  not null,
Employee_Name varchar(50),
Address varchar(100),
City varchar(20) default 'Schaumburg',
State char(2) default 'IL',
Zip_Code int default '60173'
);

create table DVD
(
DVD_ID int primary key,
DVD_Isbn_no int not null,
DVD_Release_Date DATE not null,
DVD_Title varchar(100),
DVD_Genre nchar(50),
DVD_Rating varchar(50),
DVD_Length varchar(50),
DVD_VideoType varchar(50),
DVD_Language varchar(50),
DVD_Author varchar(50),
DVD_Publisher varchar(50),
DVD_Summary varchar(100),
DVD_Bought_Date DATE,
DVD_Entry_Changed TIMESTAMP not null
);

create table CD
(
CD_ID int primary key,
CD_Release_Date DATE not null,
CD_Title varchar(100),
CD_Genre varchar(50),
CD_Length varchar(50),
CD_Language varchar(50),
CD_Author varchar(50),
CD_Publisher varchar(50),
CD_Summary varchar(100),
CD_Bought_Date DATE,
CD_Entry_Changed TIMESTAMP not null
);






















