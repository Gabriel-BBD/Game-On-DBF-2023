/****** Object:  Table [dbo].[GameGenres]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GameGenres](
	[GameGenreID] [int] IDENTITY(1,1) NOT NULL,
	[GenreID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
 CONSTRAINT [PK_GameGenre] PRIMARY KEY CLUSTERED 
(
	[GameGenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[GameGenres]  WITH CHECK ADD  CONSTRAINT [fk_Game_GameGenres_GameID] FOREIGN KEY([GameID])
REFERENCES [dbo].[Games] ([GameID])
ALTER TABLE [dbo].[GameGenres] CHECK CONSTRAINT [fk_Game_GameGenres_GameID]
ALTER TABLE [dbo].[GameGenres]  WITH CHECK ADD  CONSTRAINT [fk_Genres_GameGenres_GenreID] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genres] ([GenreID])
ALTER TABLE [dbo].[GameGenres] CHECK CONSTRAINT [fk_Genres_GameGenres_GenreID]
