-- Stored Procedures and Functions

use Library_SQL_Project;

go

if ((select COUNT(*) from information_schema.ROUTINES where ROUTINE_TYPE = 'PROCEDURE' and ROUTINE_CATALOG = 'Library_SQL_Project' and ROUTINE_NAME = 'L_Search_Media') = 1)
	drop proc L_Search_Media;

go

/* Search media from the database */
create proc L_Search_Media @title varchar(100), @author_last_name varchar(100), @year varchar(10), @format varchar(15)
as
begin

if @title = ''
	set @title = '%';
if @author_last_name = ''
	set @author_last_name = '%';
if @year = ''
	set @year = '%';

if ((@format LIKE 'Book') or (@format LIKE ''))
select b.Book_Media_ID, b.Book_ISBN_No, bd.Book_Details_Title, m.Media_Format, m.Media_Library_ID, m.Media_Status, l.Library_Name  from dbo.Book b, dbo.Book_Details bd, dbo.Media m, dbo.Library l where bd.Book_Details_ISBN_No = b.Book_ISBN_No and m.Media_ID = b.Book_Media_ID and m.Media_Library_ID = l.Library_ID and bd.Book_Details_Title LIKE '%'+@title+'%' and bd.Book_Details_Author_Last_Name LIKE '%'+@author_last_name+'%' and CAST(YEAR(bd.Book_Details_Published_Year) as varchar) LIKE '%'+@year+'%' and m.Media_Status != 'Damaged' and m.Media_Status != 'Lost';

if ((@format LIKE 'eBook') or (@format LIKE '')) 
select eb.eBook_Media_ID, eb.eBook_ISBN_No, ebd.eBook_Details_Title, m.Media_Format, m.Media_Library_ID, m.Media_Status, l.Library_Name  from dbo.eBook eb, dbo.eBook_Details ebd, dbo.Media m, dbo.Library l where ebd.eBook_Details_ISBN_No = eb.eBook_ISBN_No and m.Media_ID = eb.eBook_Media_ID and m.Media_Library_ID = l.Library_ID and ebd.eBook_Details_Title LIKE '%'+@title+'%' and ebd.eBook_Details_Author_Last_Name LIKE '%'+@author_last_name+'%' and CAST(YEAR(ebd.eBook_Details_Release_Date) as varchar) LIKE '%'+@year+'%' and m.Media_Status != 'Damaged' and m.Media_Status != 'Lost';

if ((@format LIKE 'Journal') or (@format LIKE ''))
select jrnl.Journal_Media_ID, jrnl.Journal_ISSN_No, jrnld.Journal_Details_Title, m.Media_Format, m.Media_Library_ID, m.Media_Status, l.Library_Name  from dbo.Journal jrnl, dbo.Journal_Details jrnld, dbo.Media m, dbo.Library l where jrnl.Journal_ISSN_No = jrnld.Journal_Details_ISSN_Number and m.Media_ID = jrnl.Journal_Media_ID and m.Media_Library_ID = l.Library_ID and jrnld.Journal_Details_Title LIKE '%'+@title+'%' and jrnld.Journal_Details_Author_Last_Name LIKE '%'+@author_last_name+'%' and CAST(YEAR(jrnld.Journal_Details_Published_Date) as varchar) LIKE '%'+@year+'%' and m.Media_Status != 'Damaged' and m.Media_Status != 'Lost';

if ((@format LIKE 'eJournal') or (@format LIKE '')) 
select ejrnl.eJournal_Media_ID, ejrnl.eJournal_ISSN_No, ejrnld.eJournal_Details_Title, m.Media_Format, m.Media_Library_ID, m.Media_Status, l.Library_Name  from dbo.eJournal ejrnl, dbo.eJournal_Details ejrnld, dbo.Media m, dbo.Library l where ejrnl.eJournal_ISSN_No = ejrnld.eJournal_Details_ISSN_Number and m.Media_ID = ejrnl.eJournal_Media_ID and m.Media_Library_ID = l.Library_ID and ejrnld.eJournal_Details_Title LIKE '%'+@title+'%' and ejrnld.eJournal_Details_Author_Last_Name LIKE '%'+@author_last_name+'%' and CAST(YEAR(ejrnld.eJournal_Details_Published_Date) as varchar) LIKE '%'+@year+'%' and m.Media_Status != 'Damaged' and m.Media_Status != 'Lost';

if ((@format LIKE 'CD') or (@format LIKE ''))
select cd.CD_Media_ID, cd.CD_Internal_ID, cdd.CD_Details_Title, m.Media_Format, m.Media_Library_ID, m.Media_Status, l.Library_Name  from dbo.CD cd, dbo.CD_Details cdd, dbo.Media m, dbo.Library l where cdd.CD_Details_Internal_ID = cd.CD_Internal_ID and m.Media_ID = cd.CD_Media_ID and m.Media_Library_ID = l.Library_ID and cdd.CD_Details_Title LIKE '%'+@title+'%' and cdd.CD_Details_Author_Last_Name LIKE '%'+@author_last_name+'%' and CAST(YEAR(cdd.CD_Details_Release_Date) as varchar) LIKE '%'+@year+'%' and m.Media_Status != 'Damaged' and m.Media_Status != 'Lost';

