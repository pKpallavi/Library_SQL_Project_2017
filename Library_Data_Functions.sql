use Library_SQL_Project;

insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Year_Opened,Library_Timings)values (89, 'Mount Propspect Public Library', '(847) 253-5675','10 S Emerson St', 'Mount Prospect','IL','60056', 1951, 'Monday:9AM–10PM Tuesday:9AM–10PM Wednesday:9AM–10PM Thursday:9AM–10PM Friday:9AM–10PM Saturday:9AM–5PM Sunday:12–5PM');
insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Year_Opened,Library_Timings)values (90, 'Arlington Heights Memorial Library', '(847) 392-0100','500 N Dunton Ave',' Arlington Heights', 'IL','60004', 1952, 'Monday:9AM–10PM Tuesday:9AM–10PM Wednesday:9AM–10PM Thursday:9AM–10PM Friday:9AM–10PM Saturday:9AM–5PM Sunday:12–5PM');
insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Timings)values (91, 'Prospect Heights Public Library', '(847) 259-3500','12 N Elm Street',' Prospect Heights', 'IL','60070','Monday:9AM–10PM Tuesday:9AM–10PM Wednesday:9AM–10PM Thursday:9AM–10PM Friday:9AM–10PM Saturday:9AM–5PM Sunday:12–5PM');
insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Timings)values (92, 'Evanston North Branch Library', '(847) 866-0330','2026 Central St',' Evanston', 'IL','60201','Monday:9AM–10PM Tuesday:9AM–10PM Wednesday:9AM–10PM Thursday:9AM–10PM Friday:9AM–10PM Saturday:9AM–5PM Sunday:12–5PM');
insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Timings)values (93, 'Jefferson Park Branch Chicago Public Library', '(312) 744-1998','5363 W Lawrence Ave','Chicago', 'IL','60630','Monday:9AM–10PM Tuesday:9AM–10PM Wednesday:9AM–10PM Thursday:9AM–10PM Friday:9AM–10PM Saturday:9AM–5PM Sunday:12–5PM');
insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Timings)values (94, 'Poplar Creek Public Library Sonya Crawshaw Branch', '(630) 372-0052','4300 Audrey Ln',' Hanover Park', 'IL',' 60133','Monday:9AM–10PM Tuesday:9AM–10PM Wednesday:9AM–10PM Thursday:9AM–10PM Friday:9AM–10PM Saturday:9AM–5PM Sunday:12–5PM');
insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Timings)values (95, 'Albany Park Library', '(773) 539-5450','3401 W Foster Ave',' Chicago', 'IL','60625','Monday:9AM–10PM Tuesday:9AM–10PM Wednesday:9AM–10PM Thursday:9AM–10PM Friday:9AM–10PM Saturday:9AM–5PM Sunday:12–5PM');
insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Timings)values (96, 'Conrad Sulzer Regional Library', '(312) 744-7616','4455 N Lincoln Ave',' Chicago', 'IL','60625','Monday:9AM–10PM Tuesday:9AM–10PM Wednesday:9AM–10PM Thursday:9AM–10PM Friday:9AM–10PM Saturday:9AM–5PM Sunday:12–5PM');
insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Timings)values (97, 'Mayfair Branch, Chicago Public Library ', '(312) 744-1254','4400 W Lawrence Ave',' Chicago', 'IL','60630','Monday:9AM–10PM Tuesday:9AM–10PM Wednesday:9AM–10PM Thursday:9AM–10PM Friday:9AM–10PM Saturday:9AM–5PM Sunday:12–5PM');
insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Timings)values (98, 'DePaul University - John T. Richardson Library', '(773) 325-7862','2350 N Kenmore Ave',' Chicago', 'IL','60614','Monday:9AM–10PM Tuesday:9AM–10PM Wednesday:9AM–10PM Thursday:9AM–10PM Friday:9AM–10PM Saturday:9AM–5PM Sunday:12–5PM');

select * from Library;

go

/*
--sql statements to test trigger for insert, update or delete of Media table
delete from Media_Check_Out where Media_Check_Out_Media_ID = 890001;
delete from Book where Book_Media_ID = 890001;
delete from Media where Media_ID = 890001;
*/

--drop proc L_Insert_Media_Table;

go

create proc L_Insert_Media_Table @Media_ID as int, @Media_Format as varchar(30), @Media_Status as varchar(30), @Media_Library_ID as int 
as
begin
insert into Media(Media_ID, Media_Format, Media_Status, Media_Library_ID) values(@Media_ID, @Media_Format, @Media_Status, @Media_Library_ID);
end; --L_Insert_Media_Table

go
--update Media set Media_Status = 'Checked out' where Media_ID = 890001;

execute L_Insert_Media_Table 890001,'Book','Checked out',89;
execute L_Insert_Media_Table 890002,'Book','Returned',89;
execute L_Insert_Media_Table 890003,'Book','Checked out',89;
execute L_Insert_Media_Table 890004,'Book','On shelf',89;
execute L_Insert_Media_Table 890005,'Book','Due',89;
execute L_Insert_Media_Table 890006,'Book','Lost',89;
execute L_Insert_Media_Table 890007,'Book','Damaged',89;
execute L_Insert_Media_Table 890008,'Book','Due',89;
execute L_Insert_Media_Table 890009,'Book','Checked out',89;
execute L_Insert_Media_Table 890010,'Book','Returned',89;
execute L_Insert_Media_Table 890011,'Book','Checked out',89;
execute L_Insert_Media_Table 900001,'Book','On shelf',90;
execute L_Insert_Media_Table 900002,'Book','Returned',90;
execute L_Insert_Media_Table 900003,'Book','Checked out',90;
execute L_Insert_Media_Table 900004,'Book','On shelf',90;
execute L_Insert_Media_Table 900005,'Book','Due',90;
execute L_Insert_Media_Table 900006,'Book','Lost',90;
execute L_Insert_Media_Table 900007,'Book','Damaged',90;
execute L_Insert_Media_Table 900008,'Book','Due',90;
execute L_Insert_Media_Table 900009,'Book','On shelf',90;
execute L_Insert_Media_Table 900010,'Book','Checked out',90;
execute L_Insert_Media_Table 900011,'Book','Checked out',90;

execute L_Insert_Media_Table 890200,'eBook','Checked out',89;
execute L_Insert_Media_Table 890201,'eBook','Checked out',89;
execute L_Insert_Media_Table 890202,'eBook','Returned',89;
execute L_Insert_Media_Table 890203,'eBook','Checked out',89;
execute L_Insert_Media_Table 890204,'eBook','On shelf',89;
execute L_Insert_Media_Table 890205,'eBook','Due',89;
execute L_Insert_Media_Table 890206,'eBook','On shelf',89;--
execute L_Insert_Media_Table 890207,'eBook','On shelf',89;--
execute L_Insert_Media_Table 890208,'eBook','Due',89;
execute L_Insert_Media_Table 890209,'eBook','Checked out',89;
execute L_Insert_Media_Table 890210,'eBook','Returned',89;
execute L_Insert_Media_Table 900200,'eBook','Checked out',90;
execute L_Insert_Media_Table 900201,'eBook','On shelf',90;
execute L_Insert_Media_Table 900202,'eBook','Returned',90;
execute L_Insert_Media_Table 900203,'eBook','Due',90;
execute L_Insert_Media_Table 900204,'eBook','On shelf',90;
execute L_Insert_Media_Table 900205,'eBook','Due',90;
execute L_Insert_Media_Table 900206,'eBook','On shelf',90;--
execute L_Insert_Media_Table 900207,'eBook','On shelf',90;--
execute L_Insert_Media_Table 900208,'eBook','Due',90;
execute L_Insert_Media_Table 900209,'eBook','On shelf',90;
execute L_Insert_Media_Table 900210,'eBook','Checked out',90;

execute L_Insert_Media_Table 891200,'Journal','Due',89;
execute L_Insert_Media_Table 891201,'Journal','Checked out',89;
execute L_Insert_Media_Table 891202,'Journal','Returned',89;
execute L_Insert_Media_Table 891203,'Journal','Due',89;
execute L_Insert_Media_Table 891204,'Journal','On shelf',89;
execute L_Insert_Media_Table 891205,'Journal','Due',89;
execute L_Insert_Media_Table 891206,'Journal','Lost',89;
execute L_Insert_Media_Table 891207,'Journal','Damaged',89;
execute L_Insert_Media_Table 891208,'Journal','Due',89;
execute L_Insert_Media_Table 891209,'Journal','Checked out',89;
execute L_Insert_Media_Table 901200,'Journal','Checked out',90;
execute L_Insert_Media_Table 901201,'Journal','On shelf',90;
execute L_Insert_Media_Table 901202,'Journal','Returned',90;
execute L_Insert_Media_Table 901203,'Journal','Due',90;
execute L_Insert_Media_Table 901204,'Journal','On shelf',90;
execute L_Insert_Media_Table 901205,'Journal','Due',90;
execute L_Insert_Media_Table 901206,'Journal','Lost',90;
execute L_Insert_Media_Table 901207,'Journal','Damaged',90;
execute L_Insert_Media_Table 901208,'Journal','Due',90;
execute L_Insert_Media_Table 901209,'Journal','On shelf',90;

execute L_Insert_Media_Table 891400,'eJournal','Due',89;
execute L_Insert_Media_Table 891401,'eJournal','Checked out',89;
execute L_Insert_Media_Table 891402,'eJournal','Returned',89;
execute L_Insert_Media_Table 891403,'eJournal','Due',89;
execute L_Insert_Media_Table 891404,'eJournal','On shelf',89;
execute L_Insert_Media_Table 891405,'eJournal','Due',89;
execute L_Insert_Media_Table 891406,'eJournal','On shelf',89;--
execute L_Insert_Media_Table 891407,'eJournal','On shelf',89;--
execute L_Insert_Media_Table 891408,'eJournal','Due',89;
execute L_Insert_Media_Table 891409,'eJournal','Checked out',89;
execute L_Insert_Media_Table 901400,'eJournal','Checked out',90;
execute L_Insert_Media_Table 901401,'eJournal','On shelf',90;
execute L_Insert_Media_Table 901402,'eJournal','Returned',90;
execute L_Insert_Media_Table 901403,'eJournal','Due',90;
execute L_Insert_Media_Table 901404,'eJournal','On shelf',90;
execute L_Insert_Media_Table 901405,'eJournal','Due',90;
execute L_Insert_Media_Table 901406,'eJournal','On shelf',90;--
execute L_Insert_Media_Table 901407,'eJournal','On shelf',90;--
execute L_Insert_Media_Table 901408,'eJournal','Due',90;
execute L_Insert_Media_Table 901409,'eJournal','On shelf',90;

execute L_Insert_Media_Table 890800,'Magazine','Due',89;
execute L_Insert_Media_Table 890801,'Magazine','Checked out',89;
execute L_Insert_Media_Table 890802,'Magazine','Returned',89;
execute L_Insert_Media_Table 890803,'Magazine','Due',89;
execute L_Insert_Media_Table 890804,'Magazine','On shelf',89;
execute L_Insert_Media_Table 890805,'Magazine','Due',89;
execute L_Insert_Media_Table 890806,'Magazine','Lost',89;
execute L_Insert_Media_Table 890807,'Magazine','Damaged',89;
execute L_Insert_Media_Table 890808,'Magazine','Due',89;
execute L_Insert_Media_Table 890809,'Magazine','Checked out',89;
execute L_Insert_Media_Table 890810,'Magazine','Checked out',89;
execute L_Insert_Media_Table 900800,'Magazine','On shelf',90;
execute L_Insert_Media_Table 900801,'Magazine','Returned',90;
execute L_Insert_Media_Table 900802,'Magazine','Due',90;
execute L_Insert_Media_Table 900803,'Magazine','On shelf',90;
execute L_Insert_Media_Table 900804,'Magazine','Due',90;
execute L_Insert_Media_Table 900805,'Magazine','Lost',90;
execute L_Insert_Media_Table 900806,'Magazine','Damaged',90;
execute L_Insert_Media_Table 900807,'Magazine','Due',90;
execute L_Insert_Media_Table 900808,'Magazine','On shelf',90;
execute L_Insert_Media_Table 900809,'Magazine','On shelf',90;
execute L_Insert_Media_Table 900810,'Magazine','Returned',90;

