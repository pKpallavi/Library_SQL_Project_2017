use Library_SQL_Project;
go

SET NOCOUNT ON

:Out "C:\Data\Library_SQL_Project_2017\Library_SQL_Project_Job_Output.txt"

go

/*
sp_configure 'show advanced options', 1;  
GO  
RECONFIGURE;  
GO  
sp_configure 'Database Mail XPs', 1;  
GO  
RECONFIGURE  
GO  

declare @mail_account_id as int, @mail_profile_id as int;

--EXECUTE msdb.dbo.sysmail_delete_profile_sp @profile_id = 1;
--EXECUTE msdb.dbo.sysmail_delete_profile_sp @profile_id = 3;
--EXECUTE msdb.dbo.sysmail_delete_account_sp @account_id = 1;


EXECUTE msdb.dbo.sysmail_add_account_sp  
    @account_name = 'Library_SQL_Project Admin',  
    @description = 'Mail account for Library_SQL_Project e-mails.',  
    @email_address = 'Library_SQL_Project@Adventure-Works.com',  
    @display_name = 'Library_SQL_Project Automated Mailer',  
    @mailserver_name = 'smtp.Adventure-Works.com',
	@mailserver_type = 'SMTP',
	@use_default_credentials = 1,
	@enable_ssl = 1,
	@account_id = @mail_account_id OUTPUT;

EXECUTE msdb.dbo.sysmail_update_account_sp 
	@account_name = 'Library_SQL_Project Admin',
	@email_address = 'pallavikg@gmail.com', 
	@mailserver_name = 'smtp.gmail.com', --'aspmx.l.google.com',
	@use_default_credentials = 0,
	@username = 'pallavikg@gmail.com',
	@password = '***********',
	@port = 465, 
	@enable_ssl = 1;

EXEC msdb.dbo.sysmail_add_profile_sp
	@profile_name =  'Library_SQL_Project Admin Profile',
	@description = 'Mail profile for Library_SQL_Project e-mails.', 
	@profile_id = @mail_profile_id OUTPUT;

EXECUTE msdb.dbo.sysmail_add_profileaccount_sp  
    @profile_name = 'Library_SQL_Project Admin Profile',  
    @account_name = 'Library_SQL_Project Admin',  
    @sequence_number = 1 ;  

EXECUTE msdb.dbo.sysmail_delete_mailitems_sp 
	@sent_status = 'failed';

EXEC msdb.dbo.sysmail_start_sp;
*/

declare @chk_out_due_date date, @memid int, @mediaid int, @mem_dues_updated varchar(3),  @media_days_past_due int, @mformat varchar(30), @media_status varchar(30);

declare media_check_out_loop cursor for (select Media_Check_Out_Member_ID, Media_Check_Out_Due_Date, Media_Check_Out_Media_ID, Media_Check_Out_Member_Dues_Updated from Media_Check_Out);

--Updating media status

