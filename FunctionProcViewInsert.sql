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
Select @sumComplete = sum(RatingID)
From Ratings
Where GamerID = @Gamer
AND
CompletionRate = 100
Group by GamerID
RETURN @sumComplete
END
GO

--CasualGamers view
CREATE VIEW [GamerStats] AS
SELECT HandlerName as 'Gamer', COUNT(Ratings.RatingID) as 'Games Payed', [dbo].[getTotalCompleted](Gamers.GamerID) as 'Games Completed', SUM(Ratings.PlayHours) as 'Total Hours', AVG(Ratings.CompletionRate) as 'Average Completion', COUNT(Friends.InviteeID) as 'Friends'
FROM Gamers
Left Join Ratings
on Ratings.GamerID = Gamers.GamerID
Left Join Friends
on Friends.InviterID = Gamers.GamerID
Group by HandlerName, Gamers.GamerID;
GO