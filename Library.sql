create database Library_SQL;

use Library_SQL;

create table Library
(
	Library_ID int primary key,
	Library_Name varchar(100) not null,
	Library_Contact_Number varchar(15) not null,
	Library_Address varchar(100) not null,
	Library_City varchar(20) default 'Chicago',
	Library_State char(2) default 'IL',
	Library_ZipCode int default '60195',
	Library_Timings varchar(100) not null
);

create table Media
(
	Media_ID int primary key,
	Media_Library_ID int not null,
	Media_Format varchar not null, /*Book, eBook, Journal, eJournal, Magazine, Digital Magazine, DVD, CD*/
	Media_Status varchar[30], /* enum checked out, returned, on hold, on shelf, due, lost, damaged, past due */
	CONSTRAINT FK_Library_Table FOREIGN KEY(Media_Library_ID) REFERENCES Library(Library_ID)
);

create table Book_Details
(á
	Book_Details_ISBN_No int primary key,
	Book_Details_Published_Year int not null,
	Book_Details_Title varchar(100) not null,
	Book_Details_Author_First_Name varchar(30),
	Book_Details_Author_Last_Name varchar(30) not null,
	Book_Details_Language varchar(30),
	Book_Details_Rating á int,
	Book_Details_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */
);

create table Book
(
	Book_Media_ID int not null,
	Book_ISBN_No int not null,
	Book_Bought_Date date not null default CURRENT_TIMESTAMP,
	Book_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */,
	CONSTRAINT FK_Media_Book_Table FOREIGN KEY(Book_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_Book_Details_Table FOREIGN KEY(Book_ISBN_No) REFERENCES Book_Details(Book_Details_ISBN_No)
);

create table eBook_Details
( 
	eBook_Details_ISBN_No int primary key,
	eBook_Details_Release_Date date not null,
	eBook_Details_Title varchar(100) not null,
	eBook_Details_Author_First_Name varchar(30),
	eBook_Details_Author_Last_Name varchar(30) not null,
	eBook_Details_File_Size varchar(100),
	eBook_Details_File_Path varchar(100),
	eBook_Details_Duration time,
	eBook_Details_Language varchar(30),
	eBook_Details_Rating   int,
	eBook_Details_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */
);
 
create table eBook
(
	eBook_Media_ID int not null,
	eBook_ISBN_No int not null,
	eBook_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	eBook_Entry_Changed timestamp not null /*default CURRENT_TIMESTAMP*/, 
	CONSTRAINT FK_Media_eBook_Table FOREIGN KEY(eBook_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_eBook_Details_Table FOREIGN KEY(eBook_ISBN_No) REFERENCES eBook_Details(eBook_Details_ISBN_No)
);

create table Journal_Details
(
	Journal_Details_ISSN_Number int primary key,
	Journal_Details_Title varchar(100) not null,
	Journal_Details_Alternate_Title varchar(100),
	Journal_Details_Source varchar(100),
	Journal_Details_Published_Date date not null,
	Journal_Details_End_Date date not null,
	Journal_Details_Volume int,
	Journal_Details_Author_Last_Name varchar(30),
	Journal_Details_Author_First_Name varchar(30), 
	Journal_Details_Price int,
	Journal_Details_Entry_Changed timestamp not null /*default CURRENT_TIMESTAMP*/
);

create table Journal
(
	Journal_Media_ID int not null,
	Journal_ISSN_No int not null,
	Journal_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	Journal_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */, 
	CONSTRAINT FK_Media_Journal_Table FOREIGN KEY(Journal_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_Journal_Details_Table FOREIGN KEY(Journal_ISSN_No) REFERENCES Journal_Details(Journal_Details_ISSN_Number)
);

create table eJournal_Details
(
	eJournal_Details_ISSN_Number int primary key,
	eJournal_Details_Title varchar(100) not null,
	eJournal_Details_Alternate_Title varchar(100),
	eJournal_Details_Source varchar(100),
	eJournal_Details_Published_Date date not null,
	eJournal_Details_End_Date date not null,
	eJournal_Details_Volume int,
	eJournal_Details_Author_Last_Name varchar(30),
	eJournal_Details_Author_First_Name varchar(30) ,
	eJournal_Details_File_Size varchar(100),
	eJournal_Details_File_Path varchar(100),
	eJournal_Details_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */
);

create table eJournal
(
	eJournal_Media_ID int not null,
	eJournal_ISSN_No int not null,
	eJournal_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	eJournal_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */, 
	CONSTRAINT FK_Media_eJournal_Table FOREIGN KEY(eJournal_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_eJournal_Details_Table FOREIGN KEY(eJournal_ISSN_No) REFERENCES eJournal_Details(eJournal_Details_ISSN_Number)
);

create table Magazine_Details
(
	Magazine_Details_Internal_ID int primary key, /* Magazine is uniquely identified by Name, Volume, Issue */
	Magazine_Details_Name varchar(100) not null,
	Magazine_Details_Published_Date date not null,
	Magazine_Details_Volume_Num int not null,
	Magazine_Details_Issue_Num int not null,
	Magazine_Details_Publisher varchar(50),
	Magazine_Details_Genre varchar(30), /* This type should be enumeration or user datatype */
	Magazine_Details_Price int,
	Magazine_Details_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */
);

create table Magazine
(
	Magazine_Media_ID int not null,
	Magazine_Internal_ID int not null,
	Magazine_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	Magazine_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */, 
	CONSTRAINT FK_Media_Magazine_Table FOREIGN KEY(Magazine_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_Magazine_Details_Table FOREIGN KEY(Magazine_Internal_ID) REFERENCES Magazine_Details(Magazine_Details_Internal_ID)
);

create table Digital_Magazine_Details
(
	Digital_Magazine_Details_Internal_ID int primary key, /* Digital Magazine is uniquely identified by Name, Volume, Issue */
	Digital_Magazine_Name varchar(100) not null,
	Digital_Magazine_Published_Date date not null,
	Digital_Magazine_Volume_Num int,
	Digital_Magazine_Issue_Num int,
	Digital_Magazine_Publisher varchar(50),
	Digital_Magazine_Genre varchar(30), --This type should be enumeration or user datatype 
	Digital_Magazine_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */
);

create table Digital_Magazine
(
	Digital_Magazine_Media_ID int not null,
	Digital_Magazine_Internal_ID int not null,
	Digital_Magazine_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	Digital_Magazine_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */, 
	CONSTRAINT FK_Media_Digital_Magazine_Table FOREIGN KEY(Digital_Magazine_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_Digital_Magazine_Details_Table FOREIGN KEY(Digital_Magazine_Internal_ID) REFERENCES Digital_Magazine_Details(Digital_Magazine_Details_Internal_ID)
);

--DEFINE datatype_video_type ENUM('PAL','NTSC','SECAM');

create table DVD_Details
(
	DVD_Details_ISBN_No int primary key,
	DVD_Details_Title varchar(100),
	DVD_Details_Genre varchar(30), --This type should be enumeration or user datatype
	DVD_Details_Rating int,
	DVD_Details_Release_Date date not null,
	DVD_Details_Length time,
	DVD_Details_VideoType varchar(15), 
	DVD_Details_Language varchar(30),
	DVD_Details_Author_First_Name varchar(30),
	DVD_Details_Author_Last_Name varchar(30) not null,
	DVD_Details_Publisher varchar(50),
	DVD_Details_Summary varchar(100),
	DVD_Details_Price int,
	DVD_Details_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */  
);

create table DVD
(
	DVD_Media_ID int not null,
	DVD_ISBN_No int not null,
	DVD_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	DVD_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */, 
	CONSTRAINT FK_Media_DVD_Table FOREIGN KEY(DVD_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_DVD_Details_Table FOREIGN KEY(DVD_ISBN_No) REFERENCES DVD_Details(DVD_Details_ISBN_No)
);

create table CD_Details
(
	CD_Details_Internal_ID int primary key, /* CD is uniquely identified by Title, Date, Author */
	CD_Details_Title varchar(100),
	CD_Details_Genre varchar(50), --This type should be enumeration or user datatype
	CD_Details_Length time,
	CD_Details_Release_Date date not null,
	CD_Details_Language varchar(30),
	CD_Details_Author_First_Name varchar(30),
	CD_Details_Author_Last_Name varchar(30),
	CD_Details_Publisher varchar(50),
	CD_Details_Summary varchar(100),
	CD_Details_Price int,
	CD_Details_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */ 
);

create table CD
(
	CD_Media_ID int not null,
	CD_Internal_ID int not null,
	CD_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	CD_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */, 
	CONSTRAINT FK_Media_CD_Table FOREIGN KEY(CD_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_CD_Details_Table FOREIGN KEY(CD_Internal_ID) REFERENCES CD_Details(CD_Details_Internal_ID)
);

create table Library_Member
(
	Library_Member_ID int primary key,
	Library_Member_Library_ID int not null,
	Library_Member_Parent_ID int, --this refers to another row in Library Member table of Parent
	Library_Member_First_Name varchar(30),
	Library_Member_Last_Name varchar(30),
	Library_Member_DOB date not null,
	Library_Member_Address varchar(100),
	Library_Member_City varchar(20) default 'Schaumburg',
	Library_Member_State char(2) default 'IL',
	Library_Member_Zip_code int default '60173',
	CONSTRAINT FK_Library_Member_Table FOREIGN KEY(Library_Member_Library_ID) REFERENCES Library(Library_ID)
);

create table Employee_Staff
(
	Employee_Staff_ID int primary key,
	Employee_Staff_Library_ID int not null,	
	Employee_Staff_Designation varchar(30), /* This should be an enum */
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
	CONSTRAINT FK_Library_Employee_Table FOREIGN KEY(Employee_Staff_Library_ID) REFERENCES Library(Library_ID)
);

/* Check out transaction should update the Media_Status field in Media table 
Also check out transaction should first check if the media is on hold by another member.
If yes, then cannot check out */
create table Media_Check_Out
(
	Media_Check_Out_ID int primary key,
	Media_Check_Out_Member_ID int not null,
	Media_Check_Out_Media_ID int not null,
	Media_Check_Out_Date date not null,
	Media_Check_Out_Due_Date date not null,
	Media_Check_Out_Times_Renewed int default 0,
	CONSTRAINT FK_Media_Check_Out_Table FOREIGN KEY(Media_Check_Out_Member_ID) REFERENCES Library_Member(Library_Member_ID),
	CONSTRAINT FK_Media_Check_Out_Table FOREIGN KEY(Media_Check_Out_Media_ID) REFERENCES Media(Media_ID)
);

/* Check in transaction will delete row entries in Media_Check_Out & update status of Media_Status field in Media table and member fines if any */

/* Before putting media on hold status, should be checked such as lost, damaged, max check out no reached eg 3*/
create table Media_Hold
(
	Media_Hold_Media_ID int not null;
	Media_Hold_Member_ID int not null;
	CONSTRAINT FK_Media_Hold_Member_ID FOREIGN KEY(Media_Hold_Member_ID) REFERENCES Library_Member(Library_Member_ID),
	CONSTRAINT FK_Media_Hold_Media_ID FOREIGN KEY(Media_Hold_Media_ID) REFERENCES Media(Media_ID)
);

create table Supplier
(
Supplier_ID int primary key;
Supplier_Name varchar(30);
Serial_No int not null;
Estimated_Delivery datetime;
CONSTRAINT FK_Media_Hold_Member_ID FOREIGN KEY(Media_Hold_Member_ID) REFERENCES Library_Member(Library_Member_ID),
CONSTRAINT FK_Media_Hold_Media_ID FOREIGN KEY(Media_Hold_Media_ID) REFERENCES Media(Media_ID)
);

