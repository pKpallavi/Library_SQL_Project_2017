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

insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Year_Opened,Library_Timings)values (89, 'Mount Propspect Public Library', '(847) 253-5675','10 S Emerson St', 'Mount Prospect','IL','60056', 1951, 'Monday 9AM–10PM Tuesday	9AM–10PM Wednesday	9AM–10PM Thursday	9AM–10PM Friday	9AM–10PMSaturday	9AM–5PM Sunday	12–5PM');
insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Year_Opened,Library_Timings)values (90, 'Arlington Heights Memorial Library', '(847) 392-0100','500 N Dunton Ave',' Arlington Heights', 'IL','60004', 1952, 'Monday 9AM–10PM Tuesday	9AM–10PM Wednesday	9AM–10PM Thursday	9AM–10PM Friday	9AM–10PMSaturday	9AM–5PM Sunday	12–5PM');
insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Timings)values (91, 'Prospect Heights Public Library', '(847) 259-3500','12 N Elm Street',' Prospect Heights', 'IL','60070','Monday 9AM–10PM Tuesday	9AM–10PM Wednesday	9AM–10PM Thursday	9AM–10PM Friday	9AM–10PMSaturday	9AM–5PM Sunday	12–5PM');
insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Timings)values (92, 'Evanston North Branch Library', '(847) 866-0330','2026 Central St',' Evanston', 'IL','60201','Monday 9AM–10PM Tuesday	9AM–10PM Wednesday	9AM–10PM Thursday	9AM–10PM Friday	9AM–10PMSaturday	9AM–5PM Sunday	12–5PM');
insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Timings)values (93, 'Jefferson Park Branch Chicago Public Library', '(312) 744-1998','5363 W Lawrence Ave','Chicago', 'IL','60630','Monday 9AM–10PM Tuesday	9AM–10PM Wednesday	9AM–10PM Thursday	9AM–10PM Friday	9AM–10PMSaturday	9AM–5PM Sunday	12–5PM');
insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Timings)values (94, 'Poplar Creek Public Library Sonya Crawshaw Branch', '(630) 372-0052','4300 Audrey Ln',' Hanover Park', 'IL',' 60133','Monday 9AM–10PM Tuesday	9AM–10PM Wednesday	9AM–10PM Thursday	9AM–10PM Friday	9AM–10PMSaturday	9AM–5PM Sunday	12–5PM');
insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Timings)values (95, 'Albany Park Library', '(773) 539-5450','3401 W Foster Ave',' Chicago', 'IL','60625','Monday 9AM–10PM Tuesday	9AM–10PM Wednesday	9AM–10PM Thursday	9AM–10PM Friday	9AM–10PMSaturday	9AM–5PM Sunday	12–5PM');
insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Timings)values (96, 'Conrad Sulzer Regional Library', '(312) 744-7616','4455 N Lincoln Ave',' Chicago', 'IL','60625','Monday 9AM–10PM Tuesday	9AM–10PM Wednesday	9AM–10PM Thursday	9AM–10PM Friday	9AM–10PMSaturday	9AM–5PM Sunday	12–5PM');
insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Timings)values (97, 'Mayfair Branch, Chicago Public Library ', '(312) 744-1254','4400 W Lawrence Ave',' Chicago', 'IL','60630','Monday 9AM–10PM Tuesday	9AM–10PM Wednesday	9AM–10PM Thursday	9AM–10PM Friday	9AM–10PMSaturday	9AM–5PM Sunday	12–5PM');
insert into Library (Library_ID,Library_Name,Library_Contact_Number,Library_Address,Library_City,Library_State,Library_ZipCode,Library_Timings)values (98, 'DePaul University - John T. Richardson Library', '(773) 325-7862','2350 N Kenmore Ave',' Chicago', 'IL','60614','Monday 9AM–10PM Tuesday	9AM–10PM Wednesday	9AM–10PM Thursday	9AM–10PM Friday	9AM–10PMSaturday	9AM–5PM Sunday	12–5PM');