execute L_Insert_Media_Table 891000,'Digital Magazine','Due',89;
execute L_Insert_Media_Table 891001,'Digital Magazine','Checked out',89;
execute L_Insert_Media_Table 891002,'Digital Magazine','Returned',89;
execute L_Insert_Media_Table 891003,'Digital Magazine','Due',89;
execute L_Insert_Media_Table 891004,'Digital Magazine','On shelf',89;
execute L_Insert_Media_Table 891005,'Digital Magazine','Due',89;
execute L_Insert_Media_Table 891006,'Digital Magazine','On shelf',89;--
execute L_Insert_Media_Table 891007,'Digital Magazine','On shelf',89;--
execute L_Insert_Media_Table 891008,'Digital Magazine','Due',89;
execute L_Insert_Media_Table 891009,'Digital Magazine','Checked out',89;
execute L_Insert_Media_Table 891010,'Digital Magazine','Checked out',89;
execute L_Insert_Media_Table 901000,'Digital Magazine','On shelf',90;
execute L_Insert_Media_Table 901001,'Digital Magazine','Returned',90;
execute L_Insert_Media_Table 901002,'Digital Magazine','Due',90;
execute L_Insert_Media_Table 901003,'Digital Magazine','On shelf',90;
execute L_Insert_Media_Table 901004,'Digital Magazine','Due',90;
execute L_Insert_Media_Table 901005,'Digital Magazine','On shelf',90;--
execute L_Insert_Media_Table 901006,'Digital Magazine','On shelf',90;--
execute L_Insert_Media_Table 901007,'Digital Magazine','Due',90;
execute L_Insert_Media_Table 901008,'Digital Magazine','On shelf',90;
execute L_Insert_Media_Table 901009,'Digital Magazine','On shelf',90;
execute L_Insert_Media_Table 901010,'Digital Magazine','Returned',90;

execute L_Insert_Media_Table  890400,'DVD','checked out',89;
execute L_Insert_Media_Table  890401,'DVD','returned',89;
execute L_Insert_Media_Table  890402,'DVD','Due',89;
execute L_Insert_Media_Table  890403,'DVD','on shelf',89;
execute L_Insert_Media_Table  890404,'DVD','due',89;
execute L_Insert_Media_Table  890405,'DVD','lost',89;
execute L_Insert_Media_Table  890406,'DVD','damaged',89;
execute L_Insert_Media_Table  890407,'DVD','Due',89;
execute L_Insert_Media_Table  890408,'DVD','checked out',89;
execute L_Insert_Media_Table  890409,'DVD','checked out',89;
execute L_Insert_Media_Table  900400,'DVD','checked out',90;
execute L_Insert_Media_Table  900401,'DVD','returned',90;
execute L_Insert_Media_Table  900402,'DVD','Due',90;
execute L_Insert_Media_Table  900403,'DVD','on shelf',90;
execute L_Insert_Media_Table  900404,'DVD','due',90;
execute L_Insert_Media_Table  900405,'DVD','lost',90;
execute L_Insert_Media_Table  900406,'DVD','damaged',90;
execute L_Insert_Media_Table  900407,'DVD','Due',90;
execute L_Insert_Media_Table  900408,'DVD','checked out',90;
execute L_Insert_Media_Table  900409,'DVD','checked out',90;

execute L_Insert_Media_Table 890600,'CD','Due',89;
execute L_Insert_Media_Table 890601,'CD','Checked out',89;
execute L_Insert_Media_Table 890602,'CD','Returned',89;
execute L_Insert_Media_Table 890603,'CD','Due',89;
execute L_Insert_Media_Table 890604,'CD','On shelf',89;
execute L_Insert_Media_Table 890605,'CD','Due',89;
execute L_Insert_Media_Table 890606,'CD','Lost',89;
execute L_Insert_Media_Table 890607,'CD','Damaged',89;
execute L_Insert_Media_Table 890608,'CD','Due',89;
execute L_Insert_Media_Table 890609,'CD','Checked out',89;
execute L_Insert_Media_Table 900600,'CD','On shelf',90;
execute L_Insert_Media_Table 900601,'CD','Returned',90;
execute L_Insert_Media_Table 900602,'CD','Due',90;
execute L_Insert_Media_Table 900603,'CD','On shelf',90;
execute L_Insert_Media_Table 900604,'CD','Due',90;
execute L_Insert_Media_Table 900605,'CD','Lost',90;
execute L_Insert_Media_Table 900606,'CD','Damaged',90;
execute L_Insert_Media_Table 900607,'CD','Due',90;
execute L_Insert_Media_Table 900608,'CD','On shelf',90;
execute L_Insert_Media_Table 900609,'CD','On shelf',90;

select * from Media;

go

create proc L_Insert_Book_Details_Table @ISBN_No as int, @Published_Year as int, @Title as varchar(100), @Author_First_Name as varchar(30), @Author_Last_Name as varchar(30), @Language as varchar(30), @Rating as int, @Price as int
as
begin
insert into dbo.Book_Details(Book_Details_ISBN_No, Book_Details_Published_Year, Book_Details_Title, Book_Details_Author_First_Name, Book_Details_Author_Last_Name, Book_Details_Language, Book_Details_Rating, Book_Details_Price) 
values(@ISBN_No , @Published_Year, @Title, @Author_First_Name, @Author_Last_Name, @Language, @Rating, @Price);
end --L_Insert_Book_Details_Table 

go

execute L_Insert_Book_Details_Table   1826,2009,'2 States','Chetan','Bhagat','English',4, 10;
execute L_Insert_Book_Details_Table   3697,2014,'Night Owl','M','Pierce','English',5, 10;
execute L_Insert_Book_Details_Table   2188,2012,'The Science Of Biology','Freeman','H & W Company','English',4, 10;
execute L_Insert_Book_Details_Table   2119,2004,'Core Java Advanced Features','Gart','Connell','English',3, 10;
execute L_Insert_Book_Details_Table   1846,2017,'Womans Ritual','Sudha','Murthy','English',5, 10;
execute L_Insert_Book_Details_Table   2147,2010,'Butterfly Effect: How Your Life Matters','Nelson','Thomas','English',3, 10;
execute L_Insert_Book_Details_Table   2106,2004,'SQL Pocket Guide','Jonathan','Gennick','English',4, 10;
execute L_Insert_Book_Details_Table   2738,2004,'Front-End Web Development: The Big Nerd Ranch Guide / Edition 1','Big Nerd Ranch Guides','Guides','English',4, 10;
execute L_Insert_Book_Details_Table   2278,2015,'5 Love Langugaes-The Secret To Love That Lasts','Gary','Chapman','English',5, 10;
execute L_Insert_Book_Details_Table   3843,1901,'Till We Have Faces: A Myth Retold','C.S','Lewis','English',3, 10;
execute L_Insert_Book_Details_Table   2671,2013,'Java Programming','Tushar','Patel','English',4, 10;

execute L_Insert_Book_Details_Table   1200,2010,'My social media for seniors','Michael,','Miller','English',4, 10;
execute L_Insert_Book_Details_Table   2000,2008,'Computers for seniors : email, internet, photos, and more in 14 easy lessons','Chris','Ewin','English',4, 10;
execute L_Insert_Book_Details_Table   2487,1992,'Zero belly breakfasts','David','Zinczenko','English',4, 10;

select * from Book_Details;

go

--drop proc L_Insert_Book_Table;
create proc L_Insert_Book_Table @Media_ID as int, @ISBN_No as int, @Bought_Date as date
as
begin
declare @msg varchar(100), @pub_year int, @lib_opened_year int;
select @pub_year = Book_Details_Published_Year from Book_Details where Book_Details_ISBN_No = @ISBN_No;
select @lib_opened_year = Library.Library_Year_Opened from Library, Media where Library.Library_ID = Media.Media_Library_ID and Media.Media_ID = @Media_ID;
if Year(@Bought_Date) < @pub_year or Year(@Bought_Date) < @lib_opened_year
begin
	set @msg = 'Error in Book_Bought_Date value. Should be later than Published year and Library opening year';
	--Library opening year can be a field in the database 
	Raiserror(@msg,16,1);
end;
insert into Book(Book_Media_ID, Book_ISBN_No, Book_Bought_Date) values(@Media_ID, @ISBN_No, @Bought_Date) 
end;

go

--Library ID 89
execute L_Insert_Book_Table  890001,1826,'11/13/2016';
execute L_Insert_Book_Table  890002,3697,'6/3/2016';
execute L_Insert_Book_Table  890003,2188,'9/13/2016';
execute L_Insert_Book_Table  890004,2119,'12/10/2013';
execute L_Insert_Book_Table  890005,1846,'1/15/2017';
execute L_Insert_Book_Table  890006,2147,'11/8/2012';
execute L_Insert_Book_Table  890007,2106,'5/19/2007';
execute L_Insert_Book_Table  890008,2738,'11/21/2005';
execute L_Insert_Book_Table  890009,2278,'2/17/2015';
execute L_Insert_Book_Table  890010,3843,'3/2/1967';
execute L_Insert_Book_Table  890011,2671,'2/18/2016';

--Library ID 90
execute L_Insert_Book_Table  900001,1826,'11/15/2011';
execute L_Insert_Book_Table  900002,3697,'6/29/2014';
execute L_Insert_Book_Table  900003,2188,'10/1/2016';
execute L_Insert_Book_Table  900004,2119,'12/8/2008';
execute L_Insert_Book_Table  900005,1846,'6/23/2017';
execute L_Insert_Book_Table  900006,2147,'8/12/2015';
execute L_Insert_Book_Table  900007,2106,'10/5/2006';
execute L_Insert_Book_Table  900008,2738,'6/22/2005';
execute L_Insert_Book_Table  900009,2278,'3/29/2016';
execute L_Insert_Book_Table  900010,3843,'5/10/1955';
execute L_Insert_Book_Table  900011,2671,'11/8/2015';

select * from Book;

go

--drop proc L_Insert_eBook_Table;
create proc L_Insert_eBook_Details_Table @ISBN_No as int, @Release_Date as date, @Title as varchar(100), @Author_First_Name as varchar(30), @Author_Last_Name as varchar(30), @Language as varchar(30), @Rating as int
as
begin
insert into dbo.eBook_Details(eBook_Details_ISBN_No, eBook_Details_Release_Date, eBook_Details_Title, eBook_Details_Author_First_Name, eBook_Details_Author_Last_Name, eBook_Details_Language, eBook_Details_Rating, eBook_Details_Duration) values(@ISBN_No, @Release_Date, @Title, @Author_First_Name, @Author_Last_Name, @Language, @Rating);
end;

go

execute L_Insert_eBook_Details_Table    6380,'7/18/2009','2 States','Chetan','Bhagat','English',4;
execute L_Insert_eBook_Details_Table    9282,'9/10/2014','Night Owl','M','Pierce','English',5;
execute L_Insert_eBook_Details_Table    8275,'12/6/2012','The Science Of Biology','Freeman','H & W Company','English',4;
execute L_Insert_eBook_Details_Table    6425,'11/2/2004','Core Java Advanced Features','Gart','Connell','English',3;
execute L_Insert_eBook_Details_Table    6715,'5/22/2017','Womans Ritual','Sudha','Murthy','English',5;
execute L_Insert_eBook_Details_Table    7033,'10/1/2010','Butterfly Effect: How Your Life Matters','Nelson','Thomas','English',3;
execute L_Insert_eBook_Details_Table    6829,'6/28/2004','SQL Pocket Guide','Jonathan','Gennick','English',4;
execute L_Insert_eBook_Details_Table    7529,'2/3/2004','Front-End Web Development: The Big Nerd Ranch Guide / Edition 1','Big Nerd Ranch Guides','Guides','English',4;
execute L_Insert_eBook_Details_Table    8205,'6/29/2015','5 Love Langugaes-The Secret To Love That Lasts','Gary','Chapman','English',5;
execute L_Insert_eBook_Details_Table    7382,'4/15/1901','Till We Have Faces: A Myth Retold','C.S','Lewis','English',3;
execute L_Insert_eBook_Details_Table    7896,'3/6/2013','Java Programming','Tushar','Patel','English',4;

execute L_Insert_eBook_Details_Table	7000,'2/22/2011','My social media for seniors','Michael,','Miller','English',4;
execute L_Insert_eBook_Details_Table	8000,'8/12/2009','Computers for seniors : email, internet, photos, and more in 14 easy lessons','Chris','Ewin','English',4;
execute L_Insert_eBook_Details_Table	8010,'11/13/2008','Zero belly breakfasts','David','Zinczenko','English',4;

select * from eBook_Details;

go

create proc L_Insert_eBook_Table @Media_ID as int, @ISBN_No as int, @Bought_Date as date
as
begin
declare @msg varchar(100), @pub_year int, @lib_opened_year int;
select @pub_year = Year(eBook_Details_Release_Date) from eBook_Details where eBook_Details_ISBN_No = @ISBN_No;
select @lib_opened_year = Library.Library_Year_Opened from Library, Media where Library.Library_ID = Media.Media_Library_ID and Media.Media_ID = @Media_ID;
if Year(@Bought_Date) < @pub_year or Year(@Bought_Date) < @lib_opened_year
begin
	set @msg = 'Error in eBook_Bought_Date value. Should be later than Published year and Library opening year';
	--Library opening year can be a field in the database 
	Raiserror(@msg,16,1);
