/****** Object:  Table [dbo].[PrimaryDevelopers]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PrimaryDevelopers](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[GameID] [varchar](50) NULL,
 CONSTRAINT [PK_PrimDev] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