select * from Library;

/* if exists( Select * from Media)
	drop table Media; */

create table Media
(
	Media_ID int primary key,
	Media_Library_ID int not null,
	Media_Format varchar(30) not null check(Media_Format in ('Book', 'eBook', 'Journal', 'eJournal', 'Magazine', 'Digital Magazine', 'DVD', 'CD')),
	Media_Status varchar(30) not null check(Media_Status in ('Checked out', 'Returned', 'On shelf', 'On hold', 'Due', 'Past due', 'Lost', 'Damaged')), /* 'Order placed', 'Waiting', 'Order key' */
	CONSTRAINT FK_Library_Table FOREIGN KEY(Media_Library_ID) REFERENCES Library(Library_ID)
);

go

--drop proc L_Insert_Media_Table;

go

create proc L_Insert_Media_Table @Media_ID as int, @Media_Format as varchar(30), @Media_Status as varchar(30), @Media_Library_ID as int 
as
begin
insert into Media(Media_ID, Media_Format, Media_Status, Media_Library_ID) values(@Media_ID, @Media_Format, @Media_Status, @Media_Library_ID);
end; --L_Insert_Media_Table

go

execute L_Insert_Media_Table 890001,'Book','Checked out',89;
execute L_Insert_Media_Table 890002,'Book','Returned',89;
execute L_Insert_Media_Table 890003,'Book','On hold',89;
execute L_Insert_Media_Table 890004,'Book','On shelf',89;
execute L_Insert_Media_Table 890005,'Book','Due',89;
execute L_Insert_Media_Table 890006,'Book','Lost',89;
execute L_Insert_Media_Table 890007,'Book','Damaged',89;
execute L_Insert_Media_Table 890008,'Book','Past due',89;
execute L_Insert_Media_Table 890009,'Book','Checked out',89;
execute L_Insert_Media_Table 890010,'Book','Returned',89;
execute L_Insert_Media_Table 890011,'Book','On hold',89;
execute L_Insert_Media_Table 900001,'Book','On shelf',90;
execute L_Insert_Media_Table 900002,'Book','Returned',90;
execute L_Insert_Media_Table 900003,'Book','On hold',90;
execute L_Insert_Media_Table 900004,'Book','On shelf',90;
execute L_Insert_Media_Table 900005,'Book','Due',90;
execute L_Insert_Media_Table 900006,'Book','Lost',90;
execute L_Insert_Media_Table 900007,'Book','Damaged',90;
execute L_Insert_Media_Table 900008,'Book','Past due',90;
execute L_Insert_Media_Table 900009,'Book','On shelf',90;
execute L_Insert_Media_Table 900010,'Book','Checked out',90;
execute L_Insert_Media_Table 900011,'Book','Checked out',90;

execute L_Insert_Media_Table 890200,'eBook','On hold',89;
execute L_Insert_Media_Table 890201,'eBook','Checked out',89;
execute L_Insert_Media_Table 890202,'eBook','Returned',89;
execute L_Insert_Media_Table 890203,'eBook','On hold',89;
execute L_Insert_Media_Table 890204,'eBook','On shelf',89;
execute L_Insert_Media_Table 890205,'eBook','Due',89;
execute L_Insert_Media_Table 890206,'eBook','Lost',89;
execute L_Insert_Media_Table 890207,'eBook','Damaged',89;
execute L_Insert_Media_Table 890208,'eBook','Past due',89;
execute L_Insert_Media_Table 890209,'eBook','Checked out',89;
execute L_Insert_Media_Table 890210,'eBook','Returned',89;
execute L_Insert_Media_Table 900200,'eBook','Checked out',90;
execute L_Insert_Media_Table 900201,'eBook','On shelf',90;
execute L_Insert_Media_Table 900202,'eBook','Returned',90;
execute L_Insert_Media_Table 900203,'eBook','On hold',90;
execute L_Insert_Media_Table 900204,'eBook','On shelf',90;
execute L_Insert_Media_Table 900205,'eBook','Due',90;
execute L_Insert_Media_Table 900206,'eBook','Lost',90;
execute L_Insert_Media_Table 900207,'eBook','Damaged',90;
execute L_Insert_Media_Table 900208,'eBook','Past due',90;
execute L_Insert_Media_Table 900209,'eBook','On shelf',90;
execute L_Insert_Media_Table 900210,'eBook','Checked out',90;

