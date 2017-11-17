-- Stored Procedures and Functions

use Library_SQL_Project;

/* Search media from the database */
--drop proc L_Search_Media;

go

create proc L_Search_Media @title varchar(100), @author_last_name varchar(100), @year varchar(10), @format varchar(15)
as
begin
/* We need an efficient way to search for Media. The below inner join query with sub query will result in need of a cursor to 
look again for Book details with the same ISBN number */
/* select m.Media_ID, m.Media_Library_ID, m.Media_Format, m.Media_Status from dbo.Media m, dbo.Book b where m.Media_ID = b.Book_Media_ID and b.Book_ISBN_No in
	(select Book_Details_ISBN_No from dbo.Book_Details where dbo.Book_Details.Book_Details_Title LIKE '%'+@title+'%');
*/
--declare @temp_book_details table dbo.Book_Details;

declare @temp_format as varchar(20);

if @title = ''
	set @title = '%';
if @author_last_name = ''
	set @author_last_name = '%';
if @year = ''
	set @year = '%';

if @format = ''
	set @temp_format = 'Book';
else 
	set @temp_format = @format;

if @temp_format LIKE 'Book'
select b.Book_Media_ID, b.Book_ISBN_No, bd.Book_Details_Title, m.Media_Format, m.Media_Library_ID, m.Media_Status, l.Library_Name  from dbo.Book b, dbo.Book_Details bd, dbo.Media m, dbo.Library l where bd.Book_Details_ISBN_No = b.Book_ISBN_No and m.Media_ID = b.Book_Media_ID and m.Media_Library_ID = l.Library_ID and bd.Book_Details_Title LIKE '%'+@title+'%' and bd.Book_Details_Author_Last_Name LIKE '%'+@author_last_name+'%' and CAST(YEAR(bd.Book_Details_Published_Year) as varchar) LIKE '%'+@year+'%' and m.Media_Status != 'Damaged' and m.Media_Status != 'Lost';

if @format = ''
	set @temp_format = 'eBook';

if @temp_format LIKE 'eBook'
select eb.eBook_Media_ID, eb.eBook_ISBN_No, ebd.eBook_Details_Title, m.Media_Format, m.Media_Library_ID, m.Media_Status, l.Library_Name  from dbo.eBook eb, dbo.eBook_Details ebd, dbo.Media m, dbo.Library l where ebd.eBook_Details_ISBN_No = eb.eBook_ISBN_No and m.Media_ID = eb.eBook_Media_ID and m.Media_Library_ID = l.Library_ID and ebd.eBook_Details_Title LIKE '%'+@title+'%' and ebd.eBook_Details_Author_Last_Name LIKE '%'+@author_last_name+'%' and CAST(YEAR(ebd.eBook_Details_Release_Date) as varchar) LIKE '%'+@year+'%' and m.Media_Status != 'Damaged' and m.Media_Status != 'Lost';

if @format = ''
	set @temp_format = 'Journal';

if @temp_format LIKE 'Journal'
select jrnl.Journal_Media_ID, jrnl.Journal_ISSN_No, jrnld.Journal_Details_Title, m.Media_Format, m.Media_Library_ID, m.Media_Status, l.Library_Name  from dbo.Journal jrnl, dbo.Journal_Details jrnld, dbo.Media m, dbo.Library l where jrnl.Journal_ISSN_No = jrnld.Journal_Details_ISSN_Number and m.Media_ID = jrnl.Journal_Media_ID and m.Media_Library_ID = l.Library_ID and jrnld.Journal_Details_Title LIKE '%'+@title+'%' and jrnld.Journal_Details_Author_Last_Name LIKE '%'+@author_last_name+'%' and CAST(YEAR(jrnld.Journal_Details_Published_Date) as varchar) LIKE '%'+@year+'%' and m.Media_Status != 'Damaged' and m.Media_Status != 'Lost';

if @format = ''
	set @temp_format = 'eJournal';

if @temp_format LIKE 'eJournal'
select ejrnl.eJournal_Media_ID, ejrnl.eJournal_ISSN_No, ejrnld.eJournal_Details_Title, m.Media_Format, m.Media_Library_ID, m.Media_Status, l.Library_Name  from dbo.eJournal ejrnl, dbo.eJournal_Details ejrnld, dbo.Media m, dbo.Library l where ejrnl.eJournal_ISSN_No = ejrnld.eJournal_Details_ISSN_Number and m.Media_ID = ejrnl.eJournal_Media_ID and m.Media_Library_ID = l.Library_ID and ejrnld.eJournal_Details_Title LIKE '%'+@title+'%' and ejrnld.eJournal_Details_Author_Last_Name LIKE '%'+@author_last_name+'%' and CAST(YEAR(ejrnld.eJournal_Details_Published_Date) as varchar) LIKE '%'+@year+'%' and m.Media_Status != 'Damaged' and m.Media_Status != 'Lost';

