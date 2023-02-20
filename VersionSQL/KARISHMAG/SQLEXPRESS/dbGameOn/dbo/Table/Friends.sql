/****** Object:  Table [dbo].[Friends]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Friends](
	[FriendsID] [int] IDENTITY(1,1) NOT NULL,
	[InviterID] [int] NULL,
	[InviteeID] [int] NULL,
	[TimeStamp] [smalldatetime] NULL,
 CONSTRAINT [PK_Friends] PRIMARY KEY CLUSTERED 
(
	[FriendsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [fk_Friends_Gamer_GamerID] FOREIGN KEY([InviterID])
REFERENCES [dbo].[Gamers] ([GamerID])
ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [fk_Friends_Gamer_GamerID]
