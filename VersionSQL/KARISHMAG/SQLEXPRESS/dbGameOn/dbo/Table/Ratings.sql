/****** Object:  Table [dbo].[Ratings]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Ratings](
	[RatingID] [int] IDENTITY(1,1) NOT NULL,
	[GameID] [int] NOT NULL,
	[PlatformID] [int] NOT NULL,
	[GamerID] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[PlayHours] [int] NOT NULL,
	[CompletionRate] [int] NOT NULL,
	[Comment] [varchar](250) NULL,
	[TimeStamp] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [fk_Ratings_Gamers_GamerID] FOREIGN KEY([GamerID])
REFERENCES [dbo].[Gamers] ([GamerID])
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [fk_Ratings_Gamers_GamerID]
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [fk_Ratings_Games_GameID] FOREIGN KEY([GameID])
REFERENCES [dbo].[Games] ([GameID])
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [fk_Ratings_Games_GameID]
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [fk_Ratings_Platform_PlatformID] FOREIGN KEY([PlatformID])
REFERENCES [dbo].[Platforms] ([PlatformID])
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [fk_Ratings_Platform_PlatformID]
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [CHK_Completion] CHECK  (([CompletionRate]>=(0) AND [CompletionRate]<=(100)))
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [CHK_Completion]
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [CHK_PlayHours] CHECK  (([PlayHours]>(0)))
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [CHK_PlayHours]
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [CHK_Ratings] CHECK  (([Rating]>=(0) AND [Rating]<=(100)))
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [CHK_Ratings]
