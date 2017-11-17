create table Book
( 
  Book_ID int primary key,
  Book_Isbn_No int not null,
  Book_Published_Year int not null,
  Book_Title varchar(100) not null,
  Book_Author_First_Name varchar(100),
  Book_Author_Last_Name varchar(100) not null,
  Book_Language varchar(50),
  Book_Rating   varchar(50),
  Book_Price    int,
  Book_Bought_Date DATE  not null,
  Book_Entry_Changed TIMESTAMP not null  
)

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
  eBook_Rating   varchar(50),
  eBook_Bought_Date DATE  not null,
  eBook_Entry_Changed TIMESTAMP not null  
)

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
)

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
)