end;
insert into eBook(eBook_Media_ID, eBook_ISBN_No, eBook_Bought_Date) values(@Media_ID, @ISBN_No, @Bought_Date) 
end;

go

execute L_Insert_eBook_Table 890200,6380,'1/4/2015';
execute L_Insert_eBook_Table 890201,9282,'2/7/2015';
execute L_Insert_eBook_Table 890202,8275,'3/5/2015';
execute L_Insert_eBook_Table 890203,6425,'5/6/2012';
execute L_Insert_eBook_Table 890204,6715,'6/6/2017';
execute L_Insert_eBook_Table 890205,7033,'12/4/2010';
execute L_Insert_eBook_Table 890206,6829,'2/8/2009';
execute L_Insert_eBook_Table 890207,7529,'8/8/2008';
execute L_Insert_eBook_Table 890208,8205,'6/11/2016';
execute L_Insert_eBook_Table 890209,7382,'3/11/2005';
execute L_Insert_eBook_Table 890210,7896,'10/10/2014';

execute L_Insert_eBook_Table 900200,6380,'1/4/2015';
execute L_Insert_eBook_Table 900201,9282,'2/7/2015';
execute L_Insert_eBook_Table 900202,8275,'3/5/2015';
execute L_Insert_eBook_Table 900203,6425,'5/6/2012';
execute L_Insert_eBook_Table 900204,6715,'6/6/2017';
execute L_Insert_eBook_Table 900205,7033,'12/4/2010';
execute L_Insert_eBook_Table 900206,6829,'2/8/2009';
execute L_Insert_eBook_Table 900207,7529,'8/8/2008';
execute L_Insert_eBook_Table 900208,8205,'6/11/2016';
execute L_Insert_eBook_Table 900209,7382,'3/11/2005';
execute L_Insert_eBook_Table 900210,7896,'10/10/2014';

select * from eBook;

go

--drop proc L_Insert_Journal_Details_Table;
create proc L_Insert_Journal_Details_Table @ISSN_No as int, @Title as varchar(100), @Source as varchar(100), 
	@Publish_Date as date, @End_Date as date, @Volume as int, @Issue as int, @Author_Last_Name as varchar(30), 
	@Author_First_Name as varchar(30), @Price as int
as
begin
insert into dbo.Journal_Details(Journal_Details_ISSN_Number, Journal_Details_Title, Journal_Details_Source, 
	Journal_Details_Published_Date, Journal_Details_End_Date, Journal_Details_Issue, Journal_Details_Author_Last_Name, 
	Journal_Details_Author_First_Name, Journal_Details_Price) 
 values(@ISSN_No, @Title, @Source, @Publish_Date, @End_Date, @Volume, @Issue, @Author_Last_Name, @Author_First_Name, @Price);
end;

go

execute L_Insert_Journal_Details_Table 62801,'The Plant Journal', 'John Wiley & Sons Ltd','09/01/2016',91,5,'Sweetlove','Lee',0;
execute L_Insert_Journal_Details_Table 60618,'The Science XYZ','Society for Science','01/01/2017',78,1,'Smith','Jason',5;
execute L_Insert_Journal_Details_Table 62596,'A History of Illinois','Society for Illinois study','10/21/2016',20,10,'Ampersand','Mark',7;
execute L_Insert_Journal_Details_Table 62971,'The Animals Journal','Society for Zoology','8/22/2015',40,8,'Doe','Jane',6;
execute L_Insert_Journal_Details_Table 63652,'The Rare Gems Catalogue','Unique Jewellers','10/02/2013',31,10,'Joe','Rank',6;
execute L_Insert_Journal_Details_Table 60241,'The Heritage Parks','American Society for Parks ','7/23/2010',22,3,'King','Happy',4;
execute L_Insert_Journal_Details_Table 60080,'The Education Journey','Society for Education','6/22/2013',30,6,'Deer','Hill',4;
execute L_Insert_Journal_Details_Table 61364,'The Natural Science Journal','The Smithsonian Institute','6/10/2015',24,6,'Jam','Jello',6;
execute L_Insert_Journal_Details_Table 63189,'A Knowledge of Nature','Society for Nature','7/20/2014',20,7,'Join','Just',4;
execute L_Insert_Journal_Details_Table 63601,'The Automobile Journal','Society for Mechanics','10/10/2015',33,10,'Motors','Tata',6;

execute L_Insert_Journal_Details_Table 60070,'Consumer Price Index','US Bureau of Labor Statistics','7/20/2011',31,11,'Mark','Joyce',4;
execute L_Insert_Journal_Details_Table 63210,'Development Outreach','World Bank','8/22/2012',21,8,'Vargaria','Roland',4;
execute L_Insert_Journal_Details_Table 63821,'Automotive Design and Production','AD P','1/30/2012',14,10,'Ford','Mustang',4;

select * from Journal_Details;

go

create proc L_Insert_Journal_Table @Media_ID as int, @ISSN_No as int, @Bought_Date as date
as
begin
declare @msg varchar(100), @pub_year int, @lib_opened_year int;
select @pub_year = Year(Journal_Details_Published_Date) from Journal_Details where Journal_Details_ISSN_Number = @ISSN_No;
select @lib_opened_year = Library.Library_Year_Opened from Library, Media where Library.Library_ID = Media.Media_Library_ID and Media.Media_ID = @Media_ID;
if Year(@Bought_Date) < @pub_year or Year(@Bought_Date) < @lib_opened_year
begin
	set @msg = 'Error in Journal_Bought_Date value. Should be later than Published date and Library opening year';
	Raiserror(@msg,16,1);
end;
insert into Journal(Journal_Media_ID, Journal_ISSN_No, Journal_Bought_Date) values(@Media_ID, @ISSN_No, @Bought_Date) 
end;

go

execute L_Insert_Journal_Table	891200,62801,'09/15/2016';
execute L_Insert_Journal_Table	891201,60618,'01/15/2017';
execute L_Insert_Journal_Table	891202,62596,'11/15/2016';
execute L_Insert_Journal_Table	891203,62971,'9/15/2015';
execute L_Insert_Journal_Table	891204,63652,'11/15/2013';
execute L_Insert_Journal_Table	891205,60241,'8/15/2010';
execute L_Insert_Journal_Table	891206,60080,'7/15/2013';
execute L_Insert_Journal_Table	891207,61364,'6/30/2015';
execute L_Insert_Journal_Table	891208,63189,'8/15/2014';
execute L_Insert_Journal_Table	891209,63601,'10/30/2015';

execute L_Insert_Journal_Table	901200,62801,'09/15/2016';
execute L_Insert_Journal_Table	901201,60618,'01/15/2017';
execute L_Insert_Journal_Table	901202,62596,'11/15/2016';
execute L_Insert_Journal_Table	901203,62971,'9/15/2015';
execute L_Insert_Journal_Table	901204,63652,'11/15/2013';
execute L_Insert_Journal_Table	901205,60241,'8/15/2010';
execute L_Insert_Journal_Table	901206,60080,'7/15/2013';
execute L_Insert_Journal_Table	901207,61364,'6/30/2015';
execute L_Insert_Journal_Table	901208,63189,'8/15/2014';
execute L_Insert_Journal_Table	901209,63601,'10/30/2015';

select * from Journal;

go

--drop proc L_Insert_Journal_Details_Table;
create proc L_Insert_eJournal_Details_Table @ISSN_No as int, @Title as varchar(100), @Source as varchar(100), 
	@Publish_Date as date, @End_Date as date, @Volume as int, @Issue as int, @Author_Last_Name as varchar(30), 
	@Author_First_Name as varchar(30)
as
begin
insert into dbo.eJournal_Details(eJournal_Details_ISSN_Number, eJournal_Details_Title, eJournal_Details_Source, 
	eJournal_Details_Published_Date, eJournal_Details_End_Date, eJournal_Details_Volume, eJournal_Details_Issue, eJournal_Details_Author_Last_Name, 
	eJournal_Details_Author_First_Name) 
 values(@ISSN_No, @Title, @Source, @Publish_Date, @End_Date, @Volume, @Issue, @Author_Last_Name, @Author_First_Name);
end;

go

execute L_Insert_eJournal_Details_Table	69552,'The Plant Journal','John Wiley & Sons Ltd','09/01/2016','',91,5,'Sweetlove','Lee';
execute L_Insert_eJournal_Details_Table	67808,'The Science XYZ','Society for Science','01/01/2017','',78,1,'Smith','Jason';
execute L_Insert_eJournal_Details_Table	67561,'A History of Illinois','Society for Illinois study','10/21/2016','',20,10,'Ampersand','Mark';
execute L_Insert_eJournal_Details_Table	69654,'The Animals Journal','Society for Zoology','8/22/2015','',40,8,'Doe','Jane';
execute L_Insert_eJournal_Details_Table	68666,'The Rare Gems Catalogue','Unique Jewellers','10/02/2013','',31,10,'Joe','Rank';
execute L_Insert_eJournal_Details_Table	68287,'The Heritage Parks','American Society for Parks ','7/23/2010','',22,3,'King','Happy';
execute L_Insert_eJournal_Details_Table	68885,'The Education Journey','Society for Education','6/22/2013','',30,6,'Deer','Hill';
execute L_Insert_eJournal_Details_Table	69468,'The Natural Science Journal','The Smithsonian Institute','6/10/2015','',24,6,'Jam','Jello';
execute L_Insert_eJournal_Details_Table	67520,'A Knowledge of Nature','Society for Nature','7/20/2014','',20,7,'Join','Just';
execute L_Insert_eJournal_Details_Table	68039,'The Automobile Journal','Society for Mechanics','10/10/2015','',33,10,'Motors','Tata';
execute L_Insert_eJournal_Details_Table 66070,'Consumer Price Index','US Bureau of Labor Statistics','7/20/2011','',31,11,'Mark','Joyce';
execute L_Insert_eJournal_Details_Table 66210,'Development Outreach','World Bank','8/22/2012','',21,8,'Vargaria','Roland';
execute L_Insert_eJournal_Details_Table 67821,'Automotive Design and Production','AD P','1/30/2012','',14,10,'Ford','Mustang';


select * from eJournal_Details;

go

create proc L_Insert_eJournal_Table @Media_ID as int, @ISSN_No as int, @Bought_Date as date
as
begin
declare @msg varchar(100), @pub_year int, @lib_opened_year int;
select @pub_year = Year(eJournal_Details_Published_Date) from eJournal_Details where eJournal_Details_ISSN_Number = @ISSN_No;
select @lib_opened_year = Library.Library_Year_Opened from Library, Media where Library.Library_ID = Media.Media_Library_ID and Media.Media_ID = @Media_ID;
if Year(@Bought_Date) < @pub_year or Year(@Bought_Date) < @lib_opened_year
begin
	set @msg = 'Error in eJournal_Bought_Date value. Should be later than Published date and Library opening year';
	Raiserror(@msg,16,1);
end;
insert into eJournal(eJournal_Media_ID, eJournal_ISSN_No, eJournal_Bought_Date) values(@Media_ID, @ISSN_No, @Bought_Date) 
end;

go

execute L_Insert_eJournal_Table	891400,69552,'09/15/2016';
execute L_Insert_eJournal_Table	891401,67808,'01/15/2017';
execute L_Insert_eJournal_Table	891402,67561,'11/15/2016';
execute L_Insert_eJournal_Table	891403,69654,'9/15/2015';
execute L_Insert_eJournal_Table	891404,68666,'11/15/2013';
execute L_Insert_eJournal_Table	891405,68287,'8/15/2010';
execute L_Insert_eJournal_Table	891406,68885,'7/15/2013';
execute L_Insert_eJournal_Table	891407,69468,'6/30/2015';
execute L_Insert_eJournal_Table	891408,67520,'8/15/2014';
execute L_Insert_eJournal_Table	891409,68039,'10/30/2015';

execute L_Insert_eJournal_Table	901400,69552,'09/15/2016';
execute L_Insert_eJournal_Table	901401,67808,'01/15/2017';
execute L_Insert_eJournal_Table	901402,67561,'11/15/2016';
execute L_Insert_eJournal_Table	901403,69654,'9/15/2015';
execute L_Insert_eJournal_Table	901404,68666,'11/15/2013';
execute L_Insert_eJournal_Table	901405,68287,'8/15/2010';
execute L_Insert_eJournal_Table	901406,68885,'7/15/2013';
execute L_Insert_eJournal_Table	901407,69468,'6/30/2015';
execute L_Insert_eJournal_Table	901408,67520,'8/15/2014';
execute L_Insert_eJournal_Table	901409,68039,'10/30/2015';

