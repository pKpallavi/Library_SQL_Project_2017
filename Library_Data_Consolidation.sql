use Library_SQL_Project;
go

declare @chk_out_date date, @chk_out_due_date date, @memid int, @mediaid int, @mem_dues_updated varchar(3), @media_days_chked_out int, @mformat varchar(30), @media_status varchar(30);

declare media_check_out_loop cursor for (select Media_Check_Out_Member_ID, Media_Check_Out_Date, Media_Check_Out_Due_Date, Media_Check_Out_Media_ID, Media_Check_Out_Member_Dues_Updated from Media_Check_Out);

--Updating media status

open media_check_out_loop;
fetch next from media_check_out_loop into @memid, @chk_out_date, @chk_out_due_date, @mediaid, @mem_dues_updated;
while @@FETCH_STATUS = 0
begin
	set @media_days_chked_out = DATEDIFF(dd, @chk_out_date, convert(date,SYSDATETIME()));
	select @media_status = Media_Status from Media where Media_ID = @mediaid;
	if @media_days_chked_out >= 35 and @media_status = 'Due'
	begin
		if @mem_dues_updated = 'No'
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
			print('Updated when media checked out for more than 56 days');
		end;
	end;
	else if @media_days_chked_out >= 21
	begin
		update Media set Media_Status = 'Due' where Media_ID = @mediaid;
		print('Updated when media checked out for more than 21 days');
	end;
	else
	begin
		print('No updates needed for this media');
	end;

	fetch next from media_check_out_loop into @memid, @chk_out_date, @chk_out_due_date, @mediaid, @mem_dues_updated;
end;


go




