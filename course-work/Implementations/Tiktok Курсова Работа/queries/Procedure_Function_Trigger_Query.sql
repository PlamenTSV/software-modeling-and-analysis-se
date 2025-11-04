USE [TikTokProject];
GO

-- 1. Get all user videos
CREATE PROCEDURE sp_GetUserVideos
    @UserID INT
AS
BEGIN
    SELECT VideoID, Title, Description, Duration, UploadDate
    FROM Videos
    WHERE UserID = @UserID;
END;
GO

-- 2. Number of comments on a video
CREATE FUNCTION fn_GetCommentCount (@VideoID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;
    SELECT @Count = COUNT(*) FROM Comments WHERE VideoID = @VideoID;
    RETURN @Count;
END;
GO

-- 3. Adding a comment updates the comment count
CREATE TRIGGER trg_UpdateVideoCommentCount
ON Comments
AFTER INSERT
AS
BEGIN
    UPDATE V
    SET V.CommentCount = (
        SELECT COUNT(*) 
        FROM Comments C 
        WHERE C.VideoID = V.VideoID
    )
    FROM Videos V
    JOIN inserted I ON V.VideoID = I.VideoID;
END;
GO