select * from eJournal;

go

--drop proc L_Insert_Magazine_Details_Table;
create proc L_Insert_Magazine_Details_Table @Int_ID as int, @Name as varchar(100), @Pub_Date as date, 
	@Volume as int, @Issue as int, @Publisher as varchar(50), @Genre as varchar(30),
	@Price as int
as
begin
insert into dbo.Magazine_Details(Magazine_Details_Internal_ID, Magazine_Details_Name, Magazine_Details_Published_Date, 
	Magazine_Details_Volume_Num, Magazine_Details_Issue_Num, Magazine_Details_Publisher, Magazine_Details_Genre, 
	Magazine_Details_Price) 
 values(@Int_ID, @Name, @Pub_Date, @Volume, @Issue, @Publisher, @Genre, @Price);
end;

go

execute L_Insert_Magazine_Details_Table	40000,'Parents magazine','12/1/2016',20,12,'Gruner & Jahr USA','Family',10;
execute L_Insert_Magazine_Details_Table	40001,'National parks : the magazine of the National Parks & Conservation Association','10/10/2000',28,10,'National Parks and Conservation Association','Nature',7;
execute L_Insert_Magazine_Details_Table	40002,'Food network magazine ','08/08/2001',40,8,'Hyperion','Food',8;
execute L_Insert_Magazine_Details_Table	40003,'Time Magazine','10/15/2002',20,10,'Time Home Entertainment','World',8;
execute L_Insert_Magazine_Details_Table	40004,'The National Geographic Magazine','07/06/2008',50,7,'National Geographic','Nature',8;
execute L_Insert_Magazine_Details_Table	40005,'Bloomberg businessweek','04/04/2009',30,4,'Bloomberg L.P.','Business',6;
execute L_Insert_Magazine_Details_Table	40006,'Forbes','07/12/2003',40,7,'Forbes Inc','Business',7;
execute L_Insert_Magazine_Details_Table	40007,'Food & wine the guide to good taste','06/16/2007',27,6,'International Review of Food & Wine Associates','Food',6;
execute L_Insert_Magazine_Details_Table	40008,'Natural history','08/26/2008',40,8,'American Museum of Natural History','Nature',6;
execute L_Insert_Magazine_Details_Table	40009,'Motor trend','05/16/2004',20,5,'Woron, Walter A.','Automobiles',6;
execute L_Insert_Magazine_Details_Table	40010,'Car and driver','03/19/2002',30,3,'Ziff-Davis Pub. Co.','Automobiles',7;

execute L_Insert_Magazine_Details_Table	40011,'Autoweek','09/26/2009',30,8,'Wren, Wick A.','Automobiles',6;
execute L_Insert_Magazine_Details_Table	40012,'Food Science and Nutrition','05/26/2008',25,5,'Wiley Periodicals, Inc','Food',6;
execute L_Insert_Magazine_Details_Table	40013,'Export Today''s Global Business','07/29/2012',31,3,'Ebsco Business Source Complete','Finance',10;

select * from Magazine_Details;

go

create proc L_Insert_Magazine_Table @Media_ID as int, @Int_ID as int, @Bought_Date as date
as
begin
declare @msg varchar(100), @pub_year int, @lib_opened_year int;
select @pub_year = Year(Magazine_Details_Published_Date) from Magazine_Details where Magazine_Details_Internal_ID = @Int_ID;
select @lib_opened_year = Library.Library_Year_Opened from Library, Media where Library.Library_ID = Media.Media_Library_ID and Media.Media_ID = @Media_ID;
if Year(@Bought_Date) < @pub_year or Year(@Bought_Date) < @lib_opened_year
begin
	set @msg = 'Error in Magazine_Bought_Date value. Should be later than Published date and Library opening year';
	Raiserror(@msg,16,1);
end;
insert into Magazine(Magazine_Media_ID, Magazine_Internal_ID, Magazine_Bought_Date) values(@Media_ID, @Int_ID, @Bought_Date);
end;

go

execute L_Insert_Magazine_Table	890800,40000,'12/6/2016';
execute L_Insert_Magazine_Table	890801,40001,'11/20/2016';
execute L_Insert_Magazine_Table	890802,40002,'9/21/2006';
execute L_Insert_Magazine_Table	890803,40003,'10/29/2010';
execute L_Insert_Magazine_Table	890804,40004,'7/15/2015';
execute L_Insert_Magazine_Table	890805,40005,'11/21/2016';
execute L_Insert_Magazine_Table	890806,40006,'11/17/2007';
execute L_Insert_Magazine_Table	890807,40007,'12/16/2016';
execute L_Insert_Magazine_Table	890808,40008,'12/28/2011';
execute L_Insert_Magazine_Table	890809,40009,'9/17/2005';
execute L_Insert_Magazine_Table	890810,40010,'10/31/2015';
execute L_Insert_Magazine_Table	900800,40000,'12/6/2016';
execute L_Insert_Magazine_Table	900801,40001,'11/20/2017';
execute L_Insert_Magazine_Table	900802,40002,'9/21/2006';
execute L_Insert_Magazine_Table	900803,40003,'10/29/2010';
execute L_Insert_Magazine_Table	900804,40004,'7/15/2015';
execute L_Insert_Magazine_Table	900805,40005,'11/21/2014';
execute L_Insert_Magazine_Table	900806,40006,'11/17/2007';
execute L_Insert_Magazine_Table	900807,40007,'12/16/2016';
execute L_Insert_Magazine_Table	900808,40008,'12/28/2011';
execute L_Insert_Magazine_Table	900809,40009,'9/17/2005';
execute L_Insert_Magazine_Table	900810,40010,'10/31/2015';

select * from Magazine;

go

--drop proc L_Insert_Digital_Magazine_Details;
create proc L_Insert_Digital_Magazine_Details_Table @Int_ID as int, @Name as varchar(100), @Pub_Date as date, 
	@Volume as int, @Issue as int, @Publisher as varchar(50), @Genre as varchar(30)
as
begin
insert into dbo.Digital_Magazine_Details(Digital_Magazine_Details_Internal_ID, Digital_Magazine_Name, Digital_Magazine_Published_Date, Digital_Magazine_Volume_Num, Digital_Magazine_Issue_Num, Digital_Magazine_Publisher, Digital_Magazine_Genre) values(@Int_ID, @Name, @Pub_Date, @Volume, @Issue, @Publisher, @Genre);
end;

go

execute L_Insert_Digital_Magazine_Details_Table	46000,'Parents magazine','12/1/2015',20,12,'Gruner & Jahr USA','Family';
execute L_Insert_Digital_Magazine_Details_Table	46001,'National parks : the magazine of the National Parks & Conservation Association','10/10/2000',28,10,'National Parks and Conservation Association','Nature';
execute L_Insert_Digital_Magazine_Details_Table	46002,'Food network magazine ','08/08/2001',40,8,'Hyperion','Food';
execute L_Insert_Digital_Magazine_Details_Table	46003,'Time Magazine','10/15/2002',20,10,'Time Home Entertainment','World';
execute L_Insert_Digital_Magazine_Details_Table	46004,'The National Geographic Magazine','07/06/2008',50,7,'National Geographic','Nature';
execute L_Insert_Digital_Magazine_Details_Table	46005,'Bloomberg businessweek','04/04/2009',30,4,'Bloomberg L.P.','Business';
execute L_Insert_Digital_Magazine_Details_Table	46006,'Forbes','07/12/2003',40,7,'Forbes Inc','Business';
execute L_Insert_Digital_Magazine_Details_Table	46007,'Food & wine the guide to good taste','06/16/2007',27,6,'International Review of Food & Wine Associates','Food';
execute L_Insert_Digital_Magazine_Details_Table	46008,'Natural history','08/26/2008',40,8,'American Museum of Natural History','Nature';
execute L_Insert_Digital_Magazine_Details_Table	46009,'Motor trend','05/16/2004',20,5,'Woron, Walter A.','Automobiles';
execute L_Insert_Digital_Magazine_Details_Table	46010,'Car and driver','03/19/2002',30,3,'Ziff-Davis Pub. Co.','Automobiles';

select * from Digital_Magazine_Details;

go

create proc L_Insert_Digital_Magazine_Table @Media_ID as int, @Int_ID as int, @Bought_Date as date
as
begin
declare @msg varchar(100), @pub_year int, @lib_opened_year int;
select @pub_year = Year(Digital_Magazine_Published_Date) from Digital_Magazine_Details where Digital_Magazine_Details_Internal_ID = @Int_ID;
select @lib_opened_year = Library.Library_Year_Opened from Library, Media where Library.Library_ID = Media.Media_Library_ID and Media.Media_ID = @Media_ID;
if Year(@Bought_Date) < @pub_year or Year(@Bought_Date) < @lib_opened_year
begin
	set @msg = 'Error in Digital_Magazine_Bought_Date value. Should be later than Published date and Library opening year';
	Raiserror(@msg,16,1);
end;
insert into Digital_Magazine(Digital_Magazine_Media_ID, Digital_Magazine_Internal_ID, Digital_Magazine_Bought_Date) values(@Media_ID, @Int_ID, @Bought_Date);
end;

go

execute L_Insert_Digital_Magazine_Table	891000,46000,'12/6/2016';
execute L_Insert_Digital_Magazine_Table	891001,46001,'11/20/2016';
execute L_Insert_Digital_Magazine_Table	891002,46002,'9/21/2006';
execute L_Insert_Digital_Magazine_Table	891003,46003,'10/29/2010';
execute L_Insert_Digital_Magazine_Table	891004,46004,'7/15/2015';
execute L_Insert_Digital_Magazine_Table	891005,46005,'11/21/2013';
execute L_Insert_Digital_Magazine_Table	891006,46006,'11/17/2007';
execute L_Insert_Digital_Magazine_Table	891007,46007,'12/16/2013';
execute L_Insert_Digital_Magazine_Table	891008,46008,'12/28/2011';
execute L_Insert_Digital_Magazine_Table	891009,46009,'9/17/2005';
execute L_Insert_Digital_Magazine_Table	891010,46010,'10/31/2015';
execute L_Insert_Digital_Magazine_Table	901000,46000,'12/6/2016';
execute L_Insert_Digital_Magazine_Table	901001,46001,'11/20/2016';
execute L_Insert_Digital_Magazine_Table	901002,46002,'9/21/2006';
execute L_Insert_Digital_Magazine_Table	901003,46003,'10/29/2010';
execute L_Insert_Digital_Magazine_Table	901004,46004,'7/15/2015';
execute L_Insert_Digital_Magazine_Table	901005,46005,'11/21/2013';
execute L_Insert_Digital_Magazine_Table	901006,46006,'11/17/2007';
execute L_Insert_Digital_Magazine_Table	901007,46007,'12/16/2013';
execute L_Insert_Digital_Magazine_Table	901008,46008,'12/28/2011';
execute L_Insert_Digital_Magazine_Table	901009,46009,'9/17/2005';
execute L_Insert_Digital_Magazine_Table	901010,46010,'10/31/2015';

select * from Digital_Magazine;

go

--drop proc L_Insert_DVD_Details;
create proc L_Insert_DVD_Details @ISBN_No as int, @Title as varchar(100), @Genre as varchar(30), 
	@Rating as int, @Release_Date as date, @Length as time, @VideoType as varchar(15), @Language as varchar(30),
	@Author_First_Name as varchar(30), @Author_Last_Name as varchar(30), @Publisher as varchar(50),
	@Summary as varchar(100), @Price as int
as
begin
insert into dbo.DVD_Details(DVD_Details_ISBN_No, DVD_Details_Title, DVD_Details_Genre, DVD_Details_Rating, DVD_Details_Release_Date, DVD_Details_Length, DVD_Details_VideoType, DVD_Details_Language, DVD_Details_Author_First_Name, DVD_Details_Author_Last_Name,
DVD_Details_Publisher, DVD_Details_Summary, DVD_Details_Price) values(@ISBN_No, @Title, @Genre, @Rating, @Release_Date, 
@Length, @VideoType, @Language,	@Author_First_Name, @Author_Last_Name, @Publisher,	@Summary, @Price);
end;

go