open media_check_out_loop;
fetch next from media_check_out_loop into @memid, @chk_out_due_date, @mediaid, @mem_dues_updated;
while @@FETCH_STATUS = 0
begin
	set @media_days_past_due = DATEDIFF(dd, @chk_out_due_date, CONVERT(date, SYSDATETIME()));
	select @media_status = Media_Status from Media where Media_ID = @mediaid;

	if (@media_days_past_due >= 0)
	begin
		--Include automatic returns for Digital Media when past due unless explicitly renewed.
		if(@media_status <> 'Due')
		begin
			update Media set Media_Status = 'Due' where Media_ID = @mediaid;
			print('Updated media status when media past due for ' + CAST(@media_days_past_due as varchar(15)) + ' days');
		end;
		if (@mem_dues_updated = 'No' AND @media_days_past_due >= 14)
		begin
			select @mformat = Media_Format from Media where Media_ID = @mediaid;
			update Library_Member set Library_Member_Dues += (case(@mformat)
			when 'Book' then (select Book_Details_Price from Book_Details where Book_Details_ISBN_No = (select Book_ISBN_No from Book where Book_Media_ID = @mediaid))
			when 'Journal' then (select Journal_Details_Price from Journal_Details where Journal_Details_ISSN_Number = (select Journal_ISSN_No from Journal where Journal_Media_ID = @mediaid))
			when 'Magazine' then (select Magazine_Details_Price from Magazine_Details where Magazine_Details_Internal_ID = (select Magazine_Internal_ID from Magazine where Magazine_Media_ID = @mediaid))
			when 'DVD' then (select DVD_Details_Price from DVD_Details where DVD_Details_ISBN_No = (select DVD_ISBN_No from DVD where DVD_Media_ID = @mediaid))
			when 'CD' then (select CD_Details_Price from CD_Details where CD_Details_Internal_ID = (select CD_Internal_ID from CD where CD_Media_ID = @mediaid))
			end
			)
			where Library_Member_ID = @memid;
			update Media_Check_Out set Media_Check_Out_Member_Dues_Updated = 'Yes' where Media_Check_Out_Media_ID = @mediaid;
			print('Updated Media dues when Media past due date for more than ' + CAST(@media_days_past_due as varchar(15)) + 'days');
		end;
	end;
	else
	begin
		-- Below will be a negative number because Media is not yet due
		set @media_days_past_due = -@media_days_past_due;
		print('Media not past due for ' + CAST(@media_days_past_due as varchar(15)) + ' days');
	end;

	fetch next from media_check_out_loop into @memid, @chk_out_due_date, @mediaid, @mem_dues_updated;
end;

close media_check_out_loop;
deallocate media_check_out_loop;

---------------------------------------------------------------------------------------------------------------------
:Setvar SQLCMDOUTPUTFILEPATH "C:\Data\Library_SQL_Project_2017\temp.sql" 
:OUT $(SQLCMDOUTPUTFILEPATH)

declare @message1 as varchar(1000), @member_first_name as varchar(30), @member_last_name as varchar(30), @item_per_member as int, @message2 as varchar(100);
declare @tempchar100 as varchar(100), @file_path as varchar(100), @curr_member_id as int, @member_no as int;

set @message1 = '';
set @message2 = '';
set @item_per_member = 0;
set @curr_member_id = 0;
set @member_no = 1;

declare media_notify_dues_loop cursor for select Media_Check_Out_Member_ID, Media_Check_Out_Due_Date, Media_Check_Out_Media_ID, Media_Check_Out_Member_Dues_Updated from Media_Check_Out where(DATEDIFF(dd, Media_Check_Out_Due_Date, CONVERT(date, SYSDATETIME())) >= -2) Order by Media_Check_Out_Member_ID;

