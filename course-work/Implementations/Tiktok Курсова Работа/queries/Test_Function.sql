USE [TikTokProject];
GO

SELECT 
    V.VideoID,
    V.Title,
    dbo.fn_GetCommentCount(V.VideoID) AS ActualCommentCount,
    V.CommentCount AS StoredCommentCount
FROM Videos V;