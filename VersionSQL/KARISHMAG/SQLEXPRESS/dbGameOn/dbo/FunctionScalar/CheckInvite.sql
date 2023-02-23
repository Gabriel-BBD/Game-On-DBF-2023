/****** Object:  Function [dbo].[CheckInvite]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE FUNCTION CheckInvite (
    @inviter INT, @invitee INT
)
RETURNS INTEGER
AS
BEGIN
    IF EXISTS (SELECT * FROM Friends WHERE InviterID = @invitee AND InviteeID = @inviter)
	BEGIN
        return 0
	END
    return 1
END