--Notify Member of due Media
open media_notify_dues_loop;
fetch next from media_notify_dues_loop into @memid, @chk_out_due_date, @mediaid, @mem_dues_updated;
while @@FETCH_STATUS = 0
begin

	set @media_days_past_due = DATEDIFF(dd, @chk_out_due_date, CONVERT(date, SYSDATETIME()));
	select @media_status = Media_Status from Media where Media_ID = @mediaid;

	if ((@media_days_past_due = -2) OR (@media_days_past_due = 3) OR (@media_days_past_due = 7))
	begin
		--print('Inside Notification for ' + CAST(@media_days_past_due as varchar(5)) + ' days');
		if(@curr_member_id <> @memid)
		begin
			select @member_first_name = Library_Member_First_Name, @member_last_name = Library_Member_Last_Name from Library_Member where Library_Member_ID = @memid; --include code to get the email address of the member. 
			if (@message1 <> '')
			begin
				set @file_path = 'C:\Data\Library_SQL_Project_2017\' + CAST(@curr_member_id as varchar(12)) + '.txt';
				set @message1 += 'PRINT ''Yours sincerely, '' + CHAR(13) + CHAR(10) + ''Librarian, '' ' + CHAR(13) + CHAR(10);
				select @tempchar100 = Library_Name from Library where Library_ID = (select Media_Library_ID from Media where Media_ID = @mediaid);
				set @message1 += 'PRINT ''' + @tempchar100 + ', ''' + CHAR(13) + CHAR(10);
				select @tempchar100 = Library_Address from Library where Library_ID = (select Media_Library_ID from Media where Media_ID = @mediaid);;
				set @message1 += 'PRINT ''' + @tempchar100 + ', ''' + CHAR(13) + CHAR(10);
				select @tempchar100 = Library_City from Library where Library_ID = (select Media_Library_ID from Media where Media_ID = @mediaid);;
				set @message1 += 'PRINT ''' + @tempchar100 + ', ''' ;
				select @tempchar100 = Library_State from Library where Library_ID = (select Media_Library_ID from Media where Media_ID = @mediaid);;
				set @message1 += '+ ''' + @tempchar100 + ', ''';
				select @tempchar100 = Library_ZipCode from Library where Library_ID = (select Media_Library_ID from Media where Media_ID = @mediaid);;
				set @message1 += '+ ''' + @tempchar100 + ' ''' + ' + CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10)' + CHAR(13) + CHAR(10);

				set @message2 = @message1;
				set @member_no += 1;
				--print('SETVAR Message "' + @message1 + '"');
				
	/*				EXEC msdb.dbo.sp_send_dbmail  
					@profile_name = 'Library_SQL_Project Admin Profile',  
					@recipients = 'pallavikg@gmail.com',  
					@body = @message1,  
					@subject = 'Renew/Return Library Items Reminder' ;  
	*/
			end;
			set @curr_member_id = @memid;
			set @item_per_member = 0;
			set @message1 = 'PRINT CHAR(13) + CHAR(10) + ''Dear ' + @member_first_name + ' ' + @member_last_name + ', ''' + CHAR(13) + CHAR(10);
				select @tempchar100 = Library_Member_Address from Library_Member where Library_Member_ID = @memid;
				set @message1 += 'PRINT ''' + @tempchar100 + ', ''' + CHAR(13) + CHAR(10);
				select @tempchar100 = Library_Member_City from Library_Member where Library_Member_ID = @memid;
				set @message1 += 'PRINT ''' + @tempchar100 + ', ''';
				select @tempchar100 = Library_Member_State from Library_Member where Library_Member_ID = @memid;
				set @message1 += '+ ''' + @tempchar100 + ', ''';
				select @tempchar100 = Library_Member_Zip_code from Library_Member where Library_Member_ID = @memid;
				set @message1 += '+ ''' + @tempchar100 + ' ''' + ' + CHAR(13) + CHAR(10)' + CHAR(13) + CHAR(10);
			set @message1 += 'PRINT ''' + 'Following items from our library are due. ''' + CHAR(13) + CHAR(10);
			set @message1 += 'PRINT ''' + 'Please renew or return them to the Library soon. Thank you.''' +  ' + CHAR(13) + CHAR(10)' + CHAR(13) + CHAR(10);
		end;

		select @mformat = Media_Format from Media where Media_ID = @mediaid;
		set @tempchar100 = (case @mformat
		when 'Book' then (select Book_Details_Title from Book_Details where Book_Details_ISBN_No = (select Book_ISBN_No from Book where Book_Media_ID = @mediaid))
		when 'Journal' then (select Journal_Details_Title from Journal_Details where Journal_Details_ISSN_Number = (select Journal_ISSN_No from Journal where Journal_Media_ID = @mediaid))
		when 'Magazine' then (select Magazine_Details_Name from Magazine_Details where Magazine_Details_Internal_ID = (select Magazine_Internal_ID from Magazine where Magazine_Media_ID = @mediaid))
		when 'DVD' then (select DVD_Details_Title from DVD_Details where DVD_Details_ISBN_No = (select DVD_ISBN_No from DVD where DVD_Media_ID = @mediaid))
		when 'CD' then (select CD_Details_Title from CD_Details where CD_Details_Internal_ID = (select CD_Internal_ID from CD where CD_Media_ID = @mediaid))
		end
		)
		set @item_per_member += 1;
		set @message1 += 'PRINT ''' + CAST(@item_per_member as varchar(5)) + ' ' + CAST(@mediaid as varchar(8)) + ' ' + @tempchar100 + ' ' + CAST(@chk_out_due_date as varchar(10)) + ' ''' +  ' + CHAR(13) + CHAR(10)' + CHAR(13) + CHAR(10);
	end;

	if(@message2 <> '')
	begin