if ((@format LIKE 'DVD') or (@format LIKE '')) 
select dvd.DVD_Media_ID, dvd.DVD_ISBN_No, dvdd.DVD_Details_Title, m.Media_Format, m.Media_Library_ID, m.Media_Status, l.Library_Name  from dbo.DVD dvd, dbo.DVD_Details dvdd, dbo.Media m, dbo.Library l where dvd.DVD_ISBN_No = dvdd.DVD_Details_ISBN_No and m.Media_ID = dvd.DVD_Media_ID and m.Media_Library_ID = l.Library_ID and dvdd.DVD_Details_Title LIKE '%'+@title+'%' and dvdd.DVD_Details_Author_Last_Name LIKE '%'+@author_last_name+'%' and CAST(YEAR(dvdd.DVD_Details_Release_Date) as varchar) LIKE '%'+@year+'%' and m.Media_Status != 'Damaged' and m.Media_Status != 'Lost';

if ((@format LIKE 'Magazine') or (@format LIKE ''))
select mg.Magazine_Media_ID, mg.Magazine_Internal_ID, mgd.Magazine_Details_Name, m.Media_Format, m.Media_Library_ID, m.Media_Status, l.Library_Name  from dbo.Magazine mg, dbo.Magazine_Details mgd, dbo.Media m, dbo.Library l where mg.Magazine_Internal_ID = mgd.Magazine_Details_Internal_ID and m.Media_ID = mg.Magazine_Media_ID and m.Media_Library_ID = l.Library_ID and mgd.Magazine_Details_Name LIKE '%'+@title+'%' and CAST(YEAR(mgd.Magazine_Details_Published_Date) as varchar) LIKE '%'+@year+'%' and m.Media_Status != 'Damaged' and m.Media_Status != 'Lost';

if ((@format LIKE 'Digital Magazine') or (@format LIKE ''))
select dmg.Digital_Magazine_Media_ID, dmg.Digital_Magazine_Internal_ID, dmgd.Digital_Magazine_Name, m.Media_Format, m.Media_Library_ID, m.Media_Status, l.Library_Name  from dbo.Digital_Magazine dmg, dbo.Digital_Magazine_Details dmgd, dbo.Media m, dbo.Library l where dmg.Digital_Magazine_Internal_ID = dmgd.Digital_Magazine_Details_Internal_ID and m.Media_ID = dmg.Digital_Magazine_Media_ID and m.Media_Library_ID = l.Library_ID and dmgd.Digital_Magazine_Name LIKE '%'+@title+'%' and CAST(YEAR(dmgd.Digital_Magazine_Published_Date) as varchar) LIKE '%'+@year+'%' and m.Media_Status != 'Damaged' and m.Media_Status != 'Lost';

end; --This is end of L_Search_Media proc

go

execute L_Search_Media 'The','','', 'eJournal';

go 

if ((select COUNT(*) from information_schema.ROUTINES where ROUTINE_TYPE = 'PROCEDURE' and ROUTINE_CATALOG = 'Library_SQL_Project' and ROUTINE_NAME = 'L_Trigger_Media_Count') = 1)
	drop proc L_Trigger_Media_Count;

go

/* Trigger to display the total number of media in the library database */
create trigger L_Trigger_Media_Count
on Media
for insert, update, delete
as
declare @count int;

begin
select @count = COUNT(*) from Media;
print('Total number of Media in the library = ' + Cast(@count as varchar));
end;

go

/* Five queries using different joins, to determine the titles available in the Book, eBook, Journal, eJournal and Magazine tables but not present in Media table */

select b.Book_Media_ID, b.Book_ISBN_No, b.Book_Bought_Date, bd.Book_Details_Title, bd.Book_Details_Author_First_Name, bd.Book_Details_Author_Last_Name from dbo.Book b inner join dbo.Book_Details bd on b.Book_ISBN_No = bd.Book_Details_ISBN_No; 

select eb.eBook_Media_ID, eb.eBook_ISBN_No, eb.eBook_Bought_Date, ebd.eBook_Details_Title, ebd.eBook_Details_Author_First_Name, ebd.eBook_Details_Author_Last_Name from eBook eb full outer join eBook_Details ebd on eb.eBook_ISBN_No = ebd.eBook_Details_ISBN_No;

select j.Journal_Media_ID, j.Journal_ISSN_No, j.Journal_Bought_Date, jd.Journal_Details_Title, jd.Journal_Details_Author_First_Name, jd.Journal_Details_Author_Last_Name from Journal_Details jd left outer join Journal j on j.Journal_ISSN_No = jd.Journal_Details_ISSN_Number;

