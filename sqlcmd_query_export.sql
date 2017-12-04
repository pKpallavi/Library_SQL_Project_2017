:connect DESKTOP-6NDUR2E\SQLEXPRESS

--:SETVAR SQLCMDCOLSEP ","
--:SETVAR SQLCMDHEADERS "-1"

SET NOCOUNT ON

Use Library_SQL_Project

go

--SET QUOTED_IDENTIFIER ON 

--:SETVAR SQLCMDCOLSEP ","
--:SETVAR SQLCMDHEADERS "-1"

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\Library.txt"

select * from Library;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\Media.txt"

select * from Media;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\Book_Details.txt"

select * from Book_Details;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\Book.txt"

select * from Book;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\eBook_Details.txt"

select * from eBook_Details;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\eBook.txt"

select * from eBook;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\Journal_Details.txt"

select * from Journal_Details;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\Journal.txt"

select * from Journal;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\eJournal_Details.txt"

select * from eJournal_Details;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\eJournal.txt"

select * from eJournal;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\Magazine_Details.txt"

select * from Magazine_Details;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\Magazine.txt"

select * from Magazine;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\Digital_Magazine_Details.txt"

select * from Digital_Magazine_Details;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\Digital_Magazine.txt"

select * from Digital_Magazine;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\DVD_Details.txt"

select * from DVD_Details;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\DVD.txt"

select * from DVD;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\CD_Details.txt"

select * from CD_Details;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\CD.txt"

select * from CD;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\Library_Member.txt"

select * from Library_Member;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\Employee_Staff.txt"

select * from Employee_Staff;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\Login_Table.txt"

select * from Login_Table;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\Media_Check_Out.txt"

select * from Media_Check_Out;

go

:Out "C:\Data\Library_SQL_Project_2017\Exported_Data\Media_Hold.txt"

select * from Media_Hold;

go

