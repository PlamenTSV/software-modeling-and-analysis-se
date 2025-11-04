USE TikTokProject;
GO

SELECT VideoID, Title, CommentCount FROM Videos;

INSERT INTO Comments (Text, UserID, VideoID)
VALUES (N'Test Trigger', 1, 1);

SELECT VideoID, Title, CommentCount FROM Videos;




