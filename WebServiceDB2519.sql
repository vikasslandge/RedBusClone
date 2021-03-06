USE [master]
GO
/****** Object:  Database [ProvidersWS_DB]    Script Date: 5/2/2019 3:36:21 PM ******/
CREATE DATABASE [ProvidersWS_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProvidersWS_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.LOCAL\MSSQL\DATA\ProvidersWS_DB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProvidersWS_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.LOCAL\MSSQL\DATA\ProvidersWS_DB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProvidersWS_DB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProvidersWS_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProvidersWS_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProvidersWS_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProvidersWS_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProvidersWS_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProvidersWS_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProvidersWS_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProvidersWS_DB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ProvidersWS_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProvidersWS_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProvidersWS_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProvidersWS_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProvidersWS_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProvidersWS_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProvidersWS_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProvidersWS_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProvidersWS_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProvidersWS_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProvidersWS_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProvidersWS_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProvidersWS_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProvidersWS_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProvidersWS_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProvidersWS_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProvidersWS_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProvidersWS_DB] SET  MULTI_USER 
GO
ALTER DATABASE [ProvidersWS_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProvidersWS_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProvidersWS_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProvidersWS_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ProvidersWS_DB]
GO
/****** Object:  StoredProcedure [dbo].[AddRouteDetails]    Script Date: 5/2/2019 3:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddRouteDetails](@busId int, @sourceId int, @destinationId int, @dateOfJourney date,@price float,@arrivalTime time,@departureTime time)
as
begin
	insert into RouteDetails values(@busId,@sourceId,@destinationId,@dateOfJourney,@price,@arrivalTime,@departureTime)
end
GO
/****** Object:  StoredProcedure [dbo].[BookSeat]    Script Date: 5/2/2019 3:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[BookSeat](@seatNo int, @busId int ,@status varchar(40))
as
begin
update S set S.[Status]= @status  from SeatBookingStatus S
join BusDetails B on S.BusId =B.BusId where S.SeatNo=@seatNo and B.BusId=@busId
end
GO
/****** Object:  StoredProcedure [dbo].[ChangeSeatType]    Script Date: 5/2/2019 3:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ChangeSeatType](@seatNo int, @busId int ,@seatType varchar(40))
as
begin
update S set S.SeatType= @seatType  from SeatBookingStatus S
join BusDetails B on S.BusId =B.BusId where S.SeatNo=@seatNo and B.BusId=@busId
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteBusRecord]    Script Date: 5/2/2019 3:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteBusRecord]( @busId int)
as
begin
	
	delete from SeatBookingStatus where busId=@busId
	delete from BusDetails where busId=@busId
	delete from RouteDetails where BusId=@busId
	delete from FeedbackDetails where BusId=@busId
 
end
GO
/****** Object:  StoredProcedure [dbo].[GetBookingStatus]    Script Date: 5/2/2019 3:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBookingStatus](@busId int)
as
begin
	select * from SeatBookingStatus where BusId=@busId
end
GO
/****** Object:  StoredProcedure [dbo].[GetBusDetails]    Script Date: 5/2/2019 3:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetBusDetails]
as
begin
	select * from BusDetails 
end
GO
/****** Object:  StoredProcedure [dbo].[GetCityDetails]    Script Date: 5/2/2019 3:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetCityDetails]
as
begin
	select * from CityDetails
end
GO
/****** Object:  StoredProcedure [dbo].[GetPassangerDetails]    Script Date: 5/2/2019 3:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetPassangerDetails](@ticketId int)
as
begin
	select * from PassengerDetails where TicketId=@ticketId
end
GO
/****** Object:  StoredProcedure [dbo].[GetRouteDetails]    Script Date: 5/2/2019 3:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetRouteDetails](@sourceId int,@destinationId int,@dateOfJourney date)
as
begin
     
	(select R.*,B.BusName,B.[Type],B.BusNo,(select avg(rating) from FeedbackDetails where  BusId =B.BusId  )as Rating,
	(select count(SeatNo) from SeatBookingStatus where BusId =B.BusId and [Status]= 'Available')as AvailableSeats  
	from RouteDetails R
    join BusDetails B on R.BusId=B.BusId
	where SourceId=@sourceId and DestinationId= @destinationId and DateOfJourney=@dateOfJourney)

end
GO
/****** Object:  StoredProcedure [dbo].[InsertBusDetails]    Script Date: 5/2/2019 3:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertBusDetails](@busNo varchar(20) ,@busname varchar(40),@capacity int, @type varchar(40))
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
GO
/****** Object:  StoredProcedure [dbo].[InsertCityDetails]    Script Date: 5/2/2019 3:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertCityDetails](@city varchar(40),@state varchar(40))
as
begin
	insert into CityDetails values(@city,@state)
end
GO
/****** Object:  Table [dbo].[BusDetails]    Script Date: 5/2/2019 3:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BusDetails](
	[BusId] [int] IDENTITY(1,1) NOT NULL,
	[BusName] [varchar](50) NOT NULL,
	[Capacity] [int] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[BusNo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BusDetails] PRIMARY KEY CLUSTERED 
(
	[BusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CityDetails]    Script Date: 5/2/2019 3:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CityDetails](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NOT NULL,
	[CityState] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CityDetails] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FeedbackDetails]    Script Date: 5/2/2019 3:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbackDetails](
	[FeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[BusId] [int] NOT NULL,
	[TicketId] [int] NOT NULL,
	[Rating] [float] NOT NULL,
 CONSTRAINT [PK_FeedbackDetails] PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_FeedbackDetails] UNIQUE NONCLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uniq] UNIQUE NONCLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PassengerDetails]    Script Date: 5/2/2019 3:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PassengerDetails](
	[PassengerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[Phone] [char](10) NOT NULL,
	[TicketId] [int] NOT NULL,
	[SeatNo] [int] NOT NULL,
 CONSTRAINT [PK_PassengerDetails] PRIMARY KEY CLUSTERED 
(
	[PassengerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RouteDetails]    Script Date: 5/2/2019 3:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteDetails](
	[RouteId] [int] IDENTITY(1,1) NOT NULL,
	[BusId] [int] NOT NULL,
	[SourceId] [int] NOT NULL,
	[DestinationId] [int] NOT NULL,
	[DateOfJourney] [date] NOT NULL,
	[Price] [float] NOT NULL,
	[ArrivalTime] [time](7) NOT NULL,
	[DepartureTime] [time](7) NOT NULL,
 CONSTRAINT [PK_RouteDetails] PRIMARY KEY CLUSTERED 
(
	[RouteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SeatBookingStatus]    Script Date: 5/2/2019 3:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SeatBookingStatus](
	[BusId] [int] NOT NULL,
	[SeatNo] [int] NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[SeatType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SeatBookingStatus] PRIMARY KEY CLUSTERED 
(
	[BusId] ASC,
	[SeatNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TicketDetails]    Script Date: 5/2/2019 3:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketDetails](
	[TicketId] [int] IDENTITY(1,1) NOT NULL,
	[RouteId] [int] NOT NULL,
	[TotalSelectedSeats] [int] NOT NULL,
	[Amount] [float] NOT NULL,
 CONSTRAINT [PK_TicketDetails] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[FeedbackDetails]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackDetails_BusDetails] FOREIGN KEY([BusId])
REFERENCES [dbo].[BusDetails] ([BusId])
GO
ALTER TABLE [dbo].[FeedbackDetails] CHECK CONSTRAINT [FK_FeedbackDetails_BusDetails]
GO
ALTER TABLE [dbo].[FeedbackDetails]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackDetails_TicketDetails] FOREIGN KEY([TicketId])
REFERENCES [dbo].[TicketDetails] ([TicketId])
GO
ALTER TABLE [dbo].[FeedbackDetails] CHECK CONSTRAINT [FK_FeedbackDetails_TicketDetails]
GO
ALTER TABLE [dbo].[PassengerDetails]  WITH CHECK ADD  CONSTRAINT [FK_PassengerDetails_TicketDetails] FOREIGN KEY([TicketId])
REFERENCES [dbo].[TicketDetails] ([TicketId])
GO
ALTER TABLE [dbo].[PassengerDetails] CHECK CONSTRAINT [FK_PassengerDetails_TicketDetails]
GO
ALTER TABLE [dbo].[RouteDetails]  WITH CHECK ADD  CONSTRAINT [FK_RouteDetails_BusDetails] FOREIGN KEY([BusId])
REFERENCES [dbo].[BusDetails] ([BusId])
GO
ALTER TABLE [dbo].[RouteDetails] CHECK CONSTRAINT [FK_RouteDetails_BusDetails]
GO
ALTER TABLE [dbo].[RouteDetails]  WITH CHECK ADD  CONSTRAINT [FK_RouteDetails_CityDetails] FOREIGN KEY([SourceId])
REFERENCES [dbo].[CityDetails] ([CityId])
GO
ALTER TABLE [dbo].[RouteDetails] CHECK CONSTRAINT [FK_RouteDetails_CityDetails]
GO
ALTER TABLE [dbo].[RouteDetails]  WITH CHECK ADD  CONSTRAINT [FK_RouteDetails_CityDetails1] FOREIGN KEY([DestinationId])
REFERENCES [dbo].[CityDetails] ([CityId])
GO
ALTER TABLE [dbo].[RouteDetails] CHECK CONSTRAINT [FK_RouteDetails_CityDetails1]
GO
ALTER TABLE [dbo].[SeatBookingStatus]  WITH CHECK ADD  CONSTRAINT [FK_SeatBookingStatus_BusDetails] FOREIGN KEY([BusId])
REFERENCES [dbo].[BusDetails] ([BusId])
GO
ALTER TABLE [dbo].[SeatBookingStatus] CHECK CONSTRAINT [FK_SeatBookingStatus_BusDetails]
GO
ALTER TABLE [dbo].[TicketDetails]  WITH CHECK ADD  CONSTRAINT [FK_TicketDetails_RouteDetails] FOREIGN KEY([RouteId])
REFERENCES [dbo].[RouteDetails] ([RouteId])
GO
ALTER TABLE [dbo].[TicketDetails] CHECK CONSTRAINT [FK_TicketDetails_RouteDetails]
GO
USE [master]
GO
ALTER DATABASE [ProvidersWS_DB] SET  READ_WRITE 
GO
