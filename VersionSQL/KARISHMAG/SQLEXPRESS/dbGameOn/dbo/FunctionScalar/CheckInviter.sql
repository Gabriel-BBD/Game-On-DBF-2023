/****** Object:  Function [dbo].[CheckInviter]    Committed by VersionSQL https://www.versionsql.com ******/

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
