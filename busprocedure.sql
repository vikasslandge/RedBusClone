--procedure to retrive data from providerDetails table
--create proc	GetProviderDetails
--as
--begin
--select * from ProviderDetails
--end

--exec GetProviderDetails
--go
--Add buses 
create proc InsertBusDetails(@busNo varchar(20) ,@busname varchar(40),@capacity int, @type varchar(40))
as
begin
	Declare @busId int
	insert into BusDetails Values(@busname,@capacity,@type,@busNo)
	select @busId= @@IDENTITY 
  	DECLARE @count INT = 1;
		--	Declare @busId int =(select IDENT_CURRENT('BusDetails'));
	WHILE @count <= @capacity
	BEGIN
	insert into SeatBookingStatus Values(@busId,@count,'Available','General');
	set @count = @count + 1;
	END
	
end

go 

exec InsertBusDetails 'Mh12ok4567','PuneToGoa',40,'Non-AC',1

insert into BusProviderDetails values(2,24)

go
-- delete bus data from all tables by bus no
alter proc DeleteBusRecord( @busId int)
as
begin
	
	delete from SeatBookingStatus where busId=@busId
	delete from BusDetails where busId=@busId
	delete from RouteDetails where BusId=@busId
	delete from FeedbackDetails where BusId=@busId
 
end



exec DeleteBusRecord 28
go
--update seat status by providing seat no , bus id and status 
create proc BookSeat(@seatNo int, @busId int ,@status varchar(40))
as
begin
update S set S.[Status]= @status  from SeatBookingStatus S
join BusDetails B on S.BusId =B.BusId where S.SeatNo=@seatNo and B.BusId=@busId
end
exec BookSeat 1,34,'Booked'
go
--update seat type by providing seat no , bus id and seat Type 
create proc ChangeSeatType(@seatNo int, @busId int ,@seatType varchar(40))
as
begin
update S set S.SeatType= @seatType  from SeatBookingStatus S
join BusDetails B on S.BusId =B.BusId where S.SeatNo=@seatNo and B.BusId=@busId
end

go

create proc GetBusProviderDetails
as
begin
select B.*,P.* from BusDetails B join BusProviderDetails BP
on B.BusId = BP.BusId join ProviderDetails P 
on BP.ProviderId = P.ProviderId
end

go

create proc GetBusDetails
as
begin
	select * from BusDetails 
end
go
exec GetBusDetails
--Add city details 
create proc InsertCityDetails(@city varchar(40),@state varchar(40))
as
begin
	insert into CityDetails values(@city,@state)
end

exec  InsertCityDetails'Pune','Maharashtra'
go
-- Display city details
create proc GetCityDetails
as
begin
	select * from CityDetails
end

exec GetCityDetails
go

--Add route information into 'RouteDetails' table
create proc AddRouteDetails(@busId int, @sourceId int, @destinationId int, @dateOfJourney date,@price float,@arrivalTime time,@departureTime time)
as
begin
	insert into RouteDetails values(@busId,@sourceId,@destinationId,@dateOfJourney,@price,@arrivalTime,@departureTime)
end
exec AddRouteDetails 34,1,2,'2019-04-30',500,'9:30AM','7:45PM'
go
-- Show all routes
alter proc GetRouteDetails(@sourceId int,@destinationId int,@dateOfJourney date)
as
begin
     
	(select R.*,B.BusName,B.[Type],B.BusNo,(select avg(rating) from FeedbackDetails where  BusId =B.BusId  )as Rating,
	(select count(SeatNo) from SeatBookingStatus where BusId =B.BusId and [Status]= 'Available')as AvailableSeats  
	from RouteDetails R
    join BusDetails B on R.BusId=B.BusId
	where SourceId=@sourceId and DestinationId= @destinationId and DateOfJourney=@dateOfJourney)

end
 
exec GetRouteDetails 1,2,'2019-04-30'
go
select avg(Rating) from FeedbackDetails where BusId=34
ALTER TABLE  feedbackdetails
ADD CONSTRAINT  uniq UNIQUE (TicketId);   
GO  
go
alter proc GetBookingStatus(@busId int)
as
begin
	select * from SeatBookingStatus where BusId=@busId
end
select count(SeatNo) from SeatBookingStatus where BusId =34 and [Status]= 'Available'
exec GetBookingStatus 34
go

create proc GetPassangerDetails(@ticketId int)
as
begin
	select * from PassengerDetails where TicketId=@ticketId
end
go
insert into TicketDetails values(2,2,(select Price*2 from RouteDetails where RouteId=2))

insert into FeedbackDetails values(34,1,1)

select IDENT_CURRENT('TicketDetails')

select B.BusName,B.BusNo,T.Amount from TicketDetails T join RouteDetails R
	on T.RouteId =R.RouteId
	join BusDetails B on R.BusId=B.BusId
 	join SeatBookingStatus S on S.BusId =B.BusId
	 where T.TicketId=1  
	 (select * from PassengerDetails where TicketId=1 )

go

alter proc CancelTicket(@ticketId int)
as
begin
 update SeatBookingStatus set [Status]='Available' from TicketDetails T join RouteDetails R
	on T.RouteId =R.RouteId
	join BusDetails B on R.BusId=B.BusId
 	join SeatBookingStatus S on S.BusId =B.BusId
	 where T.TicketId=@ticketId and S.SeatNo in
	(select seatNo from PassengerDetails where TicketId=@ticketId )

	delete from PassengerDetails where TicketId=@ticketId
	delete from FeedbackDetails where TicketId=@ticketId
	delete from TicketDetails where TicketId=@ticketId

 end

 exec CancelTicket 1


 go

 select * from OfferDetails where ExpiryDate>=Getdate()

 select DiscountPercentage from OfferDetails 
 where OfferCode='jan25' and 301>MinAmount and ExpiryDate>=Getdate();

select 301 - (20*301/100)
