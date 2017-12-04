use Library_SQL_Project;

go

drop database Library_SQL_Project_Imported;

go

create database Library_SQL_Project_Imported;

go

Use Library_SQL_Project_Imported;

go

:r "C:\Data\Library_SQL_Project_2017\Library.sql"

go

SET NOCOUNT OFF

BULK INSERT Library_SQL_Project_Imported.dbo.Library FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\Library.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\Library-c.fmt',
	  FIELDTERMINATOR = '|'
);

go

select * from Library;

go

BULK INSERT Library_SQL_Project_Imported.dbo.Media FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\Media.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\Media-c.fmt'
);

go

select * from Media;

go

BULK INSERT Library_SQL_Project_Imported.dbo.Book_Details FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\Book_Details.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\Book_Details-c.fmt',
	  KEEPNULLS 
);

go

select * from Book_Details;

go

BULK INSERT Library_SQL_Project_Imported.dbo.Book FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\Book.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\Book-c.fmt'
);

go

select * from Book;

go

BULK INSERT Library_SQL_Project_Imported.dbo.eBook_Details FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\eBook_Details.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\eBook_Details-c.fmt'
);

go

select * from eBook_Details;

go

BULK INSERT Library_SQL_Project_Imported.dbo.eBook FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\eBook.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\eBook-c.fmt'
);

go

select * from eBook;

go

BULK INSERT Library_SQL_Project_Imported.dbo.Journal_Details FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\Journal_Details.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\Journal_Details-c.fmt'
);

go

select * from Journal_Details;

go

BULK INSERT Library_SQL_Project_Imported.dbo.Journal FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\Journal.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\Journal-c.fmt'
);

go

select * from Journal;

go

BULK INSERT Library_SQL_Project_Imported.dbo.eJournal_Details FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\eJournal_Details.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\eJournal_Details-c.fmt'
);

go

select * from eJournal_Details;

go

BULK INSERT Library_SQL_Project_Imported.dbo.eJournal FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\eJournal.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\eJournal-c.fmt'
);

go

select * from eJournal;

go

BULK INSERT Library_SQL_Project_Imported.dbo.Magazine_Details FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\Magazine_Details.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\Magazine_Details-c.fmt'
);

go

select * from Magazine_Details;

go

BULK INSERT Library_SQL_Project_Imported.dbo.Magazine FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\Magazine.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\Magazine-c.fmt'
);

go

select * from Magazine;

go

BULK INSERT Library_SQL_Project_Imported.dbo.Digital_Magazine_Details FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\Digital_Magazine_Details.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\Digital_Magazine_Details-c.fmt'
);

go

select * from Digital_Magazine_Details;

go

BULK INSERT Library_SQL_Project_Imported.dbo.Digital_Magazine FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\Digital_Magazine.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\Digital_Magazine-c.fmt'
);

go

select * from Digital_Magazine;

go

BULK INSERT Library_SQL_Project_Imported.dbo.DVD_Details FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\DVD_Details.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\DVD_Details-c.fmt'
);

go

select * from DVD_Details;

go

BULK INSERT Library_SQL_Project_Imported.dbo.DVD FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\DVD.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\DVD-c.fmt'
);

go

select * from DVD;

go

BULK INSERT Library_SQL_Project_Imported.dbo.CD_Details FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\CD_Details.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\CD_Details-c.fmt'
);

go

select * from CD_Details;

go

BULK INSERT Library_SQL_Project_Imported.dbo.CD FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\CD.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\CD-c.fmt'
);

go

select * from CD;

go

BULK INSERT Library_SQL_Project_Imported.dbo.Library_Member FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\Library_Member.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\Library_Member-c.fmt'
);

go

select * from Library_Member;

go

BULK INSERT Library_SQL_Project_Imported.dbo.Employee_Staff FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\Employee_Staff.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\Employee_Staff-c.fmt'
);

go

select * from Employee_Staff;

go

BULK INSERT Library_SQL_Project_Imported.dbo.Login_Table FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\Login_Table.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\Login_Table-c.fmt'
);

go

select * from Login_Table;

go

BULK INSERT Library_SQL_Project_Imported.dbo.Media_Check_Out FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\Media_Check_Out.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\Media_Check_Out-c.fmt'
);

go

select * from Media_Check_Out;

go

BULK INSERT Library_SQL_Project_Imported.dbo.Media_Hold FROM "C:\Data\Library_SQL_Project_2017\Exported_Data\Media_Hold.txt"
   WITH (
      DATAFILETYPE = 'char',
	  FORMATFILE = 'C:\Data\Library_SQL_Project_2017\Exported_Data\Media_Hold-c.fmt'
);

go

select * from Media_Hold;

go
