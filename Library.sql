use tempdb;
drop database Library_SQL_Project;
create database Library_SQL_Project;

use Library_SQL_Project;

/* if exists( Select * from Library)
	 drop table Library; */

create table Library
(
	Library_ID int primary key,
	Library_Name varchar(100) not null,
	Library_Contact_Number varchar(15) not null,
	Library_Address varchar(100) not null,
	Library_City varchar(20) default 'Chicago',
	Library_State char(2) default 'IL',
	Library_ZipCode int default '60195',
	Library_Year_Opened int default 1950,
	Library_Timings varchar(200) not null
);

go

/* if exists( Select * from Media)
	drop table Media; */

create table Media
(
	Media_ID int primary key,
	Media_Library_ID int not null,
	Media_Format varchar(30) not null check(Media_Format in ('Book', 'eBook', 'Journal', 'eJournal', 'Magazine', 'Digital Magazine', 'DVD', 'CD')),
	Media_Status varchar(30) not null check(Media_Status in ('Checked out', 'Returned', 'On shelf', 'Due', 'Lost', 'Damaged')), /* 'Order placed', 'Waiting', 'Order key'. 'On hold' can be made for media that is in any status other than
	lost or damaged.*/
	CONSTRAINT FK_Library_Table FOREIGN KEY(Media_Library_ID) REFERENCES Library(Library_ID)
);

go

/* if exists( Select * from Book_Details)
	drop table Book_Details; */

create table Book_Details
( 
	Book_Details_ISBN_No int primary key,
	Book_Details_Published_Year int not null,
	Book_Details_Title varchar(100) not null,
	Book_Details_Author_First_Name varchar(30) default '',
	Book_Details_Author_Last_Name varchar(30) not null,
	Book_Details_Language varchar(30) default '',
	Book_Details_Rating int default '',
	Book_Details_Price int default '',
	Book_Details_Entry_Changed date not null default CURRENT_TIMESTAMP
);

go

/* if exists( Select * from Book)
	drop table Book; */