execute L_Insert_Media_Table 891200,'Journal','On hold',89;
execute L_Insert_Media_Table 891201,'Journal','Checked out',89;
execute L_Insert_Media_Table 891202,'Journal','Returned',89;
execute L_Insert_Media_Table 891203,'Journal','On hold',89;
execute L_Insert_Media_Table 891204,'Journal','On shelf',89;
execute L_Insert_Media_Table 891205,'Journal','Due',89;
execute L_Insert_Media_Table 891206,'Journal','Lost',89;
execute L_Insert_Media_Table 891207,'Journal','Damaged',89;
execute L_Insert_Media_Table 891208,'Journal','Past due',89;
execute L_Insert_Media_Table 891209,'Journal','Checked out',89;
execute L_Insert_Media_Table 901200,'Journal','Checked out',90;
execute L_Insert_Media_Table 901201,'Journal','On shelf',90;
execute L_Insert_Media_Table 901202,'Journal','Returned',90;
execute L_Insert_Media_Table 901203,'Journal','On hold',90;
execute L_Insert_Media_Table 901204,'Journal','On shelf',90;
execute L_Insert_Media_Table 901205,'Journal','Due',90;
execute L_Insert_Media_Table 901206,'Journal','Lost',90;
execute L_Insert_Media_Table 901207,'Journal','Damaged',90;
execute L_Insert_Media_Table 901208,'Journal','Past due',90;
execute L_Insert_Media_Table 901209,'Journal','On shelf',90;

execute L_Insert_Media_Table 891400,'eJournal','On hold',89;
execute L_Insert_Media_Table 891401,'eJournal','Checked out',89;
execute L_Insert_Media_Table 891402,'eJournal','Returned',89;
execute L_Insert_Media_Table 891403,'eJournal','On hold',89;
execute L_Insert_Media_Table 891404,'eJournal','On shelf',89;
execute L_Insert_Media_Table 891405,'eJournal','Due',89;
execute L_Insert_Media_Table 891406,'eJournal','Lost',89;
execute L_Insert_Media_Table 891407,'eJournal','Damaged',89;
execute L_Insert_Media_Table 891408,'eJournal','Past due',89;
execute L_Insert_Media_Table 891409,'eJournal','Checked out',89;
execute L_Insert_Media_Table 901400,'eJournal','Checked out',90;
execute L_Insert_Media_Table 901401,'eJournal','On shelf',90;
execute L_Insert_Media_Table 901402,'eJournal','Returned',90;
execute L_Insert_Media_Table 901403,'eJournal','On hold',90;
execute L_Insert_Media_Table 901404,'eJournal','On shelf',90;
execute L_Insert_Media_Table 901405,'eJournal','Due',90;
execute L_Insert_Media_Table 901406,'eJournal','Lost',90;
execute L_Insert_Media_Table 901407,'eJournal','Damaged',90;
execute L_Insert_Media_Table 901408,'eJournal','Past due',90;
execute L_Insert_Media_Table 901409,'eJournal','On shelf',90;
 
select * from Media;

/* if exists( Select * from Book_Details)
	drop table Book_Details; */

create table Book_Details
( 
	Book_Details_ISBN_No int primary key,
	Book_Details_Published_Year int not null,
	Book_Details_Title varchar(100) not null,
	Book_Details_Author_First_Name varchar(30),
	Book_Details_Author_Last_Name varchar(30) not null,
	Book_Details_Language varchar(30),
	Book_Details_Rating int,
	Book_Details_Price int,
	Book_Details_Entry_Changed timestamp /* not null default CURRENT_TIMESTAMP */
);

go