execute L_Insert_DVD_Details	22393,'Cars 3','Children''s',4,'10/31/2016','1:49:00','NTSC','English','Owen','Wilson','Disney Pixar','Blindsided by a new generation of blazing-fast racers, the legendary Lightning McQueen is suddenly pushed out of the sport he loves. To get back in the game, he will need the help of an eager young race technician with her own plan to win, inspiration from the late Fabulous Hudson Hornet, and a few unexpected turns.',10;
execute L_Insert_DVD_Details	23620,'Calculus DVD pack. Parts 1 & 2','Educational',3,'8/9/2004','4:00:00','NTSC','English','Nicole','Ballivian','Cerebellum Corp., c2004.','Standard Deviants presents a video course to learn and review calculus.',8;
execute L_Insert_DVD_Details	22916,'My Little Pony Friendship is Magic: Holiday Hearts (DVD)','Children''s',4,'7/5/2016','2:12:00','NTSC','English','Tara','Strong','Shout! Kids, 2017','It''s time for the holidays and the ponies are ready to celebrate! Join Twilight Sparkle and her best pony pals for six heartwarming tales.',7;
execute L_Insert_DVD_Details	21645,'Tangled before ever after','Children''s',4,'8/3/2016','0:57:00','NTSC','English','Moore','Mandy','Walt Disney Studios Home Entertainment, 2017','After all the years stuck in a tower, everyone''s favorite barefoot princess yearns to make up for lost time. With the help of her true love Eugene, pals Pascal and Maximus and daring new friend Cassandra, Rapunzel postpones her wedding and royal duties to defy danger and boldly explore life beyond Corona''s walls.',7;
execute L_Insert_DVD_Details	22353,'Ratatouille','Children''s',4,'5/5/2007','1:51:00','NTSC','English','Lewis','Brad','Walt Disney Studios Home Entertainment, 2007','A rat named Remy dreams of becoming a great chef despite his family''s wishes and the obvious problem of being a rat in a decidedly rodent-phobic profession. When fate places Remy in Paris, he finds himself ideally situated beneath a restaurant made famous by his culinary hero.',7;
execute L_Insert_DVD_Details	23631,'Algebra. Programs 1 - 7','Educational',4,'7/7/2005','3:30:00','NTSC','English','Goldhil','Educational','Goldhil Educational','Standard Deviants school DVD',7;
execute L_Insert_DVD_Details	23146,'Hum tum','Foreign Films',5,'8/9/2007','2:28:00','NTSC','Hindi','Kunal','Kohli','YRF Home Entertainment, 2016','A refreshing look at the eternal battle of the sexes as it follows the lives of Karan and Rhea. Karan is a cartoonist whose characters Hum and Tum reflect his perspective on the love-hate relationship between men and women.',8;
execute L_Insert_DVD_Details	22956,'Mili','Foreign Films',4,'4/3/2003','2:03:00','NTSC','Hindi','N.C.','Sippy','Shemaroo Video','Because Mili (Jaya Bhadhuri) is a cheerful young woman, few know that she is terminally ill. She brings joy by leading a band that practices on her apartment''s terrace. Also living in the building is an alcoholic (Amitabh Bachchan), who is known only as the unfortunate son of a murderer. When he objects to the band''s music, Mili helps him bring love back into his life.',8;
execute L_Insert_DVD_Details	22847,'Dilwale dulhania le jayenge','Foreign Films',4,'5/24/1995','3:09:00','NTSC','Hindi','Aditya','Chopra','Yash Raj Films Home Entertainment ','Rahul and Simran fall in love while travelling in Europe on an inter-rail holiday. Simran''s father, settled in London for twenty-two years, is determined that his daughter should marry a family friend, back in their homeland of rural Punjab. All his plans undergo serious revision once the family travels to India and Rahul also shows up.',7;
execute L_Insert_DVD_Details	22499,'Lagaan : once upon a time in India','Foreign Films',4,'3/8/2001','3:45:00','NTSC','Hindi','Ashutosh','Gowarikar','Culver City, Calif.','An arrogant British Army captain forces a bet on a group of farmers. If they can win a cricket match against the army team, they will not have to pay the tax called lagaan for three years.',6;

select * from DVD_Details;

go

create proc L_Insert_DVD_Table @Media_ID as int, @ISBN_No as int, @Bought_Date as date
as
begin
declare @msg varchar(100), @pub_year int, @lib_opened_year int;
select @pub_year = Year(DVD_Details_Release_Date) from DVD_Details where DVD_Details_ISBN_No = @ISBN_No;
select @lib_opened_year = Library.Library_Year_Opened from Library, Media where Library.Library_ID = Media.Media_Library_ID and Media.Media_ID = @Media_ID;
if Year(@Bought_Date) < @pub_year or Year(@Bought_Date) < @lib_opened_year
begin
	set @msg = 'Error in DVD_Bought_Date value. Should be later than Published date and Library opening year';
	Raiserror(@msg,16,1);
end;
insert into DVD(DVD_Media_ID, DVD_ISBN_No, DVD_Bought_Date) values(@Media_ID, @ISBN_No, @Bought_Date);
end;

go

execute L_Insert_DVD_Table 	890400,22393,'9/15/2017';
execute L_Insert_DVD_Table 	890401,23620,'6/19/2006';
execute L_Insert_DVD_Table 	890402,22916,'12/28/2016';
execute L_Insert_DVD_Table 	890403,21645,'12/14/2017';
execute L_Insert_DVD_Table 	890404,22353,'9/13/2008';
execute L_Insert_DVD_Table 	890405,23631,'1/25/2009';
execute L_Insert_DVD_Table 	890406,23146,'4/18/2010';
execute L_Insert_DVD_Table 	890407,22956,'3/1/2015';
execute L_Insert_DVD_Table 	890408,22847,'8/7/2000';
execute L_Insert_DVD_Table 	890409,22499,'10/27/2007';
execute L_Insert_DVD_Table 	900400,22393,'9/15/2016';
execute L_Insert_DVD_Table 	900401,23620,'6/19/2006';
execute L_Insert_DVD_Table 	900402,22916,'12/28/2016';
execute L_Insert_DVD_Table 	900403,21645,'12/14/2017';
execute L_Insert_DVD_Table 	900404,22353,'9/13/2008';
execute L_Insert_DVD_Table 	900405,23631,'1/25/2009';
execute L_Insert_DVD_Table 	900406,23146,'4/18/2010';
execute L_Insert_DVD_Table 	900407,22956,'3/1/2015';
execute L_Insert_DVD_Table 	900408,22847,'8/7/2000';
execute L_Insert_DVD_Table 	900409,22499,'10/27/2007';

select * from DVD;

go

--drop proc L_Insert_CD_Details;
create proc L_Insert_CD_Details @Int_ID as int, @Title as varchar(100), @Genre as varchar(50), 
	@Release_Date as date, @Author_First_Name as varchar(30), @Author_Last_Name as varchar(30), 
	@Publisher as varchar(50), @Summary as varchar(100), @Price as int, @Language as varchar(30), @Length as varchar(30)
as
begin
insert into dbo.CD_Details(CD_Details_Internal_ID, CD_Details_Title, CD_Details_Length, CD_Details_Genre, CD_Details_Release_Date, CD_Details_Author_First_Name, CD_Details_Author_Last_Name, CD_Details_Publisher,CD_Details_Summary,CD_Details_Price, CD_Details_Language) values(@Int_ID, @Title, @Length, @Genre, @Release_Date, @Author_First_Name, @Author_Last_Name, @Publisher, @Summary, @Price, @Language);
end;

go

execute L_Insert_CD_Details	26000,'Greatest hits, the ballet','Ballet, Music','10/1/1989','','','CBS Records','Ballets -- Excerpts Orchestral music',10, 'English', '';
execute L_Insert_CD_Details	26001,'Road less traveled','Country music','11/3/1994','Lauren','Alaina','Mercury Nashville','Country music',7, 'English', '';
execute L_Insert_CD_Details	26002,'Attending : medicine, mindfulness, and humanity','Physician-patient relations','8/17/2016','Ronald','Epstein','Simon & Schuster Audio','Drawing on his clinical experiences and current research, and exploring four foundations of mindfulness—Attention, Curiosity, Beginner’s Mind, and Presence—Dr. Epstein introduces a revolutionary concept: by looking inward, health care practitioners can grow their capacity to provide high-quality care and the resilience to be there when their patients need them.',10, 'English','';
execute L_Insert_CD_Details	26003,'Kids in motion','Children''s exercise, Children''s songs','7/6/1987','Steve','Millang','Youngheart Music','Activities with games, exercises, and songs for developing physical fitness.',8, 'English', '';
execute L_Insert_CD_Details	26004,'Music from India','Sitar, Raaga music','8/5/1991','Ram','Chandra','LaserLight','Raga bhairava (21:24) -- Raga Malakosha (19:48).',10, 'Hindi', '';
execute L_Insert_CD_Details	26005,'When the wind blows','Fiction, Mystery','10/23/1947','James','Patterson','Books on Tape','Frannie O''Neill is a young and talented veterinarian living in Colorado. Plagued by the mysterious murder of her husband, Frannie tries to find forgetfulness in her work.',9, 'English', '';
execute L_Insert_CD_Details	26006,'World anthems','World Music','2/3/1998','Donald','Fraser','BMG Music','National songs, World music',8, 'English', '';
execute L_Insert_CD_Details	26007,'Harry Potter and the sorcerer''s stone','Juvenile fiction','10/4/1999','J.K.','Rowling','Random House Audio','Rescued from the outrageous neglect of his aunt and uncle, a young boy with a great destiny proves his worth while attending Hogwarts School for Wizards and Witches',8, 'English', '';
execute L_Insert_CD_Details	26008,'The rescue','Fiction, Firefighters','8/5/2000','Nicholas','Sparks','Time Warner AudioBooks','Fire fighters -- Fiction.',15, 'English', '';
execute L_Insert_CD_Details	26009,'Classics for relaxation : gentle dawn','Music, Relaxation','9/12/2003','Time-Life','Music','Time Life Music','Classics for relaxation : gentle dawn',8, 'English', '';

select * from CD_Details;

go

create proc L_Insert_CD_Table @Media_ID as int, @Int_ID as int, @Bought_Date as date
as
begin
declare @msg varchar(100), @pub_year int, @lib_opened_year int;
select @pub_year = Year(CD_Details_Release_Date) from CD_Details where CD_Details_Internal_ID = @Int_ID;
select @lib_opened_year = Library.Library_Year_Opened from Library, Media where Library.Library_ID = Media.Media_Library_ID and Media.Media_ID = @Media_ID;
if Year(@Bought_Date) < @pub_year or Year(@Bought_Date) < @lib_opened_year
begin
	set @msg = 'Error in CD_Bought_Date value. Should be later than Release date and Library opening year';
	Raiserror(@msg,16,1);
end;
insert into CD(CD_Media_ID, CD_Internal_ID, CD_Bought_Date) values(@Media_ID, @Int_ID, @Bought_Date);
end;

go

execute L_Insert_CD_Table	890600,26000,'11/26/1995';
execute L_Insert_CD_Table	890601,26001,'12/10/1995';
execute L_Insert_CD_Table	890602,26002,'10/14/2016';
execute L_Insert_CD_Table	890603,26003,'12/28/2004';
execute L_Insert_CD_Table	890604,26004,'10/12/2014';
execute L_Insert_CD_Table	890605,26005,'11/7/1979';
execute L_Insert_CD_Table	890606,26006,'10/16/2003';
execute L_Insert_CD_Table	890607,26007,'10/19/2009';
execute L_Insert_CD_Table	890608,26008,'11/16/2007';
execute L_Insert_CD_Table	890609,26009,'11/13/2014';
execute L_Insert_CD_Table	900600,26000,'11/26/1999';
execute L_Insert_CD_Table	900601,26001,'11/10/1996';
execute L_Insert_CD_Table	900602,26002,'10/14/2016';
execute L_Insert_CD_Table	900603,26003,'12/28/2004';
execute L_Insert_CD_Table	900604,26004,'9/12/2008';
execute L_Insert_CD_Table	900605,26005,'10/7/1978';
execute L_Insert_CD_Table	900606,26006,'9/16/2013';
execute L_Insert_CD_Table	900607,26007,'11/19/2014';
execute L_Insert_CD_Table	900608,26008,'11/16/2016';
execute L_Insert_CD_Table	900609,26009,'12/13/2004';

go

select * from CD;

go

--drop proc L_Insert_Library_Member;
create proc L_Insert_Library_Member @Mem_ID as int, @Lib_ID as int, @Parent_ID as int, 
	@First_Name as varchar(30), @Last_Name as varchar(30), @DOB as date, @Address as varchar(100),
	@City as varchar(20), @State as char(2), @Zip_code as int
as
begin

declare @curr_date as date, @date_diff as int, @msg as varchar(50);

