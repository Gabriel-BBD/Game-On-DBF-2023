USE dbGameOn;
GO

--Add friend Proc
CREATE PROCEDURE AddFriend @InviterID int, @InviteeID int
AS
INSERT INTO [dbo].[Friends]
           ([InviterID]
           ,[InviteeID]
           ,[TimeStamp])
     VALUES
           (@InviterID
           ,@InviteeID
           ,GETDATE())
GO

--getTotalCompleted Function
CREATE FUNCTION getTotalCompleted(@Gamer as int)
RETURNS int
AS
BEGIN
Declare @sumComplete int
Select @sumComplete = count(RatingID)
From Ratings
Where GamerID = @Gamer
AND
CompletionRate = 100
RETURN @sumComplete
END
GO

--getTotalPlayed Function
CREATE FUNCTION getTotalPlayed(@Gamer as int)
RETURNS int
AS
BEGIN
Declare @sumPlayed int
Select @sumPlayed = count(RatingID)
From Ratings
Where GamerID = @Gamer
RETURN @sumPlayed
END
GO

--getTotalHours Function
CREATE FUNCTION getTotalHours(@Gamer as int)
RETURNS int
AS
BEGIN
Declare @sumHour int
Select @sumHour = SUM(PlayHours)
From Ratings
Where GamerID = @Gamer
RETURN @sumHour
END
GO

--getAveRate Function
CREATE FUNCTION getAveRate(@Gamer as int)
RETURNS int
AS
BEGIN
Declare @aveRate int
Select @aveRate = AVG(CompletionRate)
From Ratings
Where GamerID = @Gamer
RETURN @aveRate
END
GO

--getTotalFriends Function
CREATE FUNCTION getTotalFriends(@Gamer as int)
RETURNS int
AS
BEGIN
Declare @totalFriends int
Select @totalFriends = COUNT(TimeStamp)
From Friends
Where InviterID = @Gamer
or
InviteeID = @Gamer
RETURN @totalFriends
END
GO

--GamerStats view
CREATE VIEW [GamerStats] AS
SELECT HandlerName as 'Gamer', COALESCE([dbo].[getTotalPlayed](Gamers.GamerID), 0) as 'Games Payed', COALESCE([dbo].[getTotalCompleted](Gamers.GamerID), 0) as 'Games Completed', COALESCE([dbo].[getTotalHours](Gamers.GamerID), 0) as 'Total Hours', COALESCE([dbo].[getAveRate](Gamers.GamerID), 0) as 'Average Completion', COALESCE([dbo].[getTotalFriends](Gamers.GamerID), 0) as 'Friends'
FROM Gamers
Left Join Ratings
on Ratings.GamerID = Gamers.GamerID
Left Join Friends
on Friends.InviterID = Gamers.GamerID
Group by HandlerName, Gamers.GamerID;
GO