
USE dbGameOn;
GO

INSERT INTO [dbo].[Genres] ([Name])
VALUES ('FPS'),
	('MOBA'),
	('RTS'),
	('Simulation'),
	('Puzzle'),
	('Party'),
	('Action-Adventure'),
	('Soulslike'),
	('Roguelike'),
	('Platformer'),
	('Horror'),
	('Sandbox'),
	('Sports'),
	('RPG'),
	('Fighting'),
	('Stealth'),
	('Rythm'),
	('Battle-royale')
GO

INSERT INTO [dbo].[Platforms] ([Name])
VALUES ('PC'),
	('PS3'),
	('PS4'),
	('PS5'),
	('XboxOne'),
	('XboxX'),
	('XboxS'),
	('Switch'),
	('Steamdeck'),
	('Wii'),
	('WiiU'),
	('Other'),
	('Mobile')
GO

INSERT INTO [dbo].[GamerTypes] ([Name])
VALUES ('Casual'),
	('Hardcore'),
	('Professional'),
	('Critic'),
	('Developer')
GO

INSERT INTO [dbo].[PrimaryDevelopers] ([Name], [Country])
VALUES ('Nintendo', 'Japan'),
	('Valve', 'USA'),
	('Activision Blizzard', 'USA'),
	('From Software', 'Japan'),
	('ConcernedApe', 'USA')
GO

INSERT INTO [dbo].[Games] ([Title], [ReleaseDate], [Price], [DeveloperID])
VALUES ('Stardew Valley', '2016-02-26', 14.99, 5),
	('Sekiro: Shadows Die Twice', '2019-03-22', 59.99, 4),
	('Overwatch 2', '2022-10-04', 0, 3),
	('Portal 2', '2011-04-18', 19.99, 2),
	('The Legend of Zelda: Breath of the Wild', '2017-03-03', 59.99, 1)
GO

INSERT INTO [dbo].[GameGenres] ([GameID], [GenreID])
VALUES (1, 4),
	(1, 12),
	(1, 14),
	(2, 7),
	(2, 8),
	(2, 16),
	(3, 1),
	(4, 1),
	(4, 5),
	(4, 10),
	(5, 7),
	(5, 12),
	(5, 14)
GO

INSERT INTO [dbo].[Gamers] ([GamerTypeID], [HandlerName], [Email], [BirthYear], [Country], [Admin])
VALUES (1, 'Bobert', 'bob@yahoo.com', 1970, 'USA', 0),
	(2, 'xxDragonSlayerxx', 'dragon@yahoo.com', 2004, 'South Africa', 0),
	(3, 'FPS_Enjoyer', 'chad@yahoo.com', 1998, 'Nepal', 0),
	(4, 'Respectable_Admin', 'admin@yahoo.com', 1985, 'Japan', 1),
	(5, 'helpimcold', 'penguin@yahoo.com', 2001, 'Antarctica', 0)
GO

INSERT INTO [dbo].[Ratings] ([GameID], [PlatformID], [GamerID], [Rating], [PlayHours], [CompletionRate], [Comment], [TimeStamp])
VALUES (1, 1, 5, 87, 92, 100, 'Amazing game, really made me feel like a farmer!', CAST(GETDATE() AS smalldatetime)),
	(1, 1, 4, 36, 12, 24, 'Bad game, really made me feel like a farmer!', CAST(GETDATE() AS smalldatetime)),
	(2, 3, 2, 100, 164, 100, 'Perfect game, really made me feel like a ninja!', CAST(GETDATE() AS smalldatetime)),
	(2, 1, 1, 79, 55, 67, 'Cool game, did a lot of killing!', CAST(GETDATE() AS smalldatetime)),
	(3, 7, 2, 12, 400, 94, 'Terrible game, constant server issues!', CAST(GETDATE() AS smalldatetime)),
	(3, 4, 3, 51, 48, 37, 'Average game, nice graphics but bad community', CAST(GETDATE() AS smalldatetime)),
	(4, 1, 3, 96, 28, 75, 'This game broke my brain, 5 stars!', CAST(GETDATE() AS smalldatetime)),
	(4, 9, 4, 56, 4, 9, 'Way too hard :(', CAST(GETDATE() AS smalldatetime)),
	(5, 8, 1, 100, 427, 100, 'Awe inspiring, masive world and endless possibilities', CAST(GETDATE() AS smalldatetime)),
	(5, 8, 5, 71, 58, 60, 'Great game, very innovative but puzzles left me wanting more', CAST(GETDATE() AS smalldatetime))
GO

INSERT INTO [dbo].[Friends] ([InviteeID], [InviterID], [TimeStamp])
VALUES (4, 1, CAST(GETDATE() AS smalldatetime)),
	(4, 2, CAST(GETDATE() AS smalldatetime)),
	(4, 3, CAST(GETDATE() AS smalldatetime)),
	(4, 5, CAST(GETDATE() AS smalldatetime)),
	(3, 5, CAST(GETDATE() AS smalldatetime)),
	(2, 1, CAST(GETDATE() AS smalldatetime))
GO
	