if @format = ''
	set @temp_format = 'CD';

if @temp_format LIKE 'CD'
select cd.CD_Media_ID, cd.CD_Internal_ID, cdd.CD_Details_Title, m.Media_Format, m.Media_Library_ID, m.Media_Status, l.Library_Name  from dbo.CD cd, dbo.CD_Details cdd, dbo.Media m, dbo.Library l where cdd.CD_Details_Internal_ID = cd.CD_Internal_ID and m.Media_ID = cd.CD_Media_ID and m.Media_Library_ID = l.Library_ID and cdd.CD_Details_Title LIKE '%'+@title+'%' and cdd.CD_Details_Author_Last_Name LIKE '%'+@author_last_name+'%' and CAST(YEAR(cdd.CD_Details_Release_Date) as varchar) LIKE '%'+@year+'%' and m.Media_Status != 'Damaged' and m.Media_Status != 'Lost';

if @format = ''
	set @temp_format = 'DVD';

if @temp_format LIKE 'DVD'
select dvd.DVD_Media_ID, dvd.DVD_ISBN_No, dvdd.DVD_Details_Title, m.Media_Format, m.Media_Library_ID, m.Media_Status, l.Library_Name  from dbo.DVD dvd, dbo.DVD_Details dvdd, dbo.Media m, dbo.Library l where dvd.DVD_ISBN_No = dvdd.DVD_Details_ISBN_No and m.Media_ID = dvd.DVD_Media_ID and m.Media_Library_ID = l.Library_ID and dvdd.DVD_Details_Title LIKE '%'+@title+'%' and dvdd.DVD_Details_Author_Last_Name LIKE '%'+@author_last_name+'%' and CAST(YEAR(dvdd.DVD_Details_Release_Date) as varchar) LIKE '%'+@year+'%' and m.Media_Status != 'Damaged' and m.Media_Status != 'Lost';

if @format = ''
	set @temp_format = 'Magazine';

if @temp_format LIKE 'Magazine'
select mg.Magazine_Media_ID, mg.Magazine_Internal_ID, mgd.Magazine_Details_Name, m.Media_Format, m.Media_Library_ID, m.Media_Status, l.Library_Name  from dbo.Magazine mg, dbo.Magazine_Details mgd, dbo.Media m, dbo.Library l where mg.Magazine_Internal_ID = mgd.Magazine_Details_Internal_ID and m.Media_ID = mg.Magazine_Media_ID and m.Media_Library_ID = l.Library_ID and mgd.Magazine_Details_Name LIKE '%'+@title+'%' and CAST(YEAR(mgd.Magazine_Details_Published_Date) as varchar) LIKE '%'+@year+'%' and m.Media_Status != 'Damaged' and m.Media_Status != 'Lost';

if @format = ''
	set @temp_format = 'Digital Magazine';

if @temp_format LIKE 'Digital Magazine'
select dmg.Digital_Magazine_Media_ID, dmg.Digital_Magazine_Internal_ID, dmgd.Digital_Magazine_Name, m.Media_Format, m.Media_Library_ID, m.Media_Status, l.Library_Name  from dbo.Digital_Magazine dmg, dbo.Digital_Magazine_Details dmgd, dbo.Media m, dbo.Library l where dmg.Digital_Magazine_Internal_ID = dmgd.Digital_Magazine_Details_Internal_ID and m.Media_ID = dmg.Digital_Magazine_Media_ID and m.Media_Library_ID = l.Library_ID and dmgd.Digital_Magazine_Name LIKE '%'+@title+'%' and CAST(YEAR(dmgd.Digital_Magazine_Published_Date) as varchar) LIKE '%'+@year+'%' and m.Media_Status != 'Damaged' and m.Media_Status != 'Lost';


--select b.Book_Media_ID, b.Book_ISBN_No, bd.Book_Details_Title from dbo.Book b, dbo.Book_Details bd where bd.Book_Details_Title LIKE '%'+'Java'+'%';

--select * from Book, Book_Details;