--		PRINT ':SETVAR FilePath' + CAST(@member_no as varchar(12)) + ' ''' + @file_path + '''' + CHAR(13) + CHAR(10);
--		PRINT ':SETVAR Message' + CAST(@member_no as varchar(12)) + ' ''' + @message2 + '''' + CHAR(13) + CHAR(10);
		PRINT ':OUT "' + @file_path + '"' + CHAR(13) + CHAR(10);
		PRINT @message2 + CHAR(13) + CHAR(10);
		set @message2 = '';
	end;
	fetch next from media_notify_dues_loop into @memid, @chk_out_due_date, @mediaid, @mem_dues_updated;
end;

if (@message1 <> '')
begin
	set @file_path = 'C:\Data\Library_SQL_Project_2017\' + CAST(@curr_member_id as varchar(12)) + '.txt';
	set @message1 += 'PRINT ''Yours sincerely, '' + CHAR(13) + CHAR(10) + ''Librarian, '' ' + CHAR(13) + CHAR(10);
	select @tempchar100 = Library_Name from Library where Library_ID = (select Media_Library_ID from Media where Media_ID = @mediaid);
	set @message1 += 'PRINT ''' + @tempchar100 + ', ''' + CHAR(13) + CHAR(10);
	select @tempchar100 = Library_Address from Library where Library_ID = (select Media_Library_ID from Media where Media_ID = @mediaid);;
	set @message1 += 'PRINT ''' + @tempchar100 + ', ''' + CHAR(13) + CHAR(10);
	select @tempchar100 = Library_City from Library where Library_ID = (select Media_Library_ID from Media where Media_ID = @mediaid);;
	set @message1 += 'PRINT ''' + @tempchar100 + ', ''' ;
	select @tempchar100 = Library_State from Library where Library_ID = (select Media_Library_ID from Media where Media_ID = @mediaid);;
	set @message1 += '+ ''' + @tempchar100 + ', ''';
	select @tempchar100 = Library_ZipCode from Library where Library_ID = (select Media_Library_ID from Media where Media_ID = @mediaid);;
	set @message1 += '+ ''' + @tempchar100 + ' ''' + ' + CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10)' + CHAR(13) + CHAR(10);

--	PRINT ':SETVAR FilePath' + CAST(@member_no as varchar(12)) + ' ''' + @file_path + '''' + CHAR(13) + CHAR(10);
--	PRINT ':SETVAR Message' + CAST(@member_no as varchar(12)) + ' ''' + @message1 + '''' + CHAR(13) + CHAR(10);

	PRINT ':OUT "' + @file_path + '"' + CHAR(13) + CHAR(10);
	PRINT @message1 + CHAR(13) + CHAR(10);
				
--EXEC msdb.dbo.sysmail_start_sp
	 
/*	EXEC msdb.dbo.sp_send_dbmail  
		@profile_name = 'Library_SQL_Project Admin Profile',  
		@recipients = 'pallavikg@gmail.com',  
		@body = @message1,  
		@subject = 'Renew/Return Library Items Reminder' ;  
*/

--EXEC msdb.dbo.sysmail_stop_sp 				

end;

/*
EXEC msdb.dbo.sysmail_help_configure_sp;
EXEC msdb.dbo.sysmail_help_queue_sp;
EXECUTE msdb.dbo.sysmail_help_status_sp ; 
EXECUTE msdb.dbo.sysmail_help_account_sp; -- @account_name = 'Library_SQL_Project Admin';
EXECUTE msdb.dbo.sysmail_help_profile_sp;
select * from msdb.dbo.sysmail_allitems;
select * from msdb.dbo.sysmail_event_log;

--EXEC msdb.dbo.sysmail_stop_sp 	
*/

close media_notify_dues_loop;
deallocate media_notify_dues_loop;

go

:r "C:\Data\Library_SQL_Project_2017\temp.sql"

go


