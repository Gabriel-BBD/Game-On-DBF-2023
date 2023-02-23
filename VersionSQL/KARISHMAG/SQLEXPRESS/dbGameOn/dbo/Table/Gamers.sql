/****** Object:  Table [dbo].[Gamers]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Gamers](
	[GamerID] [int] IDENTITY(1,1) NOT NULL,
	[GamerTypeID] [int] NOT NULL,
	[HandlerName] [varchar](30) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[BirthYear] [int] NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[Admin] [bit] NOT NULL,
 CONSTRAINT [PK_Gamers] PRIMARY KEY CLUSTERED 
(
	[GamerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Gamers]  WITH CHECK ADD  CONSTRAINT [fk_GamerTypes_Gamers_GamerTypeID] FOREIGN KEY([GamerTypeID])
REFERENCES [dbo].[GamerTypes] ([TypeID])
ALTER TABLE [dbo].[Gamers] CHECK CONSTRAINT [fk_GamerTypes_Gamers_GamerTypeID]
ALTER TABLE [dbo].[Gamers]  WITH CHECK ADD  CONSTRAINT [CHK_Year] CHECK  (([BirthYear]>=(1900) AND [BirthYear]<=(CONVERT([int],datepart(year,getdate()))-(5))))
ALTER TABLE [dbo].[Gamers] CHECK CONSTRAINT [CHK_Year]