/*
declare @var_int int, @var_char_100 varchar(100);

declare book_details_cursor cursor for 
	select Book_Details_ISBN_No, Book_Details_Title from dbo.Book_Details where 
		dbo.Book_Details.Book_Details_Title LIKE '%'+@title+'%';

--select top 0 * into #temp_book_details from dbo.Book_Details;

open book_details_cursor;
fetch next from book_details_cursor into @var_int, @var_char_100;

while @@FETCH_STATUS = 0
	begin
		--select @var_int, @var_char_100;
		select @var_int as 'Book ISBN No', @var_char_100 as 'Book Title', m.Media_ID as 'Media ID', 
			m.Media_Library_ID as 'Library ID', m.Media_Format as 'Format', m.Media_Status as 'Status'
			from dbo.Media m, dbo.Book b 
			where m.Media_ID = b.Book_Media_ID and b.Book_ISBN_No = @var_int;
		fetch next from book_details_cursor into @var_int, @var_char_100;
	end

close book_details_cursor;
deallocate book_details_cursor;

declare ebook_details_cursor cursor for 
	select eBook_Details_ISBN_No, eBook_Details_Title from dbo.eBook_Details where 
		dbo.eBook_Details.eBook_Details_Title LIKE '%'+@title+'%';

open ebook_details_cursor;
fetch next from ebook_details_cursor into @var_int, @var_char_100;

while @@FETCH_STATUS = 0
	begin
		--select @var_int, @var_char_100;
		select @var_int as eBook_Details_ISBN_No, @var_char_100 as eBook_Details_Title, m.Media_ID, m.Media_Library_ID, 
			m.Media_Format, m.Media_Status 
			from dbo.Media m, dbo.eBook b 
			where m.Media_ID = b.eBook_Media_ID and b.eBook_ISBN_No = @var_int;
		fetch next from ebook_details_cursor into @var_int, @var_char_100;
	end

close ebook_details_cursor;
deallocate ebook_details_cursor;
*/

end; --This is end of L_Search_Media proc

go

execute L_Search_Media 'The','','', 'Journal';

go 

/* Trigger to display the total number of media in the library database */
--drop trigger L_Trigger_Media_Count
create trigger L_Trigger_Media_Count
on Media
for insert, update, delete
as
declare @count int;

begin
select @count = COUNT(*) from Media;
--DBMS_OUTPUT.PUT_LINE('number of records = '||@count);
print('Total number of Media in the library = ' + Cast(@count as varchar));
end;

go

/* Five queries using different joins, to determine the titles available in the Book, eBook, Journal, eJournal and Magazine tables but not present in Media table */

select b.Book_Media_ID, b.Book_ISBN_No, b.Book_Bought_Date, bd.Book_Details_Title, bd.Book_Details_Author_First_Name, bd.Book_Details_Author_Last_Name from dbo.Book b inner join dbo.Book_Details bd on b.Book_ISBN_No = bd.Book_Details_ISBN_No; 

select eb.eBook_Media_ID, eb.eBook_ISBN_No, eb.eBook_Bought_Date, ebd.eBook_Details_Title, ebd.eBook_Details_Author_First_Name, ebd.eBook_Details_Author_Last_Name from eBook eb full outer join eBook_Details ebd on eb.eBook_ISBN_No = ebd.eBook_Details_ISBN_No;

select j.Journal_Media_ID, j.Journal_ISSN_No, j.Journal_Bought_Date, jd.Journal_Details_Title, jd.Journal_Details_Author_First_Name, jd.Journal_Details_Author_Last_Name from Journal_Details jd left outer join Journal j on j.Journal_ISSN_No = jd.Journal_Details_ISSN_Number;

select ej.eJournal_Media_ID, ej.eJournal_ISSN_No, ej.eJournal_Bought_Date, ejd.eJournal_Details_Title, ejd.eJournal_Details_Author_First_Name, ejd.eJournal_Details_Author_Last_Name from eJournal ej right outer join eJournal_Details ejd on ej.eJournal_ISSN_No = ejd.eJournal_Details_ISSN_Number;

select mg.Magazine_Media_ID, mg.Magazine_Internal_ID, mg.Magazine_Bought_Date, mgd.Magazine_Details_Name, mgd.Magazine_Details_Publisher, mgd.Magazine_Details_Volume_Num from Magazine mg right outer join Magazine_Details mgd on mg.Magazine_Internal_ID = mgd.Magazine_Details_Internal_ID where mg.Magazine_Internal_ID IS NULL;

/*
select m.Media_ID, m.Media_Format, b.Book_ISBN_No, b.Book_Bought_Date, m.Media_Status from dbo.Media m inner join dbo.Book b on m.Media_ID = b.Book_Media_ID; 

select m.Media_ID, m.Media_Format, eb.eBook_ISBN_No, eb.eBook_Bought_Date, m.Media_Status from dbo.Media m full outer join dbo.eBook eb on m.Media_ID = eb.eBook_Media_ID;

select m.Media_ID, m.Media_Format, j.Journal_ISSN_No, j.Journal_Bought_Date from dbo.Media m left outer join dbo.Journal j on m.Media_ID = j.Journal_Media_ID;
*/

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