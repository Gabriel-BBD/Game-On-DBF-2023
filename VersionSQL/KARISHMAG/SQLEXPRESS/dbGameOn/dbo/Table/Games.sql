/****** Object:  Table [dbo].[Games]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Games](
	[GameID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[ReleaseDate] [date] NOT NULL,
	[Price] [float] NOT NULL,
	[DeveloperID] [int] NOT NULL,
 CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [fk_Game_PrimDev_CompanyID] FOREIGN KEY([DeveloperID])
REFERENCES [dbo].[PrimaryDevelopers] ([DeveloperID])
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [fk_Game_PrimDev_CompanyID]
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [CHK_Price] CHECK  (([Price]>=(0)))
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [CHK_Price]
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [CHK_ReleaseDate] CHECK  (([ReleaseDate]<=getdate()))
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [CHK_ReleaseDate]
