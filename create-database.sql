USE master;
GO

CREATE DATABASE dbGameOn;
GO

/* CREATE TABLES */
USE dbGameOn;
CREATE TABLE [dbo].[Games](
    [GameID] [int] IDENTITY(1,1) NOT NULL,
    [Title] [varchar](100) NOT NULL,
    [ReleaseDate] [date] NOT NULL,
    [Price] [float] NOT NULL,
    [DeveloperID] [int] NOT NULL
);
GO

USE dbGameOn;
ALTER TABLE dbo.Games
ADD CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED ([GameID] ASC);
GO

/* CREATE GENRE TABLE */
USE dbGameOn;
CREATE TABLE [dbo].[Genres](
    [GenreID] [int] IDENTITY(1,1) NOT NULL,
    [Name] [varchar](25) NOT NULL,
);
GO

USE dbGameOn;
ALTER TABLE dbo.Genres
ADD CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED ([GenreID] ASC);
GO

USE dbGameOn;
CREATE TABLE [dbo].[GameGenres](
    [GameGenreID] [int] IDENTITY(1,1) NOT NULL,
	[GenreID] [int] NOT NULL,
	[GameID]  [int] NOT NULL,
);
GO

USE dbGameOn;
ALTER TABLE dbo.GameGenres
ADD CONSTRAINT [PK_GameGenre] PRIMARY KEY CLUSTERED ([GameGenreID] ASC);
GO

USE dbGameOn;
 CREATE TABLE [dbo].[PrimaryDevelopers](
    [DeveloperID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Country]  [varchar](50) NOT NULL,
);
GO

USE dbGameOn;
ALTER TABLE dbo.PrimaryDevelopers
ADD CONSTRAINT [PK_PrimDev] PRIMARY KEY CLUSTERED ([DeveloperID] ASC);
GO

USE dbGameOn;
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
);
GO



USE dbGameOn;
ALTER TABLE dbo.Ratings
ADD CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED ([RatingID] ASC);
GO

USE dbGameOn;
 CREATE TABLE [dbo].[Platforms](
    [PlatformID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
);
GO

USE dbGameOn;
ALTER TABLE dbo.Platforms
ADD CONSTRAINT [PK_Platforms] PRIMARY KEY CLUSTERED ([PlatformID] ASC);
GO

USE dbGameOn;
 CREATE TABLE [dbo].[GamerTypes](
    [TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
);
GO

USE dbGameOn;
ALTER TABLE dbo.GamerTypes
ADD CONSTRAINT [PK_GamerTypes] PRIMARY KEY CLUSTERED ([TypeID] ASC);
GO

USE dbGameOn;
CREATE TABLE [dbo].[Gamers](
    [GamerID] [int] IDENTITY(1,1) NOT NULL,
	[GamerTypeID] [int] NOT NULL,
	[HandlerName] [varchar](30)NOT NULL,
	[Email] [varchar](50)NOT NULL,
	[BirthYear] [int] NOT NULL,
    [Country] [varchar](50) NOT NULL,
    [Admin] [bit] NOT NULL,

);
GO

USE dbGameOn;
ALTER TABLE dbo.Gamers
ADD CONSTRAINT [PK_Gamers] PRIMARY KEY CLUSTERED ([GamerID] ASC);
GO

USE dbGameOn;
 CREATE TABLE [dbo].[Friends](
	[InviterID] [int] NOT NULL,
	[InviteeID] [int] NOT NULL,
	[TimeStamp] [smalldatetime] NULL
);
GO

USE dbGameOn;
ALTER TABLE dbo.Friends
ADD CONSTRAINT [PK_Friends] PRIMARY KEY (InviterID, InviteeID);
GO


/*FOREIGN KEYS*/
USE dbGameOn;
ALTER TABLE GameGenres
    ADD CONSTRAINT fk_Genres_GameGenres_GenreID FOREIGN KEY(GenreID)
    REFERENCES Genres(GenreID)
GO


USE dbGameOn;
ALTER TABLE GameGenres
    ADD CONSTRAINT fk_Game_GameGenres_GameID FOREIGN KEY(GameID)
    REFERENCES Games(GameID)
GO

USE dbGameOn;
ALTER TABLE Games
    ADD CONSTRAINT fk_Game_PrimDev_CompanyID FOREIGN KEY(DeveloperID)
    REFERENCES PrimaryDevelopers(DeveloperID)
GO


USE dbGameOn;
ALTER TABLE Ratings
    ADD CONSTRAINT fk_Ratings_Games_GameID FOREIGN KEY(GameID)
    REFERENCES Games(GameID)
GO

USE dbGameOn;
ALTER TABLE Ratings
    ADD CONSTRAINT fk_Ratings_Platform_PlatformID FOREIGN KEY(PlatformID)
    REFERENCES Platforms(PlatformID)
GO

USE dbGameOn;
ALTER TABLE Ratings
    ADD CONSTRAINT fk_Ratings_Gamers_GamerID FOREIGN KEY(GamerID)
    REFERENCES Gamers(GamerID)
GO

USE dbGameOn;
ALTER TABLE Gamers
    ADD CONSTRAINT fk_GamerTypes_Gamers_GamerTypeID FOREIGN KEY(GamerTypeID)
    REFERENCES GamerTypes(TypeID)
GO

USE dbGameOn;
ALTER TABLE Friends
    ADD CONSTRAINT fk_Gamers_Friends_GamerID FOREIGN KEY(InviterID)
    REFERENCES Gamers(GamerID)
GO

USE dbGameOn;
ALTER TABLE Friends
    ADD CONSTRAINT fk_Friends_Gamer_GamerID FOREIGN KEY(InviterID)
    REFERENCES Gamers(GamerID)
GO


/*CONSTRAINTS */
USE dbGameOn;
ALTER TABLE Gamers
 ADD CONSTRAINT CHK_Year CHECK (BirthYear BETWEEN 1900 AND CAST(Year(GETDATE()) AS int) - 5)

ALTER TABLE Ratings
ADD CONSTRAINT CHK_Ratings CHECK (Rating BETWEEN 0 AND 100)

ALTER TABLE Ratings
ADD CONSTRAINT CHK_PlayHours CHECK (PlayHours > 0)

ALTER TABLE Ratings
ADD CONSTRAINT CHK_Completion CHECK (CompletionRate BETWEEN 0 AND 100)

ALTER TABLE Games
ADD CONSTRAINT CHK_ReleaseDate CHECK (ReleaseDate <= GETDATE())

ALTER TABLE Games
ADD CONSTRAINT CHK_Price CHECK (Price >= 0)

GO

/* UDF FOR COMPOSITE KEY*/
GO
CREATE FUNCTION CheckInviter (
    @field INT
)
RETURNS INTEGER
AS
BEGIN
    IF EXISTS (SELECT* FROM Friends WHERE InviterID = @field)
	BEGIN
        return 0
	END
    return 1
END
GO
/*COMPOSITE KEY CONSTRAINT */
ALTER TABLE Friends
ADD CONSTRAINT CHK_Friends CHECK (
dbo.CheckInviter(Friends.InviteeID) > 0)
GO