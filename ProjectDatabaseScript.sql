USE [master]
GO
/****** Object:  Database [OnlineBusReservation]    Script Date: 4/26/2019 7:14:43 PM ******/
CREATE DATABASE [OnlineBusReservation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineBusReservation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.LOCAL\MSSQL\DATA\OnlineBusReservation.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineBusReservation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.LOCAL\MSSQL\DATA\OnlineBusReservation_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlineBusReservation] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineBusReservation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineBusReservation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineBusReservation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineBusReservation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineBusReservation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineBusReservation] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineBusReservation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineBusReservation] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineBusReservation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineBusReservation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineBusReservation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineBusReservation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineBusReservation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineBusReservation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineBusReservation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineBusReservation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineBusReservation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineBusReservation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineBusReservation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineBusReservation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineBusReservation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineBusReservation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineBusReservation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineBusReservation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineBusReservation] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineBusReservation] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineBusReservation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineBusReservation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineBusReservation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineBusReservation] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [OnlineBusReservation]
GO
/****** Object:  Table [dbo].[CityDetails]    Script Date: 4/26/2019 7:14:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CityDetails](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CityDetails] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FeedbackDetails]    Script Date: 4/26/2019 7:14:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeedbackDetails](
	[FeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FeedbackDetails] PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OfferDetails]    Script Date: 4/26/2019 7:14:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OfferDetails](
	[OfferId] [int] IDENTITY(1,1) NOT NULL,
	[OfferCode] [varchar](50) NOT NULL,
	[DiscountPercentage] [int] NOT NULL,
	[MinAmount] [int] NOT NULL,
 CONSTRAINT [PK_OfferDetails] PRIMARY KEY CLUSTERED 
(
	[OfferId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OffersUsed]    Script Date: 4/26/2019 7:14:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OffersUsed](
	[UserId] [int] NOT NULL,
	[OfferId] [int] NOT NULL,
 CONSTRAINT [PK_OffersUsed] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[OfferId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PassengerDetails]    Script Date: 4/26/2019 7:14:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PassengerDetails](
	[PassengerId] [int] IDENTITY(1,1) NOT NULL,
	[PassengerName] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[Phone] [char](10) NOT NULL,
 CONSTRAINT [PK_PassengerDetails] PRIMARY KEY CLUSTERED 
(
	[PassengerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RouteDetails]    Script Date: 4/26/2019 7:14:43 PM ******/
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
 CONSTRAINT [PK_RouteDetails.] PRIMARY KEY CLUSTERED 
(
	[RouteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TicketDetails]    Script Date: 4/26/2019 7:14:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketDetails](
	[TicketId] [int] IDENTITY(1,1) NOT NULL,
	[RouteId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_TicketDetails] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TicketSeatDeatils]    Script Date: 4/26/2019 7:14:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketSeatDeatils](
	[TicketId] [int] NOT NULL,
	[PassengerId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 4/26/2019 7:14:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserId] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[Phone] [char](10) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[City] [int] NOT NULL,
	[UserType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserDeatails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[FeedbackDetails]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackDetails_UserDeatails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[FeedbackDetails] CHECK CONSTRAINT [FK_FeedbackDetails_UserDeatails]
GO
ALTER TABLE [dbo].[OffersUsed]  WITH CHECK ADD  CONSTRAINT [FK_OffersUsed_OfferDetails] FOREIGN KEY([OfferId])
REFERENCES [dbo].[OfferDetails] ([OfferId])
GO
ALTER TABLE [dbo].[OffersUsed] CHECK CONSTRAINT [FK_OffersUsed_OfferDetails]
GO
ALTER TABLE [dbo].[OffersUsed]  WITH CHECK ADD  CONSTRAINT [FK_OffersUsed_UserDeatails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[OffersUsed] CHECK CONSTRAINT [FK_OffersUsed_UserDeatails]
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
ALTER TABLE [dbo].[TicketDetails]  WITH CHECK ADD  CONSTRAINT [FK_TicketDetails_RouteDetails] FOREIGN KEY([RouteId])
REFERENCES [dbo].[RouteDetails] ([RouteId])
GO
ALTER TABLE [dbo].[TicketDetails] CHECK CONSTRAINT [FK_TicketDetails_RouteDetails]
GO
ALTER TABLE [dbo].[TicketDetails]  WITH CHECK ADD  CONSTRAINT [FK_TicketDetails_UserDeatails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[TicketDetails] CHECK CONSTRAINT [FK_TicketDetails_UserDeatails]
GO
ALTER TABLE [dbo].[TicketSeatDeatils]  WITH CHECK ADD  CONSTRAINT [FK_TicketSeatDeatils_PassengerDetails] FOREIGN KEY([PassengerId])
REFERENCES [dbo].[PassengerDetails] ([PassengerId])
GO
ALTER TABLE [dbo].[TicketSeatDeatils] CHECK CONSTRAINT [FK_TicketSeatDeatils_PassengerDetails]
GO
ALTER TABLE [dbo].[TicketSeatDeatils]  WITH CHECK ADD  CONSTRAINT [FK_TicketSeatDeatils_TicketDetails] FOREIGN KEY([TicketId])
REFERENCES [dbo].[TicketDetails] ([TicketId])
GO
ALTER TABLE [dbo].[TicketSeatDeatils] CHECK CONSTRAINT [FK_TicketSeatDeatils_TicketDetails]
GO
USE [master]
GO
ALTER DATABASE [OnlineBusReservation] SET  READ_WRITE 
GO
