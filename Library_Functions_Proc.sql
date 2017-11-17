-- Stored Procedures and Functions

use Library_SQL_Project;

/* Search media from the database */
--drop proc L_Search_Media;

go

create proc L_Search_Media @title varchar(100) 
as
begin
/* We need an efficient way to search for Media. The below inner join query with sub query will result in need of a cursor to 
look again for Book details with the same ISBN number */
/* select m.Media_ID, m.Media_Library_ID, m.Media_Format, m.Media_Status from dbo.Media m, dbo.Book b where m.Media_ID = b.Book_Media_ID and b.Book_ISBN_No in
	(select Book_Details_ISBN_No from dbo.Book_Details where dbo.Book_Details.Book_Details_Title LIKE '%'+@title+'%');
*/
--declare @temp_book_details table dbo.Book_Details;

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
		select @var_int as Book_Details_ISBN_No, @var_char_100 as Book_Details_Title, m.Media_ID, 
			m.Media_Library_ID, m.Media_Format, m.Media_Status 
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

end; --This is end of L_Search_Media proc

go

execute L_Search_Media 'Java';