--Check for child under age 18 to have a link to parent id
set @curr_date = GETDATE();
set @DOB = DATEADD(DAY, 1, @DOB);
if YEAR(@DOB) = YEAR(@curr_date)
    set @date_diff = DATEDIFF(year, @DOB, @curr_date);
else 
	if YEAR(@curr_date) > YEAR(@DOB) 
        AND MONTH(@curr_date) >= MONTH(@DOB)
        AND DAY(@curr_date) >= DAY(@DOB)
		set @date_diff = DATEDIFF(YEAR, @DOB, @curr_date)
else
    set @date_diff = DATEDIFF(YEAR, @DOB, @curr_date) - 1
if (@date_diff < 18 AND @Parent_ID = Null)
begin
	set @msg = 'Error in data entered value. Child under 18 years should have Parent ID entered';
	Raiserror(@msg,16,1);
end;

--Check for zip code to be among enrolled library or neighboring libraries.
if (@Zip_code NOT IN (Select Library_ZipCode from Library;))
begin
	set @msg = 'Error in data entered value. Zip Code should be among the list of neighboring libraries';
	Raiserror(@msg,16,1);
end;

insert into dbo.Library_Member(Library_Member_ID, Library_Member_Library_ID, Library_Member_Parent_ID, Library_Member_First_Name, Library_Member_Last_Name, Library_Member_DOB, Library_Member_Address,Library_Member_City,Library_Member_State, Library_Member_Zip_code) 
values(@Mem_ID, @Lib_ID, @Parent_ID, @First_Name, @Last_Name, @DOB, @Address, @City, @State, @Zip_code);
end;

go

--Max limit for int data type -2147483648 to 2147483647

execute L_Insert_Library_Member	890001000,89,0,'John','Nova','7/8/1984','23, Washington Ave.','Mount Prospect','IL',60056;
execute L_Insert_Library_Member	890001001,89,890001000,'Mary','Nova','8/3/2008','23, Washington Ave.','Mount Prospect','IL',60056;
execute L_Insert_Library_Member	890001002,89,890001000,'Nicki','Nova','7/4/2006','23, Washington Ave.','Mount Prospect','IL',60056;
execute L_Insert_Library_Member	890001003,89,Null,'Mona','Smith','8/4/1975','40, Roadway Dr','Mount Prospect','IL',60056;
execute L_Insert_Library_Member	890001004,89,Null,'Riddley','Smith','12/23/1972','40, Roadway Dr','Mount Prospect','IL',60056;
execute L_Insert_Library_Member	890001005,89,890001004,'Zack','Smith','9/30/2012','40, Roadway Dr','Mount Prospect','IL',60056;
execute L_Insert_Library_Member	890001006,89,Null,'Rena','Xavier','8/23/1979','2400, Pine Rd','Mount Prospect','IL',60056;
execute L_Insert_Library_Member	890001007,89,Null,'Iris','Johnson','4/18/1990','3401, Wacker Dr','Mount Prospect','IL',60056;
execute L_Insert_Library_Member	890001008,89,Null,'Mike','Williams','6/5/1999','4509, Treehouse Ave','Mount Prospect','IL',60056;
execute L_Insert_Library_Member	890001009,89,Null,'Julie','Xo','7/3/2000','78, Windy way','Mount Prospect','IL',60056;

execute L_Insert_Library_Member	900001000,90,Null,'James','Jones','5/18/1983','78, Laraway Dr','Arlington Heights','IL',60004;
execute L_Insert_Library_Member	900001001,90,900001000,'Robert','Jones','9/23/2007','78, Laraway Dr','Arlington Heights','IL',60004;
execute L_Insert_Library_Member	900001002,90,900001000,'Michael','Jones','7/14/2007','78, Laraway Dr','Arlington Heights','IL',60004;
execute L_Insert_Library_Member	900001003,90,Null,'William','Brown','8/14/1979','6701, Runaway Dr','Arlington Heights','IL',60004;
execute L_Insert_Library_Member	900001004,90,Null,'Patricia','Brown','9/20/1982','6701, Runaway Dr','Arlington Heights','IL',60004;
execute L_Insert_Library_Member	900001005,90,900001004,'Jennifer','Brown','8/27/2014','6701, Runaway Dr','Arlington Heights','IL',60004;
execute L_Insert_Library_Member	900001006,90,Null,'Elizabeth','Miller','6/20/1980','4508, Lotto Ave.','Arlington Heights','IL',60004;
execute L_Insert_Library_Member	900001007,90,Null,'Linda','Wilson','11/28/1992','6502, Park Dr.','Arlington Heights','IL',60004;
execute L_Insert_Library_Member	900001008,90,Null,'David','Moore','8/15/1998','302, Wick Rd','Arlington Heights','IL',60004;
execute L_Insert_Library_Member	900001009,90,Null,'Richard','Taylor','8/23/2001','2103, Yoyo Ave','Arlington Heights','IL',60004;

select * from Library_Member;

go

create proc L_Update_Library_Member @Mem_ID as int, @Parent_ID as int, 
	@Address as varchar(100), @City as varchar(20), @State as char(2), @Zip_code as int
as
begin

-- Only the above fields in the parameter list can be updated. The below fields Lib_ID, First_Name, Last_Name and DOB 
-- cannot be altered. 
-- @Lib_ID as int, @First_Name as varchar(30), @Last_Name as varchar(30), @DOB as date, 

declare @curr_date as date, @date_diff as int, @msg as varchar(50);

--Check for child under age 18 to have a link to parent id
set @curr_date = GETDATE();
set @DOB = DATEADD(DAY, 1, @DOB);
if YEAR(@DOB) = YEAR(@curr_date)
    set @date_diff = DATEDIFF(year, @DOB, @curr_date);
else 
	if YEAR(@curr_date) > YEAR(@DOB) 
        AND MONTH(@curr_date) >= MONTH(@DOB)
        AND DAY(@curr_date) >= DAY(@DOB)
		set @date_diff = DATEDIFF(YEAR, @DOB, @curr_date)
else
    set @date_diff = DATEDIFF(YEAR, @DOB, @curr_date) - 1
if (@date_diff < 18 AND @Parent_ID = Null)
begin
	set @msg = 'Error in data entered value. Child under 18 years should have Parent ID entered';
	Raiserror(@msg,16,1);
end;

--Check for zip code to be among enrolled library or neighboring libraries.
if (@Zip_code NOT IN (Select Library_ZipCode from Library;))
begin
	set @msg = 'Error in data entered value. Zip Code should be among the list of neighboring libraries';
	Raiserror(@msg,16,1);
end;

update dbo.Library_Member set Library_Member_Parent_ID = @Parent_ID where Library_Member_ID = @Mem_ID;
update dbo.Library_Member set Library_Member_Address = @Address where Library_Member_ID = @Mem_ID;
update dbo.Library_Member set Library_Member_City = @City where Library_Member_ID = @Mem_ID;
update dbo.Library_Member set Library_Member_State = @State where Library_Member_State = @State;
update dbo.Library_Member set Library_Member_Zip_Code = @Zip_code where Library_Member_Zip_code = @Zip_code;

end;

go

--drop proc L_Insert_Employee_Staff;
create proc L_Insert_Employee_Staff @Staff_ID as int, @Lib_Mem_ID as int, @Des as varchar(30), 
	@SSN as int, @Joining_Date as date, @Hours_Worked as varchar(30)
as
begin
insert into dbo.Employee_Staff(Employee_Staff_ID, Employee_Staff_Library_Member_ID, Employee_Staff_Designation, Employee_Staff_SSN, Employee_Staff_Joining_Date, Employee_Staff_Hours_Worked) 
values(@Staff_ID, @Lib_Mem_ID, @Des, @SSN, @Joining_Date, @Hours_Worked);
end;
go

execute L_Insert_Employee_Staff	891001000,890001007,'Manager',22389123,'7/7/2008','8 am - 5 pm';
execute L_Insert_Employee_Staff	891001002,890001003,'Librarian',45890489,'9/27/2010','8 am - 5 pm';
execute L_Insert_Employee_Staff	901001000,900001000,'Manager',89034129,'8/13/2009','8 am - 5 pm';
execute L_Insert_Employee_Staff	901001002,900001003,'Librarian',34813909,'8/14/2005','8 am - 5 pm';

select * from Employee_Staff;

go

--drop proc L_Insert_Login_Table;
create proc L_Insert_Login_Table @ID as int, @Name as varchar(35), @UserName as varchar(15), 
	@Pass as varchar(15), @LoginDT as varchar(30), @LogoutDT as varchar(30), @Mem_ID as int
as
begin
insert into dbo.Login_Table(Login_ID, Login_Name, Login_UserName, Login_Password, Login_Library_Member_ID) values(@ID, @Name, @UserName, @Pass, @Mem_ID);
insert into dbo.Login_Table(Login_DateTime) values(cast(@LoginDT as datetime)) where Login_Table.Login_ID = @ID;
insert into dbo.Login_Table(LogOut_DateTime) values(cast(@LogoutDT as datetime)) where Login_Table.Login_ID = @ID;
end;

go

execute L_Insert_Login_Table 1,'John_Nova','jnova8','K5prUqecr','20170514 01:45:7 PM','20170514 02:00:17 PM',890001000;
execute L_Insert_Login_Table 2,'Mary_Nova','mnovahappy','asEDUj6','20170124 02:12:27 AM','20170124 02:42:27 AM',890001001;
execute L_Insert_Login_Table 3,'Nicki_Nova','nicn','uwRab','20140804 02:34:18 AM','20140804 03:00:18 AM',890001002;
execute L_Insert_Login_Table 4,'Mona_Smith','smithmona5','arUsegu','20120808 10:15:28 AM','20120808 10:25:28 AM',890001003;
execute L_Insert_Login_Table 5,'Riddley_Smith','riddleys','G10prU','20160312 09:25:19 AM','20160312 09:35:19 AM',890001004;
execute L_Insert_Login_Table 6,'Zack_Smith','z678s','ABEDUj89','20130215 07:12:16 PM','20130215 07:23:16 PM',890001005;
execute L_Insert_Login_Table 7,'Rena_Xavier','renaxavier','wurab67','20140514 02:35:7 PM','20140514 02:40:7 PM',890001006;
execute L_Insert_Login_Table 8,'Iris_Johnson','irisjohnson','uyr57u','20170204 12:30:17 PM','20170204 12:45:17 PM',890001007;
execute L_Insert_Login_Table 9,'Mike_Williams','mwill890','UH3489H','20121023 08:19:17 PM','20121023 08:29:17 PM',890001008;
execute L_Insert_Login_Table 10,'Julie_Xo','juliexo45','UY345fj','20150824 07:40:23 PM','20150824 08:00:23 PM',890001009;
execute L_Insert_Login_Table 11,'James_Jones','James_J2','OIO349','20160524 10:45:17 AM','20160524 10:55:40 AM',900001000;
execute L_Insert_Login_Table 12,'Robert_Jones','RJones3','K23HKkkl','20150524 01:45:7 PM','20150524 01:55:7 PM',900001001;
execute L_Insert_Login_Table 13,'Michael_Jones','MichaelJ','U3jkjke','20140724 02:50:7 PM','20140724 02:52:13 PM',900001002;
execute L_Insert_Login_Table 14,'William_Brown','WillBrown','H89yuerj','20150226 06:23:27 PM','20150226 06:28:27 PM',900001003;
execute L_Insert_Login_Table 15,'Patricia_Brown','PatriciaBrown','hhhH345','20160424 11:23:17 PM','20160424 11:28:17 PM',900001004;
execute L_Insert_Login_Table 16,'Jennifer_Brown','JenniferBrown','yr456t','20150324 12:04:16 PM','20150324 12:24:16 PM',900001005;
execute L_Insert_Login_Table 17,'Elizabeth_Miller','ElizM','nbb456','20160824 11:40:17 PM','20160824 11:45:17 PM',900001006;
execute L_Insert_Login_Table 18,'Linda_Wilson','LinWil34','iunn389','20160924 12:18:17 PM','20160924 12:28:17 PM',900001007;
execute L_Insert_Login_Table 19,'David_Moore','DMoore345','ope34n','20120713 12:14:3 PM','20120713 12:24:3 PM',900001008;
execute L_Insert_Login_Table 20,'Richard_Taylor','RichardT23','ri23jkk','20151327 12:15:23 PM','20151327 12:25:23 PM',900001009;

go

select * from Login_Table;

go

--drop proc L_Insert_Update_Media_Check_Out;
create proc L_Insert_Update_Media_Check_Out @ID as int, @Member_ID as int, @Media_ID as int, @Check_Out_Date as date, @Check_Out_Due_Date as date
as
begin
	declare @med_stat as varchar(30), @med_format as varchar(30), @msg as varchar(100), @media_bdate as date;
	declare @hold_table as table
	(
		ht_queue_no int,
		ht_media_id int,
		ht_member_id int
	);
	declare @media_due_date as date;

	/*Check for dates while doing data entry */
	set @media_bdate = '';