create proc L_Insert_Book_Details_Table @ISBN_No as int, @Published_Year as int, @Title as varchar(100), @Author_First_Name as varchar(30), @Author_Last_Name as varchar(30), @Language as varchar(30), @Rating as int
as
begin
insert into dbo.Book_Details(Book_Details_ISBN_No, Book_Details_Published_Year, Book_Details_Title, Book_Details_Author_First_Name, Book_Details_Author_Last_Name, Book_Details_Language, Book_Details_Rating) 
values(@ISBN_No , @Published_Year, @Title, @Author_First_Name, @Author_Last_Name, @Language, @Rating);
end --L_Insert_Book_Details_Table 

go

execute L_Insert_Book_Details_Table   1826,2009,'2 States','Chetan','Bhagat','English',4
execute L_Insert_Book_Details_Table   3697,2014,'Night Owl','M','Pierce','English',5
execute L_Insert_Book_Details_Table   2188,2012,'The Science Of Biology','Freeman','H & W Company','English',4
execute L_Insert_Book_Details_Table   2119,2004,'Core Java Advanced Features','Gart','Connell','English',3
execute L_Insert_Book_Details_Table   1846,2017,'Womans Ritual','Sudha','Murthy','English',5
execute L_Insert_Book_Details_Table   2147,2010,'Butterfly Effect: How Your Life Matters','Nelson','Thomas','English',3
execute L_Insert_Book_Details_Table   2106,2004,'SQL Pocket Guide','Jonathan','Gennick','English',4
execute L_Insert_Book_Details_Table   2738,2004,'Front-End Web Development: The Big Nerd Ranch Guide / Edition 1','Big Nerd Ranch Guides','Guides','English',4
execute L_Insert_Book_Details_Table   2278,2015,'5 Love Langugaes-The Secret To Love That Lasts','Gary','Chapman','English',5
execute L_Insert_Book_Details_Table   3843,1901,'Till We Have Faces: A Myth Retold','C.S','Lewis','English',3
execute L_Insert_Book_Details_Table   2671,2013,'Java Programming','Tushar','Patel','English',4


select * from Book_Details;

/* if exists( Select * from Book)
	drop table Book; */

