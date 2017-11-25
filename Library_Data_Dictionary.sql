USE Library_SQL_Project;

--Displays details of Tables
exec Library_SQL_Project.sys.sp_help Library;
exec Library_SQL_Project.sys.sp_help Media;
exec Library_SQL_Project.sys.sp_help Book_Details;
exec Library_SQL_Project.sys.sp_help Book;
exec Library_SQL_Project.sys.sp_help eBook_Details;
exec Library_SQL_Project.sys.sp_help eBook;
exec Library_SQL_Project.sys.sp_help Journal_Details;
exec Library_SQL_Project.sys.sp_help Journal;
exec Library_SQL_Project.sys.sp_help eJournal_Details;
exec Library_SQL_Project.sys.sp_help eJournal;
exec Library_SQL_Project.sys.sp_help Magazine_Details;
exec Library_SQL_Project.sys.sp_help Magazine;
exec Library_SQL_Project.sys.sp_help Digital_Magazine_Details;
exec Library_SQL_Project.sys.sp_help Digital_Magazine;
exec Library_SQL_Project.sys.sp_help DVD_Details;
exec Library_SQL_Project.sys.sp_help DVD;
exec Library_SQL_Project.sys.sp_help CD_Details;
exec Library_SQL_Project.sys.sp_help CD;
exec Library_SQL_Project.sys.sp_help Library_Member;
exec Library_SQL_Project.sys.sp_help Employee_Staff;
exec Library_SQL_Project.sys.sp_help Login_Table;
exec Library_SQL_Project.sys.sp_help Media_Check_Out;
exec Library_SQL_Project.sys.sp_help Media_Hold;
exec Library_SQL_Project.sys.sp_help Supplier;
exec Library_SQL_Project.sys.sp_help Supplier_Media_Info;
exec Library_SQL_Project.sys.sp_help Orders;
exec Library_SQL_Project.sys.sp_help Orders_Details;

--
exec sys.sp_tables;

--
select * from sys.tables;

--Shows the functional dependency of this procedure on other objects
exec sp_depends L_Search_Media;
exec sp_depends L_Insert_Media_Table;
exec sp_depends L_Insert_Book_Details_Table;
exec sp_depends L_Insert_Book_Table;
exec sp_depends L_Insert_eBook_Details_Table;
exec sp_depends L_Insert_eBook_Table;
exec sp_depends L_Insert_Journal_Details_Table;
exec sp_depends L_Insert_Journal_Table;
exec sp_depends L_Insert_eJournal_Details_Table;
exec sp_depends L_Insert_eJournal_Table;
exec sp_depends L_Insert_Magazine_Details_Table;
exec sp_depends L_Insert_Magazine_Table;
exec sp_depends L_Insert_Digital_Magazine_Details_Table;
exec sp_depends L_Insert_Digital_Magazine_Table;
exec sp_depends L_Insert_DVD_Details;
exec sp_depends L_Insert_DVD_Table;
exec sp_depends L_Insert_CD_Details;
exec sp_depends L_Insert_CD_Table;
exec sp_depends L_Insert_Library_Member;
exec sp_depends L_Update_Library_Member;
exec sp_depends L_Insert_Employee_Staff;
exec sp_depends L_Insert_Login_Table;
exec sp_depends L_Insert_Update_Media_Check_Out;
exec sp_depends L_Media_Check_In;
exec sp_depends L_Insert_Media_Hold;

SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, COLUMN_DEFAULT  
FROM Library_SQL_Project.INFORMATION_SCHEMA.COLUMNS;  
GO  

select * from sys.check_constraints;
select * from Library_SQL_Project.sys.all_columns order by name;

select * from Library_SQL_Project.INFORMATION_SCHEMA.ROUTINES;
select * from INFORMATION_SCHEMA.ROUTINES where ROUTINE_TYPE = 'Procedure';

--Get stored procedures and functions
select name, type from dbo.sysobjects where type in (
	'P', --stored procedures
	'FN', --scalar functions
	'IF', --inline table-valued functions
	'TF'  --table-valued functions
)order by type, name;