/*	set @media_bdate =
		case
			when @med_format = 'Book' then (select Book_Bought_Date from Book where Book_Media_ID = @Media_ID)
			when @med_format = 'eBook' then (select eBook_Bought_Date from eBook where eBook_Media_ID = @Media_ID)
			when @med_format = 'Journal' then (select Journal_Bought_Date from Journal where Journal_Media_ID = @Media_ID)
			when @med_format = 'eJournal' then (select eJournal_Bought_Date from eJournal where eJournal_Media_ID = @Media_ID)
			when @med_format = 'Magazine' then (select Magazine_Bought_Date from Magazine where Magazine_Media_ID = @Media_ID)
			when @med_format = 'Digital_Magazine' then (select Digital_Magazine_Bought_Date from Digital_Magazine where Digital_Magazine_Media_ID = @Media_ID)
			when @med_format = 'CD' then (select CD_Bought_Date from CD where CD_Media_ID = @Media_ID)
			when @med_format = 'DVD' then (select DVD_Bought_Date from DVD where DVD_Media_ID = @Media_ID)
--			else 'Null'
		end;
*/

	if @med_format = 'Book' 
		select @media_bdate = Book_Bought_Date from Book where Book_Media_ID = @Media_ID;
	else if @med_format = 'eBook' 
		select @media_bdate = eBook_Bought_Date from eBook where eBook_Media_ID = @Media_ID;
	else if @med_format = 'Journal' 
		select @media_bdate = Journal_Bought_Date from Journal where Journal_Media_ID = @Media_ID;
	else if @med_format = 'eJournal' 
		select @media_bdate = eJournal_Bought_Date from eJournal where eJournal_Media_ID = @Media_ID;
	else if @med_format = 'Magazine' 
		select @media_bdate = Magazine_Bought_Date from Magazine where Magazine_Media_ID = @Media_ID;
	else if @med_format = 'Digital Magazine' 
		select @media_bdate = Digital_Magazine_Bought_Date from Digital_Magazine where Digital_Magazine_Media_ID = @Media_ID;
	else if @med_format = 'CD' 
		select @media_bdate = CD_Bought_Date from CD where CD_Media_ID = @Media_ID;
	else if @med_format = 'DVD' 
		select @media_bdate = DVD_Bought_Date from DVD where DVD_Media_ID = @Media_ID;
	
	if @media_bdate = ''
	begin
		select @Media_ID as 'Media ID', @med_format as 'Format', @media_bdate as 'bought date', @Check_Out_Date as 'check out date';
		set @msg = 'Error in Data entered. Media not in the database.';
		Raiserror(@msg,16,1);
	end;
	if @media_bdate > @Check_Out_Date
	begin
		select @Media_ID as 'Media ID', @med_format as 'Format', @media_bdate as 'bought date', @Check_Out_Date as 'check out date';
		set @msg = 'Error in Data entered. Check out date is incorrect';
		Raiserror(@msg,16,1);
	end;

	/* Check for holds before checking out */
	insert into @hold_table(ht_queue_no, ht_media_id, ht_member_id) 
		select Media_Hold_Queue_No, Media_Hold_Media_ID, Media_Hold_Member_ID from Media_Hold where Media_Hold_Media_ID = @Media_ID;
	if (select ht_queue_no from @hold_table where ht_member_id = @Member_ID) <> null
	begin
		if(ht_queue_no != 1)
		begin
			select @med_stat as 'Media Status', @med_format as 'Format', @Media_ID as 'Media ID';
			set @msg = 'Media is on hold by another member and cannot be renewed.';
			Raiserror(@msg,16,1);
		end;
		else
		begin
			--update the hold table by removing the member's hold and updating the other members queue number.
			delete from Media_Hold where Media_Hold.Media_Hold_Member_ID = @Member_ID;
			update Media_Hold set Media_Hold_Queue_No = Media_Hold_Queue_No -1 where Media_Hold.Media_Hold_Media_ID = @Media_ID;
		end;
	end;
	else
	begin
		if(select COUNT(*) from @hold_table) != 0
		begin
			select @med_stat as 'Media Status', @med_format as 'Format', @Media_ID as 'Media ID';
			set @msg = 'Media is on hold by another member and cannot be renewed.';
			Raiserror(@msg,16,1);
		end;
	end;

	select @med_stat = Media_Status, @med_format = Media_Format from Media where @Media_ID = Media_ID;
	if @med_stat = 'Returned' or @med_stat = 'On shelf'
	begin
		--New checkout and Media table needs to be updated.
		update Media set Media_Status = 'Checked out' where Media_ID = @Media_ID;
	end;
	else if @med_stat = 'Lost' or @med_stat = 'Damaged'
	begin
		select @med_stat as 'Media Status', @med_format as 'Format', @Media_ID as 'Media ID';
		set @msg = 'Error in Data entered. Media is lost or damaged.';
		Raiserror(@msg,16,1);		
	end;
	else if @med_stat = 'Due'
	begin
		select * into #chk_out_table from Media_Check_Out where Media_Check_Out_Media_ID = @Media_ID;	
		if (select Media_Check_Out_Times_Renewed from #chk_out_table) = 2
		begin
			select @med_stat as 'Media Status', @med_format as 'Format', @Media_ID as 'Media ID';
			set @msg = 'Media renewed 2 times and cannot be renewed further.';
			Raiserror(@msg,16,1);		
		end;
		else
		begin 
			update Media_Check_Out set Media_Check_Out_Times_Renewed += 1 where Media_Check_Out_Media_ID = @Media_ID; 
			--Get the old due date and add 3 more weeks to it and then update the checkout table
			select @media_due_date = Media_Check_Out_Due_Date from Media_Check_Out where Media_Check_Out_Media_ID = @Media_ID;
			set @media_due_date = DATEADD(dd, 21, @media_due_date);
			update Media_Check_Out set Media_Check_Out_Due_Date = @media_due_date where Media_Check_Out_Media_ID = @Media_ID; 
		end;
		delete #chk_out_table;		
	end;
	else
	begin
		--set the due date to be 3 weeks from the check out date and it does not need to be passed
		set @media_due_date = DATEADD(dd, 21, @Check_Out_Date);
		insert into Media_Check_Out(Media_Check_Out_ID, Media_Check_Out_Member_ID, Media_Check_Out_Media_ID, Media_Check_Out_Date,
		Media_Check_Out_Due_Date) values(@ID, @Member_ID, @Media_ID, @Check_Out_Date, @media_due_date);
	end;

end;

go

execute L_Insert_Update_Media_Check_Out	1,890001000,890001,'9/1/2017','9/8/2017';
execute L_Insert_Update_Media_Check_Out	2,890001001,890003,'9/1/2017','9/8/2017';
execute L_Insert_Update_Media_Check_Out	3,890001002,890005,'8/25/2017','9/1/2017';
--execute L_Insert_Update_Media_Check_Out	4,890001003,890006,'8/23/2016','8/30/2016';
--execute L_Insert_Update_Media_Check_Out	5,890001004,890007,'3/24/2016','3/31/2016';
--execute L_Insert_Update_Media_Check_Out	6,890001005,890008,'8/18/2017','8/25/2017';
execute L_Insert_Update_Media_Check_Out	7,890001006,890009,'8/29/2017','9/5/2017';
execute L_Insert_Update_Media_Check_Out	8,890001007,890011,'9/1/2017','9/8/2017';
execute L_Insert_Update_Media_Check_Out	9,890001008,900003,'9/1/2017','9/8/2017';
execute L_Insert_Update_Media_Check_Out	10,890001009,900005,'8/25/2017','9/1/2017';
--execute L_Insert_Update_Media_Check_Out	11,900001000,900006,'9/12/2015','9/19/2015';
--execute L_Insert_Update_Media_Check_Out	12,900001001,900007,'2/16/2014','2/23/2014';
--execute L_Insert_Update_Media_Check_Out	13,900001002,900008,'8/18/2017','8/25/2017';
execute L_Insert_Update_Media_Check_Out	14,900001003,900010,'9/1/2017','9/8/2017';
execute L_Insert_Update_Media_Check_Out	15,900001004,900011,'9/1/2017','9/8/2017';
execute L_Insert_Update_Media_Check_Out	16,900001005,890200,'9/1/2017','9/8/2017';
execute L_Insert_Update_Media_Check_Out	17,900001006,890201,'9/1/2017','9/8/2017';
execute L_Insert_Update_Media_Check_Out	18,900001007,890203,'9/1/2017','9/8/2017';
execute L_Insert_Update_Media_Check_Out	19,900001008,890205,'8/25/2017','9/1/2017';
execute L_Insert_Update_Media_Check_Out	20,900001009,890206,'7/5/2017','7/12/2017';
execute L_Insert_Update_Media_Check_Out	21,890001000,890207,'7/5/2017','7/12/2017';
--execute L_Insert_Update_Media_Check_Out	22,890001001,890208,'8/17/2017','8/24/2017';
execute L_Insert_Update_Media_Check_Out	23,890001002,890209,'8/25/2017','9/1/2017';
execute L_Insert_Update_Media_Check_Out	24,890001003,900200,'8/29/2017','9/5/2017';
execute L_Insert_Update_Media_Check_Out	25,890001004,900203,'8/25/2017','9/1/2017';
execute L_Insert_Update_Media_Check_Out	26,890001005,900205,'8/29/2017','9/5/2017';
execute L_Insert_Update_Media_Check_Out	27,890001006,900206,'3/2/2017','3/9/2017';
execute L_Insert_Update_Media_Check_Out	28,890001007,900207,'3/2/2017','3/9/2017';
--execute L_Insert_Update_Media_Check_Out	29,890001008,900208,'8/16/2017','8/23/2017';
execute L_Insert_Update_Media_Check_Out	30,890001009,900210,'8/29/2017','9/5/2017';
execute L_Insert_Update_Media_Check_Out	31,900001000,891200,'8/25/2017','9/1/2017';
execute L_Insert_Update_Media_Check_Out	32,900001001,891201,'8/29/2017','9/5/2017';
execute L_Insert_Update_Media_Check_Out	33,900001002,891203,'8/25/2017','9/1/2017';
execute L_Insert_Update_Media_Check_Out	34,900001003,891205,'8/25/2017','9/1/2017';
--execute L_Insert_Update_Media_Check_Out	35,900001004,891206,'4/25/2014','5/2/2014';
--execute L_Insert_Update_Media_Check_Out	36,900001005,891207,'4/25/2016','5/2/2016';
--execute L_Insert_Update_Media_Check_Out	37,900001006,891208,'8/15/2017','8/22/2017';
execute L_Insert_Update_Media_Check_Out	38,900001007,891209,'8/29/2017','9/5/2017';
execute L_Insert_Update_Media_Check_Out	39,900001008,901200,'8/29/2017','9/5/2017';
execute L_Insert_Update_Media_Check_Out	40,900001009,901203,'8/25/2017','9/1/2017';
execute L_Insert_Update_Media_Check_Out	41,890001000,901205,'8/25/2017','9/1/2017';
--execute L_Insert_Update_Media_Check_Out	42,890001001,901206,'4/3/2017','4/10/2017';
--execute L_Insert_Update_Media_Check_Out	43,890001002,901207,'4/3/2017','4/10/2017';
--execute L_Insert_Update_Media_Check_Out	44,890001003,901208,'8/15/2017','8/22/2017';
execute L_Insert_Update_Media_Check_Out	45,890001004,891400,'8/25/2017','9/1/2017';
execute L_Insert_Update_Media_Check_Out	46,890001005,891401,'8/29/2017','9/5/2017';
execute L_Insert_Update_Media_Check_Out	47,890001006,891403,'8/25/2017','9/1/2017';
execute L_Insert_Update_Media_Check_Out	48,890001007,891405,'8/25/2017','9/1/2017';
execute L_Insert_Update_Media_Check_Out	49,890001008,891406,'9/2/2014','9/9/2014';
execute L_Insert_Update_Media_Check_Out	50,890001009,891407,'9/2/2015','9/9/2015';
--execute L_Insert_Update_Media_Check_Out	51,900001000,891408,'8/15/2017','8/22/2017';
execute L_Insert_Update_Media_Check_Out	52,900001001,891409,'8/29/2017','9/5/2017';
execute L_Insert_Update_Media_Check_Out	53,900001002,901400,'8/29/2017','9/5/2017';
execute L_Insert_Update_Media_Check_Out	54,900001003,901403,'8/25/2017','9/1/2017';
execute L_Insert_Update_Media_Check_Out	55,900001004,901405,'8/25/2017','9/1/2017';
execute L_Insert_Update_Media_Check_Out	56,900001005,901406,'11/2/2014','11/9/2014';
execute L_Insert_Update_Media_Check_Out	57,900001006,901407,'11/2/2015','11/9/2015';
--execute L_Insert_Update_Media_Check_Out	58,900001007,901408,'8/10/2017','8/17/2017';
execute L_Insert_Update_Media_Check_Out	59,900001008,890800,'8/25/2017','9/1/2017';
execute L_Insert_Update_Media_Check_Out	60,900001009,890801,'8/29/2017','9/5/2017';
execute L_Insert_Update_Media_Check_Out	61,890001000,890803,'8/25/2017','9/1/2017';
execute L_Insert_Update_Media_Check_Out	62,890001001,890805,'8/25/2017','9/1/2017';
--execute L_Insert_Update_Media_Check_Out	63,890001002,890806,'2/2/2012','2/9/2012';
--execute L_Insert_Update_Media_Check_Out	64,890001003,890807,'2/2/2017','2/9/2017';
--execute L_Insert_Update_Media_Check_Out	65,890001004,890808,'8/10/2017','8/17/2017';
execute L_Insert_Update_Media_Check_Out	66,890001005,890809,'8/30/2017','9/6/2017';
execute L_Insert_Update_Media_Check_Out	67,890001006,890810,'8/30/2017','9/6/2017';
execute L_Insert_Update_Media_Check_Out	68,890001007,900802,'8/25/2017','9/1/2017';
execute L_Insert_Update_Media_Check_Out	69,890001008,900804,'8/25/2017','9/1/2017';
--execute L_Insert_Update_Media_Check_Out	70,890001009,900805,'3/30/2015','4/6/2015';
--execute L_Insert_Update_Media_Check_Out	71,900001000,900806,'3/30/2015','4/6/2015';
--execute L_Insert_Update_Media_Check_Out	72,900001001,900807,'8/10/2017','8/17/2017';
--execute L_Insert_Update_Media_Check_Out	73,900001002,891000,'8/10/2017','8/17/2017';
execute L_Insert_Update_Media_Check_Out	74,900001003,891001,'8/30/2017','9/6/2017';
--execute L_Insert_Update_Media_Check_Out	75,900001004,891003,'8/10/2017','8/17/2017';
execute L_Insert_Update_Media_Check_Out	76,900001005,891005,'8/25/2017','9/1/2017';
execute L_Insert_Update_Media_Check_Out	77,900001006,891006,'5/2/2014','5/9/2014';
execute L_Insert_Update_Media_Check_Out	78,900001007,891007,'5/2/2014','5/9/2014';
--execute L_Insert_Update_Media_Check_Out	79,900001008,891008,'8/10/2017','8/17/2017';
execute L_Insert_Update_Media_Check_Out	80,900001009,891009,'8/30/2017','9/6/2017';
execute L_Insert_Update_Media_Check_Out	81,890001000,891010,'8/30/2017','9/6/2017';
--execute L_Insert_Update_Media_Check_Out	82,890001001,901002,'8/10/2017','8/17/2017';
execute L_Insert_Update_Media_Check_Out	83,890001002,901004,'8/25/2017','9/1/2017';
execute L_Insert_Update_Media_Check_Out	84,890001003,901005,'3/2/2014','3/9/2014';
execute L_Insert_Update_Media_Check_Out	85,890001004,901006,'3/2/2014','3/9/2014';
--execute L_Insert_Update_Media_Check_Out	86,890001005,901007,'8/10/2017','8/17/2017';
--execute L_Insert_Update_Media_Check_Out	87,890001006,890402,'8/10/2017','8/17/2017';
execute L_Insert_Update_Media_Check_Out	88,890001007,890404,'8/25/2017','9/1/2017';
--execute L_Insert_Update_Media_Check_Out	89,890001008,890405,'2/2/2012','2/9/2012';
--execute L_Insert_Update_Media_Check_Out	90,890001009,890406,'2/2/2012','2/9/2012';
--execute L_Insert_Update_Media_Check_Out	91,900001000,890407,'8/10/2017','8/17/2017';
execute L_Insert_Update_Media_Check_Out	92,890001000,890408,'8/30/2017','9/6/2017';
execute L_Insert_Update_Media_Check_Out	93,890001001,890409,'8/30/2017','9/6/2017';
execute L_Insert_Update_Media_Check_Out	94,890001002,900400,'8/30/2017','9/6/2017';
--execute L_Insert_Update_Media_Check_Out	95,890001003,900402,'8/10/2017','8/17/2017';
execute L_Insert_Update_Media_Check_Out	96,890001004,900404,'8/25/2017','9/1/2017';
--execute L_Insert_Update_Media_Check_Out	97,890001005,900405,'4/5/2012','4/12/2012';
--execute L_Insert_Update_Media_Check_Out	98,890001006,900406,'4/5/2012','4/12/2012';
--execute L_Insert_Update_Media_Check_Out	99,890001007,900407,'8/10/2017','8/17/2017';
execute L_Insert_Update_Media_Check_Out	100,890001008,900408,'8/30/2017','9/6/2017';
execute L_Insert_Update_Media_Check_Out	101,890001009,900409,'8/30/2017','9/6/2017';
--execute L_Insert_Update_Media_Check_Out	102,900001000,890600,'8/10/2017','8/17/2017';
execute L_Insert_Update_Media_Check_Out	103,900001001,890601,'8/30/2017','9/6/2017';
--execute L_Insert_Update_Media_Check_Out	104,900001002,890603,'8/10/2017','8/17/2017';
execute L_Insert_Update_Media_Check_Out	105,900001003,890605,'8/25/2017','9/1/2017';
--execute L_Insert_Update_Media_Check_Out	106,900001004,890606,'7/7/2010','7/14/2010';
--execute L_Insert_Update_Media_Check_Out	107,900001005,890607,'7/7/2010','7/14/2010';
--execute L_Insert_Update_Media_Check_Out	108,900001006,890608,'8/10/2017','8/17/2017';
execute L_Insert_Update_Media_Check_Out	109,900001007,890609,'8/30/2017','9/6/2017';
--execute L_Insert_Update_Media_Check_Out	110,900001008,900602,'8/10/2017','8/17/2017';
execute L_Insert_Update_Media_Check_Out	111,900001009,900604,'8/25/2017','9/1/2017';
--execute L_Insert_Update_Media_Check_Out	112,890001000,900605,'3/3/2014','3/10/2014';
--execute L_Insert_Update_Media_Check_Out	113,890001001,900606,'3/3/2014','3/10/2014';
--execute L_Insert_Update_Media_Check_Out	114,890001002,900607,'8/10/2017','8/17/2017';

go

select * from Media_Check_Out;

go

/* This media condition is just 'Lost' or 'Damaged' when informed by the Member to the Library Staff 
and not to be taken from the Library Media Table */
create proc L_Media_Check_In @member_id as int, @media_id as int, @media_condition as varchar(30)
as
begin
	declare @dues_flag varchar(3), @mformat varchar(30), @media_dues int;

	select * into #temp_checkout_table from Media_Check_Out where Media_Check_Out_Media_ID = @media_id;
	select @dues_flag = #temp_checkout_table.Media_Check_Out_Member_Dues_Updated from #temp_checkout_table;
	
	select @mformat = Media_Format from Media where Media_ID = @media_id;
	set @media_dues += (case(@mformat)
		when 'Book' then (select Book_Details_Price from Book_Details where Book_Details_ISBN_No = (select Book_ISBN_No from Book where Book_Media_ID = @media_id))
		when 'Journal' then (select Journal_Details_Price from Journal_Details where Journal_Details_ISSN_Number = (select Journal_ISSN_No from Journal where Journal_Media_ID = @media_id))
		when 'Magazine' then (select Magazine_Details_Price from Magazine_Details where Magazine_Details_Internal_ID = (select Magazine_Internal_ID from Magazine where Magazine_Media_ID = @media_id))
		when 'DVD' then (select DVD_Details_Price from DVD_Details where DVD_Details_ISBN_No = (select DVD_ISBN_No from DVD where DVD_Media_ID = @media_id))
		when 'CD' then (select CD_Details_Price from CD_Details where CD_Details_Internal_ID = (select CD_Internal_ID from CD where CD_Media_ID = @media_id))
		/*else (select CD_Details_Price from CD_Details where CD_Details_Internal_ID = (select CD_Internal_ID from CD where CD_Media_ID = @media_id))*/
		end);

	if (@media_condition = 'Lost' OR @media_condition = 'Damaged')
	begin
		if (@dues_flag = 'No')
		begin
			update Library_Member set Library_Member_Dues += @media_dues where Library_Member_ID = @member_id;
			update Media_Check_Out set Media_Check_Out_Member_Dues_Updated = 'Yes' where Media_Check_Out_Media_ID = @media_id;
		end;
		update Media set Media_Status = @media_condition where Media_ID = @media_id;
	end;
	else 
	begin
		if (@dues_flag = 'Yes')
		begin
			--Even though a media is returned when member fines are updated, $1 collection fee is charged. Media price is reversed.
			update Library_Member set Library_Member_Dues -= (@media_dues - 1) where Library_Member_ID = @member_id;
		end;
		--Media condition is set 'Returned' in Check in function. It is set to 'On Shelf' when books are sorted and replaced on shelf
		update Media set Media_Status = 'Returned' where Media_ID = @media_id;
	end;
	
	/* Delete the check out entry from the Media_Check_Out table */
	delete from Media_Check_Out where Media_Check_Out_ID = @media_id;

end;

go

--	drop proc L_Insert_Media_Hold;
create proc L_Insert_Media_Hold @mem_id as int, @med_id as int
as
begin
	declare @med_stat as varchar(30), @med_format as varchar(30), @msg as varchar(100), @med_hold_cnt as int, @queue_no as int;
	select @med_stat = Media_Status, @med_format = Media_Format from Media where @med_id = Media_ID;
	if @med_stat = 'Lost' or @med_stat = 'Damaged'
	begin
		select @med_stat as 'Media Status', @med_format as 'Format', @med_id as 'Media ID';
		set @msg = 'Error in Data entered. Media status does not match as checked out.';
		Raiserror(@msg,16,1);
	end;

	select @med_hold_cnt = Count(Media_Hold_Media_ID) from Media_Hold where Media_Hold_Media_ID = @med_id;
	if @med_hold_cnt < 3
		begin
			set @queue_no = @med_hold_cnt + 1;
			insert into Media_Hold(Media_Hold_Queue_No, Media_Hold_Media_ID, Media_Hold_Member_ID) values(@med_hold_cnt, @med_id, @mem_id);
		end;
	else
		begin
			select @med_hold_cnt as 'Media Hold count', @med_format as 'Format', @med_id as 'Media ID';
			set @msg = 'Maximum hold for the same media cannot be more than 3';
			Raiserror(@msg,16,1);
		end;	
end;

go

execute L_Insert_Media_Hold	890001001,890003;
execute L_Insert_Media_Hold	890001002,890003;
execute L_Insert_Media_Hold	890001007,890011;
execute L_Insert_Media_Hold	890001007,900003;
execute L_Insert_Media_Hold	890001008,900003;
execute L_Insert_Media_Hold	900001001,890200;
execute L_Insert_Media_Hold	900001002,890200;
execute L_Insert_Media_Hold	900001005,890200;
execute L_Insert_Media_Hold	900001007,890203;
execute L_Insert_Media_Hold	890001004,900203;
execute L_Insert_Media_Hold	900001000,891200;
execute L_Insert_Media_Hold	900001001,891203;
execute L_Insert_Media_Hold	900001002,891203;
execute L_Insert_Media_Hold	900001009,901203;
execute L_Insert_Media_Hold	890001004,891400;
execute L_Insert_Media_Hold	890001006,891403;
execute L_Insert_Media_Hold	900001003,901403;
execute L_Insert_Media_Hold	900001008,890800;
execute L_Insert_Media_Hold	890001000,890803;
execute L_Insert_Media_Hold	890001007,900802;
execute L_Insert_Media_Hold	900001002,891000;
execute L_Insert_Media_Hold	900001004,891003;
execute L_Insert_Media_Hold	890001001,901002;
execute L_Insert_Media_Hold	890001006,890402;
execute L_Insert_Media_Hold	890001003,900402;
execute L_Insert_Media_Hold	900001000,890600;
execute L_Insert_Media_Hold	900001002,890603;
execute L_Insert_Media_Hold	900001008,900602;

go

select * from Media_Hold;

go