create table Book
(
	Book_Media_ID int primary key,
	Book_ISBN_No int not null,
	Book_Bought_Date date not null default CURRENT_TIMESTAMP,
	Book_Entry_Changed date not null default CURRENT_TIMESTAMP,
	CONSTRAINT FK_Media_Book_Table FOREIGN KEY(Book_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_Book_Details_Table FOREIGN KEY(Book_ISBN_No) REFERENCES Book_Details(Book_Details_ISBN_No),
	--CONSTRAINT Lib_Sem_Book_Bought_Date Check(Year(Book_Bought_Date) >= dbo.Book_Details.Book_Details_Published_Year)
);

go

/* if exists( Select * from eBook_Details)
	drop table eBook_Details; */

create table eBook_Details
( 
	eBook_Details_ISBN_No int primary key,
	eBook_Details_Release_Date date /* not null */,
	eBook_Details_Title varchar(100) not null,
	eBook_Details_Author_First_Name varchar(30) default '',
	eBook_Details_Author_Last_Name varchar(30) not null,
	eBook_Details_File_Size varchar(100) default '',--
	eBook_Details_File_Path varchar(100) default '',--
	eBook_Details_Language varchar(30) default '',
	eBook_Details_Rating   int default '',
	eBook_Details_Entry_Changed date not null default CURRENT_TIMESTAMP
);

go

/* if exists( Select * from eBook)
	drop table eBook; */

create table eBook
(
	eBook_Media_ID int primary key,
	eBook_ISBN_No int not null,
	eBook_Bought_Date date not null default CURRENT_TIMESTAMP,
	eBook_Entry_Changed date not null default CURRENT_TIMESTAMP, 
	CONSTRAINT FK_Media_eBook_Table FOREIGN KEY(eBook_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_eBook_Details_Table FOREIGN KEY(eBook_ISBN_No) REFERENCES eBook_Details(eBook_Details_ISBN_No)
);

go

/* if exists( Select * from Journal_Details)
	drop table Journal_Details; */

create table Journal_Details
(
	Journal_Details_ISSN_Number int primary key,
	Journal_Details_Title varchar(100) not null,
	Journal_Details_Alternate_Title varchar(100) default '',--
	Journal_Details_Source varchar(100) default '',
	Journal_Details_Published_Date date not null,
	Journal_Details_End_Date date default '',
	Journal_Details_Volume int default '',
	Journal_Details_Issue int default '',
	Journal_Details_Author_Last_Name varchar(30) default '',
	Journal_Details_Author_First_Name varchar(30) default '', 
	Journal_Details_Price int default '',
	Journal_Details_Entry_Changed date not null default CURRENT_TIMESTAMP
);

go

/* if exists(Select * from Journal)
	drop table Journal; */

create table Journal
(
	Journal_Media_ID int primary key,
	Journal_ISSN_No int not null,
	Journal_Bought_Date date not null default CURRENT_TIMESTAMP,
	Journal_Entry_Changed date not null default CURRENT_TIMESTAMP, 
	CONSTRAINT FK_Media_Journal_Table FOREIGN KEY(Journal_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_Journal_Details_Table FOREIGN KEY(Journal_ISSN_No) REFERENCES Journal_Details(Journal_Details_ISSN_Number)
);

go

/* if exists( Select * from eJournal_Details)
	drop table eJournal_Details; */

create table eJournal_Details
(
	eJournal_Details_ISSN_Number int primary key,
	eJournal_Details_Title varchar(100) not null,
	eJournal_Details_Alternate_Title varchar(100) default '',
	eJournal_Details_Source varchar(100) default '',
	eJournal_Details_Published_Date date not null,
	eJournal_Details_End_Date date default '',
	eJournal_Details_Volume int default '',
	eJournal_Details_Issue int default '',
	eJournal_Details_Author_Last_Name varchar(30) default '',
	eJournal_Details_Author_First_Name varchar(30) default '',
	eJournal_Details_File_Size varchar(100) default '',
	eJournal_Details_File_Path varchar(100) default '',
	eJournal_Details_Entry_Changed date not null default CURRENT_TIMESTAMP
);

go

/* if exists( Select * from eJournal)
	drop table eJournal; */

create table eJournal
(
	eJournal_Media_ID int primary key,
	eJournal_ISSN_No int not null,
	eJournal_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	eJournal_Entry_Changed date not null default CURRENT_TIMESTAMP, 
	CONSTRAINT FK_Media_eJournal_Table FOREIGN KEY(eJournal_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_eJournal_Details_Table FOREIGN KEY(eJournal_ISSN_No) REFERENCES eJournal_Details(eJournal_Details_ISSN_Number)
);

go

/* if exists( Select * from Magazine_Details)
	drop table Magazine_Details; */

create table Magazine_Details
(
	Magazine_Details_Internal_ID int primary key, /* Magazine is uniquely identified by Name, Volume, Issue */
	Magazine_Details_Name varchar(100) not null,
	Magazine_Details_Published_Date date not null,
	Magazine_Details_Volume_Num int not null,
	Magazine_Details_Issue_Num int not null,
	Magazine_Details_Publisher varchar(50) default '',
	Magazine_Details_Genre varchar(30) check(Magazine_Details_Genre IN ('Family', 'Food', 'World', 'Nature', 'Business', 'Automobiles', 'Finance')),
	Magazine_Details_Price int default '',
	Magazine_Details_Entry_Changed date not null default CURRENT_TIMESTAMP
);

go

/* if exists( Select * from Magazine)
	drop table Magazine; */

create table Magazine
(
	Magazine_Media_ID int primary key,
	Magazine_Internal_ID int not null,
	Magazine_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	Magazine_Entry_Changed date not null default CURRENT_TIMESTAMP, 
	CONSTRAINT FK_Media_Magazine_Table FOREIGN KEY(Magazine_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_Magazine_Details_Table FOREIGN KEY(Magazine_Internal_ID) REFERENCES Magazine_Details(Magazine_Details_Internal_ID)
);

go

/* if exists( Select * from Digital_Magazine_Details)
	drop table Digital_Magazine_Details; */

create table Digital_Magazine_Details
(
	Digital_Magazine_Details_Internal_ID int primary key, /* Digital Magazine is uniquely identified by Name, Volume, Issue */
	Digital_Magazine_Name varchar(100) not null,
	Digital_Magazine_Published_Date date not null,
	Digital_Magazine_Volume_Num int default '',
	Digital_Magazine_Issue_Num int default '',
	Digital_Magazine_Publisher varchar(50) default '',
	Digital_Magazine_Genre varchar(30) check(Digital_Magazine_Genre IN ('Family', 'Food', 'World', 'Nature', 'Business', 'Automobiles', 'Finance')),
	Digital_Magazine_File_Size varchar(100) default '',
	Digital_Magazine_File_Path varchar(100) default '',
	Digital_Magazine_Entry_Changed date not null default CURRENT_TIMESTAMP
);

go

/* if exists( Select * from Digital_Magazine)
	drop table Digital_Magazine; */

create table Digital_Magazine
(
	Digital_Magazine_Media_ID int primary key,
	Digital_Magazine_Internal_ID int not null,
	Digital_Magazine_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	Digital_Magazine_Entry_Changed date not null default CURRENT_TIMESTAMP, 
	CONSTRAINT FK_Media_Digital_Magazine_Table FOREIGN KEY(Digital_Magazine_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_Digital_Magazine_Details_Table FOREIGN KEY(Digital_Magazine_Internal_ID) REFERENCES Digital_Magazine_Details(Digital_Magazine_Details_Internal_ID)
);

go

/* if exists( Select * from DVD_Details)
	drop table DVD_Details; */

create table DVD_Details
(
	DVD_Details_ISBN_No int primary key,
	DVD_Details_Title varchar(100) default '',
	DVD_Details_Genre varchar(30), --This type should be enumeration or user datatype
	DVD_Details_Rating int default '',
	DVD_Details_Release_Date date not null,
	DVD_Details_Length time default '',
	DVD_Details_VideoType varchar(15) check(DVD_Details_VideoType in ('PAL','NTSC','SECAM')), 
	DVD_Details_Language varchar(30) default '',
	DVD_Details_Author_First_Name varchar(30) default '',
	DVD_Details_Author_Last_Name varchar(30) not null,
	DVD_Details_Publisher varchar(50) default '',
	DVD_Details_Summary varchar(100) default '',
	DVD_Details_Price int default '',
	DVD_Details_Entry_Changed date not null default CURRENT_TIMESTAMP  
);

go

/* if exists( Select * from DVD)
	drop table DVD; */

create table DVD
(
	DVD_Media_ID int primary key,
	DVD_ISBN_No int not null,
	DVD_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	DVD_Entry_Changed date not null default CURRENT_TIMESTAMP, 
	CONSTRAINT FK_Media_DVD_Table FOREIGN KEY(DVD_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_DVD_Details_Table FOREIGN KEY(DVD_ISBN_No) REFERENCES DVD_Details(DVD_Details_ISBN_No)
);

go

/* if exists( Select * from CD_Details)
	drop table CD_Details; */

create table CD_Details
(
	CD_Details_Internal_ID int primary key, /* CD is uniquely identified by Title, Date, Author */
	CD_Details_Title varchar(100) not null,
	CD_Details_Genre varchar(50) check (CD_Details_Genre IN ('Ballet, Music','Country music','Physician-patient relations','Children''s exercise, Children''s songs','Sitar, Raaga music','Fiction, Mystery','World Music','Juvenile fiction','Fiction, Firefighters','Music, Relaxation' )),
	CD_Details_Length time default '',
	CD_Details_Release_Date date not null,
	CD_Details_Language varchar(30) default '',
	CD_Details_Author_First_Name varchar(30) default '',
	CD_Details_Author_Last_Name varchar(30) default '',
	CD_Details_Publisher varchar(50) default '',
	CD_Details_Summary varchar(100) default '',
	CD_Details_Price int default '',
	CD_Details_Entry_Changed date not null default CURRENT_TIMESTAMP 
);

go

/* if exists( Select * from CD)
	drop table CD; */

create table CD
(
	CD_Media_ID int primary key,
	CD_Internal_ID int not null,
	CD_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	CD_Entry_Changed date not null default CURRENT_TIMESTAMP, 
	CONSTRAINT FK_Media_CD_Table FOREIGN KEY(CD_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_CD_Details_Table FOREIGN KEY(CD_Internal_ID) REFERENCES CD_Details(CD_Details_Internal_ID)
);

go

/* if exists( Select * from Library_Member)
	drop table Library_Member; */

create table Library_Member
(
	Library_Member_ID int primary key,
	Library_Member_Library_ID int not null,
	Library_Member_Parent_ID int default '', --this refers to another row in Library Member table of Parent
	Library_Member_First_Name varchar(30) default '',
	Library_Member_Last_Name varchar(30) not null,
	Library_Member_DOB date not null,
	Library_Member_Address varchar(100) not null,
	Library_Member_City varchar(20) default 'Mount Prospect',
	Library_Member_State char(2) default 'IL',
	Library_Member_Zip_code int default 60056,
	Library_Member_Dues int default 0,
	Library_Member_Since date default '10/6/2006',
	CONSTRAINT FK_Library_Member_Table FOREIGN KEY(Library_Member_Library_ID) REFERENCES Library(Library_ID)
);

go

/* if exists( Select * from Employee_Staff)
	drop table Employee_Staff; */

create table Employee_Staff
(
	Employee_Staff_ID int primary key,
	Employee_Staff_Library_Member_ID int not null,	
	Employee_Staff_Designation varchar(30) check(Employee_Staff_Designation in ('Manager','Librarian')),
	Employee_Staff_SSN int not null unique,
	Employee_Staff_Joining_Date date not null,
	Employee_Staff_Hours_Worked varchar(30)  not null,
	CONSTRAINT FK_Library_Employee_Table FOREIGN KEY(Employee_Staff_Library_Member_ID) REFERENCES Library_Member(Library_Member_ID)
);

go

create table Login_Table
(
	Login_ID int primary key,
	Login_Name varchar(35) not null,
	Login_UserName varchar(15) not null unique,
	Login_Password varchar(15) not null,
	Login_DateTime datetime default '',
	LogOut_DateTime datetime default '',
	Login_Library_Member_ID int not null,
	CONSTRAINT FK_Login_Details FOREIGN KEY(Login_Library_Member_ID) references Library_Member(Library_Member_ID)
);

go

/* Check out transaction should update the Media_Status field in Media table 
Also check out transaction should first check if the media is on hold by another member.
If yes, then cannot check out */

/* if exists( Select * from Media_Check_Out)
	drop table Media_Check_Out; */

create table Media_Check_Out
(
	Media_Check_Out_ID int primary key,
	Media_Check_Out_Member_ID int not null,
	Media_Check_Out_Media_ID int not null,
	Media_Check_Out_Date date not null,
	Media_Check_Out_Due_Date date not null,
	Media_Check_Out_Times_Renewed int default 0,
	Media_Check_Out_Member_Dues_Updated varchar(3) default 'No' CHECK(Media_Check_Out_Member_Dues_Updated in ('Yes', 'No')),
	CONSTRAINT FK_Media_Check_Out_Table_1 FOREIGN KEY(Media_Check_Out_Member_ID) REFERENCES Library_Member(Library_Member_ID),
	CONSTRAINT FK_Media_Check_Out_Table_2 FOREIGN KEY(Media_Check_Out_Media_ID) REFERENCES Media(Media_ID)
);

go

/* Check in transaction will delete row entries in Media_Check_Out & update status of Media_Status field in Media table and member fines if any */

/* if exists( Select * from Media_Hold)
	drop table Media_Hold; */

create table Media_Hold
(
	Media_Hold_Queue_No int not null,
	Media_Hold_Media_ID int not null,
	Media_Hold_Member_ID int not null,
	CONSTRAINT FK_Media_Hold_Member_ID FOREIGN KEY(Media_Hold_Member_ID) REFERENCES Library_Member(Library_Member_ID),
	CONSTRAINT FK_Media_Hold_Media_ID FOREIGN KEY(Media_Hold_Media_ID) REFERENCES Media(Media_ID)
);

go

/* if exists( Select * from Supplier)
	drop table Supplier;
*/
create table Supplier
(
	Supplier_ID int primary key,
	Supplier_Name varchar(100),
	Supplier_Address varchar(100),
	Supplier_City varchar(20) default 'Schaumburg',
	Supplier_State char(2) default 'IL',
	Supplier_Zip_code int default '60173',
	Supplier_Phone_No varchar(10),
	Supplier_Payment_Due int
);

/* if exists( Select * from Supplier_Media_Info)
	drop table Supplier_Media_Info;
*/

/* This table consists of entries of media supplied by the supplier */
create table Supplier_Media_Info
(
	Supplier_Media_Info_Line_No int primary key,
	Supplier_Media_Info_Media_ID int,
	Supplier_Media_Info_Supplier_ID int,
	CONSTRAINT FK_Supplier_Media_1 FOREIGN KEY(Supplier_Media_Info_Media_ID) REFERENCES Media(Media_ID), 
	CONSTRAINT FK_Supplier_Media_2 FOREIGN KEY(Supplier_Media_Info_Supplier_ID) REFERENCES Supplier(Supplier_ID) 
);

/* if exists( Select * from Orders)
	drop table Orders;
*/

create table Orders
(
	Orders_ID int primary key,
	Orders_Supplier_ID int,
	Orders_Date_Ordered date not null default CURRENT_TIMESTAMP,
	Orders_Date_Required date not null,
	Orders_Status varchar(20), /* Accepted, Pending, Cancelled, Not available, Partially Delivered, Delivered, Payment Due, Paid */
	Orders_Payment_Amount int default 0, /* Will be updated once order is delivered depending on the quantity or delivered items */
	CONSTRAINT FK_Orders_Supplier FOREIGN KEY(Orders_Supplier_ID) REFERENCES Supplier(Supplier_ID) 
);

/* if exists( Select * from Orders_Details)
	drop table Orders_Details;
*/
create table Orders_Details
(
	Orders_Details_Line_No int primary key,
	Orders_Details_Orders_ID int not null, 
	Orders_Details_Media_ID int not null,
	Orders_Details_Quantity int not null,
	Orders_Details_Status varchar(20), /* Accepted, Pending, Cancelled, Not available, Partially Delivered, Delivered, Payment Due, Paid */
	Orders_Details_Date_Delivered date,
	CONSTRAINT FK_Orders_Details_Orders FOREIGN KEY(Orders_Details_Orders_ID) REFERENCES Orders(Orders_ID),
	CONSTRAINT FK_Orders_Details_Media FOREIGN KEY(Orders_Details_Media_ID) REFERENCES Media(Media_ID)
);