select ej.eJournal_Media_ID, ej.eJournal_Bought_Date, ejd.eJournal_Details_ISSN_Number, ejd.eJournal_Details_Title, ejd.eJournal_Details_Author_First_Name, ejd.eJournal_Details_Author_Last_Name from eJournal ej right outer join eJournal_Details ejd on ej.eJournal_ISSN_No = ejd.eJournal_Details_ISSN_Number;

select mg.Magazine_Media_ID, mg.Magazine_Bought_Date, mgd.Magazine_Details_Internal_ID, mgd.Magazine_Details_Name, mgd.Magazine_Details_Publisher, mgd.Magazine_Details_Volume_Num from Magazine mg right outer join Magazine_Details mgd on mg.Magazine_Internal_ID = mgd.Magazine_Details_Internal_ID where mg.Magazine_Internal_ID IS NULL;

select bk.Book_Media_ID, bk.Book_Bought_Date, bkd.Book_Details_ISBN_No, bkd.Book_Details_Title, bkd.Book_Details_Author_Last_Name, bkd.Book_Details_Published_Year from Book bk right outer join Book_Details bkd on bk.Book_ISBN_No = bkd.Book_Details_ISBN_No where bk.Book_ISBN_No IS NULL;

select jrnl.Journal_Media_ID, jrnl.Journal_Bought_Date, jrnld.Journal_Details_ISSN_Number, jrnld.Journal_Details_Title, jrnld.Journal_Details_Source, jrnld.Journal_Details_Volume from Journal jrnl right outer join Journal_Details jrnld on jrnl.Journal_ISSN_No = jrnld.Journal_Details_ISSN_Number where jrnl.Journal_ISSN_No IS NULL;

select cd.CD_Media_ID, cd.CD_Bought_Date, cdd.CD_Details_Internal_ID, cdd.CD_Details_Title, cdd.CD_Details_Publisher, cdd.CD_Details_Release_Date from CD cd right outer join CD_Details cdd on cd.CD_Internal_ID = cdd.CD_Details_Internal_ID where cd.CD_Internal_ID IS NULL;

select dvd.DVD_Media_ID, dvd.DVD_Bought_Date, dvdd.DVD_Details_ISBN_No, dvdd.DVD_Details_Title, dvdd.DVD_Details_Publisher, dvdd.DVD_Details_Release_Date from DVD dvd right outer join DVD_Details dvdd on dvd.DVD_ISBN_No = dvdd.DVD_Details_ISBN_No where dvd.DVD_ISBN_No IS NULL;

go 

if ((select COUNT(*) from information_schema.ROUTINES where ROUTINE_TYPE = 'PROCEDURE' and ROUTINE_CATALOG = 'Library_SQL_Project' and ROUTINE_NAME = 'L_Update_Member_Dues') = 1)
	drop proc L_Update_Member_Dues;

go

create proc L_Update_Member_Dues @payment_amount int, @member_id int, @change_amount int out
as
begin
	declare @payment_due int;
	select @payment_due=Library_Member_Dues from Library_Member where Library_Member_Id = @member_id;
	set @change_amount = 0;
	
	if(@payment_amount >= @payment_due)
	begin
		update Library_Member set Library_Member_Dues = 0 where Library_Member_Id = @member_id;
		set @change_amount = @payment_amount - @payment_due;
	end;
	else
	begin
		update Library_Member set Library_Member_Dues = (@payment_due - @payment_amount) where Library_Member_Id = @member_id;
	end;
	return @change_amount;
end;

go

if ((select COUNT(*) from information_schema.ROUTINES where ROUTINE_TYPE = 'PROCEDURE' and ROUTINE_CATALOG = 'Library_SQL_Project' and ROUTINE_NAME = 'L_Delete_Media') = 1)
	drop proc L_Delete_Media;

go

create proc L_Delete_Media @media_id int 
as
begin
	declare @media_fmt varchar(30);
	select @media_fmt = Media_Format from Media where Media_ID = @media_id;
	if(@media_fmt = 'Book')
		delete from Book where Book_Media_ID = @media_id;
	else if(@media_fmt = 'eBook')
		delete from eBook where eBook_Media_ID = @media_id;
	else if(@media_fmt = 'DVD')
		delete from DVD where DVD_Media_ID = @media_id;
	else if(@media_fmt = 'CD')
		delete from CD where CD_Media_ID = @media_id;
	else if(@media_fmt = 'Journal')
		delete from Journal where Journal_Media_ID = @media_id;
	else if(@media_fmt = 'eJournal')
		delete from eJournal where eJournal_Media_ID = @media_id;
	else if(@media_fmt = 'Magazine')
		delete from Magazine where Magazine_Media_ID = @media_id;
	else if(@media_fmt = 'Digital Magazine')
		delete from Digital_Magazine where Digital_Magazine_Media_ID = @media_id;
end;

go

