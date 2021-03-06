USE [BusHire]
GO
/****** Object:  Table [dbo].[BookDetails]    Script Date: 5/6/2019 6:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookDetails](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Contact] [bigint] NOT NULL,
 CONSTRAINT [PK_BookDetails] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[City]    Script Date: 5/6/2019 6:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HireDetails]    Script Date: 5/6/2019 6:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HireDetails](
	[HireId] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Capacity] [int] NOT NULL,
	[Source] [int] NOT NULL,
	[Destination] [int] NOT NULL,
	[Return] [varchar](50) NOT NULL,
	[BookId] [int] NOT NULL,
 CONSTRAINT [PK_HireDetails] PRIMARY KEY CLUSTERED 
(
	[HireId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[HireDetails]  WITH CHECK ADD  CONSTRAINT [FK_HireDetails_City] FOREIGN KEY([BookId])
REFERENCES [dbo].[BookDetails] ([BookId])
GO
ALTER TABLE [dbo].[HireDetails] CHECK CONSTRAINT [FK_HireDetails_City]
GO
ALTER TABLE [dbo].[HireDetails]  WITH CHECK ADD  CONSTRAINT [FK_HireDetails_City1] FOREIGN KEY([Destination])
REFERENCES [dbo].[City] ([CityId])
GO
ALTER TABLE [dbo].[HireDetails] CHECK CONSTRAINT [FK_HireDetails_City1]
GO
ALTER TABLE [dbo].[HireDetails]  WITH CHECK ADD  CONSTRAINT [FK_HireDetails_City2] FOREIGN KEY([Source])
REFERENCES [dbo].[City] ([CityId])
GO
ALTER TABLE [dbo].[HireDetails] CHECK CONSTRAINT [FK_HireDetails_City2]
GO