create table Book
(
	Book_Media_ID int not null,
	Book_ISBN_No int not null,
	Book_Bought_Date date not null default CURRENT_TIMESTAMP,
	Book_Entry_Changed timestamp /* not null default CURRENT_TIMESTAMP */,
	CONSTRAINT FK_Media_Book_Table FOREIGN KEY(Book_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_Book_Details_Table FOREIGN KEY(Book_ISBN_No) REFERENCES Book_Details(Book_Details_ISBN_No),
	--CONSTRAINT Lib_Sem_Book_Bought_Date Check(Year(Book_Bought_Date) >= dbo.Book_Details.Book_Details_Published_Year)
);

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
execute L_Insert_Book_Table  900003,2188,'10/1/2017';
execute L_Insert_Book_Table  900004,2119,'12/8/2008';
execute L_Insert_Book_Table  900005,1846,'6/23/2017';
execute L_Insert_Book_Table  900006,2147,'8/12/2015';
execute L_Insert_Book_Table  900007,2106,'10/5/2006';
execute L_Insert_Book_Table  900008,2738,'6/22/2005';
execute L_Insert_Book_Table  900009,2278,'3/29/2016';
execute L_Insert_Book_Table  900010,3843,'5/10/1955';
execute L_Insert_Book_Table  900011,2671,'11/8/2015';

select * from Book;

/* if exists( Select * from eBook_Details)
	drop table eBook_Details; */

create table eBook_Details
( 
	eBook_Details_ISBN_No int primary key,
	eBook_Details_Release_Date date /* not null */,
	eBook_Details_Title varchar(100) not null,
	eBook_Details_Author_First_Name varchar(30),
	eBook_Details_Author_Last_Name varchar(30) not null,
	eBook_Details_File_Size varchar(100),
	eBook_Details_File_Path varchar(100),
	eBook_Details_Duration time,
	eBook_Details_Language varchar(30),
	eBook_Details_Rating   int,
	eBook_Details_Entry_Changed timestamp /* not null default CURRENT_TIMESTAMP */
);

go

--drop proc L_Insert_eBook_Table;
create proc L_Insert_eBook_Details_Table @ISBN_No as int, @Release_Date as date, @Title as varchar(100), @Author_First_Name as varchar(30), @Author_Last_Name as varchar(30), @Language as varchar(30), @Rating as int
as
begin
insert into dbo.eBook_Details(eBook_Details_ISBN_No, eBook_Details_Release_Date, eBook_Details_Title, eBook_Details_Author_First_Name, eBook_Details_Author_Last_Name, eBook_Details_Language, eBook_Details_Rating) values(@ISBN_No, @Release_Date, @Title, @Author_First_Name, @Author_Last_Name, @Language, @Rating);
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

select * from eBook_Details;
	 
/* if exists( Select * from eBook)
	drop table eBook; */

create table eBook
(
	eBook_Media_ID int not null,
	eBook_ISBN_No int not null,
	eBook_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	eBook_Entry_Changed timestamp /* not null default CURRENT_TIMESTAMP*/, 
	CONSTRAINT FK_Media_eBook_Table FOREIGN KEY(eBook_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_eBook_Details_Table FOREIGN KEY(eBook_ISBN_No) REFERENCES eBook_Details(eBook_Details_ISBN_No)
);

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

/* if exists( Select * from Journal_Details)
	drop table Journal_Details; */

create table Journal_Details
(
	Journal_Details_ISSN_Number int primary key,
	Journal_Details_Title varchar(100) not null,
	Journal_Details_Alternate_Title varchar(100),
	Journal_Details_Source varchar(100),
	Journal_Details_Published_Date date not null,
	Journal_Details_End_Date date,
	Journal_Details_Volume int,
	Journal_Details_Issue int,
	Journal_Details_Author_Last_Name varchar(30),
	Journal_Details_Author_First_Name varchar(30), 
	Journal_Details_Price int,
	Journal_Details_Entry_Changed timestamp not null /*default CURRENT_TIMESTAMP*/
);

go

--drop proc L_Insert_Journal_Details_Table;
create proc L_Insert_Journal_Details_Table @ISSN_No as int, @Title as varchar(100), @Source as varchar(100), 
	@Publish_Date as date, @Volume as int, @Issue as int, @Author_Last_Name as varchar(30), 
	@Author_First_Name as varchar(30), @Price as int
as
begin
insert into dbo.Journal_Details(Journal_Details_ISSN_Number, Journal_Details_Title, Journal_Details_Source, 
	Journal_Details_Published_Date, Journal_Details_Volume, Journal_Details_Issue, Journal_Details_Author_Last_Name, 
	Journal_Details_Author_First_Name, Journal_Details_Price) 
 values(@ISSN_No, @Title, @Source, @Publish_Date, @Volume, @Issue, @Author_Last_Name, @Author_First_Name, @Price);
end;

go

execute L_Insert_Journal_Details_Table 62801,'The Plant Journal', 'John Wiley & Sons Ltd','09/01/2017',91,5,'Sweetlove','Lee',0;
execute L_Insert_Journal_Details_Table 60618,'The Science XYZ','Society for Science','01/01/2017',78,1,'Smith','Jason',5;
execute L_Insert_Journal_Details_Table 62596,'A History of Illinois','Society for Illinois study','10/21/2016',20,10,'Ampersand','Mark',7;
execute L_Insert_Journal_Details_Table 62971,'The Animals Journal','Society for Zoology','8/22/2015',40,8,'Doe','Jane',6;
execute L_Insert_Journal_Details_Table 63652,'The Rare Gems Catalogue','Unique Jewellers','10/02/2013',31,10,'Joe','Rank',6;
execute L_Insert_Journal_Details_Table 60241,'The Heritage Parks','American Society for Parks ','7/23/2010',22,3,'King','Happy',4;
execute L_Insert_Journal_Details_Table 60080,'The Education Journey','Society for Education','6/22/2013',30,6,'Deer','Hill',4;
execute L_Insert_Journal_Details_Table 61364,'The Natural Science Journal','The Smithsonian Institute','6/10/2015',24,6,'Jam','Jello',6;
execute L_Insert_Journal_Details_Table 63189,'A Knowledge of Nature','Society for Nature','7/20/2014',20,7,'Join','Just',4;
execute L_Insert_Journal_Details_Table 63601,'The Automobile Journal','Society for Mechanics','10/10/2015',33,10,'Motors','Tata',6;

/* if exists(Select * from Journal)
	drop table Journal; */

create table Journal
(
	Journal_Media_ID int not null,
	Journal_ISSN_No int not null,
	Journal_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	Journal_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */, 
	CONSTRAINT FK_Media_Journal_Table FOREIGN KEY(Journal_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_Journal_Details_Table FOREIGN KEY(Journal_ISSN_No) REFERENCES Journal_Details(Journal_Details_ISSN_Number)
);

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

execute L_Insert_Journal_Table	891200,62801,'09/15/2017';
execute L_Insert_Journal_Table	891201,60618,'01/15/2017';
execute L_Insert_Journal_Table	891202,62596,'11/15/2016';
execute L_Insert_Journal_Table	891203,62971,'9/15/2015';
execute L_Insert_Journal_Table	891204,63652,'11/15/2013';
execute L_Insert_Journal_Table	891205,60241,'8/15/2010';
execute L_Insert_Journal_Table	891206,60080,'7/15/2013';
execute L_Insert_Journal_Table	891207,61364,'6/30/2015';
execute L_Insert_Journal_Table	891208,63189,'8/15/2014';
execute L_Insert_Journal_Table	891209,63601,'10/30/2015';

execute L_Insert_Journal_Table	901200,62801,'09/15/2017';
execute L_Insert_Journal_Table	901201,60618,'01/15/2017';
execute L_Insert_Journal_Table	901202,62596,'11/15/2016';
execute L_Insert_Journal_Table	901203,62971,'9/15/2015';
execute L_Insert_Journal_Table	901204,63652,'11/15/2013';
execute L_Insert_Journal_Table	901205,60241,'8/15/2010';
execute L_Insert_Journal_Table	901206,60080,'7/15/2013';
execute L_Insert_Journal_Table	901207,61364,'6/30/2015';
execute L_Insert_Journal_Table	901208,63189,'8/15/2014';
execute L_Insert_Journal_Table	901209,63601,'10/30/2015';

/* if exists( Select * from eJournal_Details)
	drop table eJournal_Details; */

create table eJournal_Details
(
	eJournal_Details_ISSN_Number int primary key,
	eJournal_Details_Title varchar(100) not null,
	eJournal_Details_Alternate_Title varchar(100),
	eJournal_Details_Source varchar(100),
	eJournal_Details_Published_Date date not null,
	eJournal_Details_End_Date date,
	eJournal_Details_Volume int,
	eJournal_Details_Issue int,
	eJournal_Details_Author_Last_Name varchar(30),
	eJournal_Details_Author_First_Name varchar(30) ,
	eJournal_Details_File_Size varchar(100),
	eJournal_Details_File_Path varchar(100),
	eJournal_Details_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */
);

go

--drop proc L_Insert_Journal_Details_Table;
create proc L_Insert_eJournal_Details_Table @ISSN_No as int, @Title as varchar(100), @Source as varchar(100), 
	@Publish_Date as date, @Volume as int, @Issue as int, @Author_Last_Name as varchar(30), 
	@Author_First_Name as varchar(30)
as
begin
insert into dbo.eJournal_Details(eJournal_Details_ISSN_Number, eJournal_Details_Title, eJournal_Details_Source, 
	eJournal_Details_Published_Date, eJournal_Details_Volume, eJournal_Details_Issue, eJournal_Details_Author_Last_Name, 
	eJournal_Details_Author_First_Name) 
 values(@ISSN_No, @Title, @Source, @Publish_Date, @Volume, @Issue, @Author_Last_Name, @Author_First_Name);
end;

go

execute L_Insert_eJournal_Details_Table	69552,'The Plant Journal','John Wiley & Sons Ltd','09/01/2017',91,5,'Sweetlove','Lee';
execute L_Insert_eJournal_Details_Table	67808,'The Science XYZ','Society for Science','01/01/2017',78,1,'Smith','Jason';
execute L_Insert_eJournal_Details_Table	67561,'A History of Illinois','Society for Illinois study','10/21/2016',20,10,'Ampersand','Mark';
execute L_Insert_eJournal_Details_Table	69654,'The Animals Journal','Society for Zoology','8/22/2015',40,8,'Doe','Jane';
execute L_Insert_eJournal_Details_Table	68666,'The Rare Gems Catalogue','Unique Jewellers','10/02/2013',31,10,'Joe','Rank';
execute L_Insert_eJournal_Details_Table	68287,'The Heritage Parks','American Society for Parks ','7/23/2010',22,3,'King','Happy';
execute L_Insert_eJournal_Details_Table	68885,'The Education Journey','Society for Education','6/22/2013',30,6,'Deer','Hill';
execute L_Insert_eJournal_Details_Table	69468,'The Natural Science Journal','The Smithsonian Institute','6/10/2015',24,6,'Jam','Jello';
execute L_Insert_eJournal_Details_Table	67520,'A Knowledge of Nature','Society for Nature','7/20/2014',20,7,'Join','Just';
execute L_Insert_eJournal_Details_Table	68039,'The Automobile Journal','Society for Mechanics','10/10/2015',33,10,'Motors','Tata';

/* if exists( Select * from eJournal)
	drop table eJournal; */

create table eJournal
(
	eJournal_Media_ID int not null,
	eJournal_ISSN_No int not null,
	eJournal_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	eJournal_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */, 
	CONSTRAINT FK_Media_eJournal_Table FOREIGN KEY(eJournal_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_eJournal_Details_Table FOREIGN KEY(eJournal_ISSN_No) REFERENCES eJournal_Details(eJournal_Details_ISSN_Number)
);

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

execute L_Insert_eJournal_Table	891400,69552,'09/15/2017';
execute L_Insert_eJournal_Table	891401,67808,'01/15/2017';
execute L_Insert_eJournal_Table	891402,67561,'11/15/2016';
execute L_Insert_eJournal_Table	891403,69654,'9/15/2015';
execute L_Insert_eJournal_Table	891404,68666,'11/15/2013';
execute L_Insert_eJournal_Table	891405,68287,'8/15/2010';
execute L_Insert_eJournal_Table	891406,68885,'7/15/2013';
execute L_Insert_eJournal_Table	891407,69468,'6/30/2015';
execute L_Insert_eJournal_Table	891408,67520,'8/15/2014';
execute L_Insert_eJournal_Table	891409,68039,'10/30/2015';

execute L_Insert_eJournal_Table	901400,69552,'09/15/2017';
execute L_Insert_eJournal_Table	901401,67808,'01/15/2017';
execute L_Insert_eJournal_Table	901402,67561,'11/15/2016';
execute L_Insert_eJournal_Table	901403,69654,'9/15/2015';
execute L_Insert_eJournal_Table	901404,68666,'11/15/2013';
execute L_Insert_eJournal_Table	901405,68287,'8/15/2010';
execute L_Insert_eJournal_Table	901406,68885,'7/15/2013';
execute L_Insert_eJournal_Table	901407,69468,'6/30/2015';
execute L_Insert_eJournal_Table	901408,67520,'8/15/2014';
execute L_Insert_eJournal_Table	901409,68039,'10/30/2015';

/* if exists( Select * from Magazine_Details)
	drop table Magazine_Details; */

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

/* if exists( Select * from Magazine)
	drop table Magazine; */

create table Magazine
(
	Magazine_Media_ID int not null,
	Magazine_Internal_ID int not null,
	Magazine_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	Magazine_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */, 
	CONSTRAINT FK_Media_Magazine_Table FOREIGN KEY(Magazine_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_Magazine_Details_Table FOREIGN KEY(Magazine_Internal_ID) REFERENCES Magazine_Details(Magazine_Details_Internal_ID)
);

/* if exists( Select * from Digital_Magazine_Details)
	drop table Digital_Magazine_Details; */

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

/* if exists( Select * from Digital_Magazine)
	drop table Digital_Magazine; */

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

/* if exists( Select * from DVD_Details)
	drop table DVD_Details; */

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

/* if exists( Select * from DVD)
	drop table DVD; */

create table DVD
(
	DVD_Media_ID int not null,
	DVD_ISBN_No int not null,
	DVD_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	DVD_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */, 
	CONSTRAINT FK_Media_DVD_Table FOREIGN KEY(DVD_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_DVD_Details_Table FOREIGN KEY(DVD_ISBN_No) REFERENCES DVD_Details(DVD_Details_ISBN_No)
);

/* if exists( Select * from CD_Details)
	drop table CD_Details; */

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

/* if exists( Select * from CD)
	drop table CD; */

create table CD
(
	CD_Media_ID int not null,
	CD_Internal_ID int not null,
	CD_Bought_Date date not null default CURRENT_TIMESTAMP, --The default value should be date
	CD_Entry_Changed timestamp not null /* default CURRENT_TIMESTAMP */, 
	CONSTRAINT FK_Media_CD_Table FOREIGN KEY(CD_Media_ID) REFERENCES Media(Media_ID),
	CONSTRAINT FK_CD_Details_Table FOREIGN KEY(CD_Internal_ID) REFERENCES CD_Details(CD_Details_Internal_ID)
);

/* if exists( Select * from Library_Member)
	drop table Library_Member; */

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

/* if exists( Select * from Employee_Staff)
	drop table Employee_Staff; */

create table Employee_Staff
(
	Employee_Staff_ID int primary key,
	Employee_Staff_Library_Member_ID int not null,	
	Employee_Staff_Designation varchar(30), /* This should be an enum */
	Employee_Staff_SSN int not null,
	Employee_Staff_Joining_Date date not null,
	Employee_Staff_Hours_Worked varchar(30)  not null,
	CONSTRAINT FK_Library_Employee_Table FOREIGN KEY(Employee_Staff_Library_Member_ID) REFERENCES Library_Member(Library_Member_ID)
);

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
	CONSTRAINT FK_Media_Check_Out_Table_1 FOREIGN KEY(Media_Check_Out_Member_ID) REFERENCES Library_Member(Library_Member_ID),
	CONSTRAINT FK_Media_Check_Out_Table_2 FOREIGN KEY(Media_Check_Out_Media_ID) REFERENCES Media(Media_ID)
);

/* Check in transaction will delete row entries in Media_Check_Out & update status of Media_Status field in Media table and member fines if any */

/* Before putting media on hold status, should be checked such as lost, damaged, max check out no reached eg 3*/
/* if exists( Select * from Media_Hold)
	drop table Media_Hold; */

create table Media_Hold
(
	Media_Hold_Media_ID int not null,
	Media_Hold_Member_ID int not null,
	CONSTRAINT FK_Media_Hold_Member_ID FOREIGN KEY(Media_Hold_Member_ID) REFERENCES Library_Member(Library_Member_ID),
	CONSTRAINT FK_Media_Hold_Media_ID FOREIGN KEY(Media_Hold_Media_ID) REFERENCES Media(Media_ID)
);

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

create table Login_Table
(
	Login_ID int primary key,
	Login_Name varchar(35),
	Login_UserName varchar(5),
	Login_Password varchar(15),
	Login_DateTime datetime,
	LogOut_DateTime datetime,
	Login_Library_Member_ID int,
	CONSTRAINT FK_Login_Details FOREIGN KEY(Login_Library_Member_ID) references Library_Member(Library_Member_ID)
);

