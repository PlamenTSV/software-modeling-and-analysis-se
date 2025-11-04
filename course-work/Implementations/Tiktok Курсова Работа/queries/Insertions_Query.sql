-- =========================
--  USERS
-- =========================
INSERT INTO Users (Username, Email, Bio)
VALUES 
('plmnt', 'plmnt@example.com', 'Database developer'),
('ivan99', 'ivan99@example.com', 'Music and dance videos'),
('maria_', 'maria@example.com', 'Comedy creator'),
('georgi', 'georgi@example.com', 'Sports edits'),
('niko', 'niko@example.com', 'Just for fun');

-- =========================
--  VIDEOS
-- =========================
INSERT INTO Videos (Title, Description, Duration, CommentCount, UploadDate, UserID)
VALUES
('Morning Coffee', 'A cozy morning vlog', 120, 2, GETDATE(), 1),
('Dance Challenge', 'New viral dance!', 45, 1, GETDATE(), 2),
('Funny Cat', 'Compilation of funny cat clips', 90, 1, GETDATE(), 3),
('Workout Routine', 'Home exercises for beginners', 300, 1, GETDATE(), 4),
('Vacation Vlog', 'Trip to the mountains', 180, 1, GETDATE(), 5);

-- =========================
--  AUDIO
-- =========================
INSERT INTO Audio (UploadDate, Duration, UsageCount, Title)
VALUES
(GETDATE(), 60, 5, 'Chill Beat'),
(GETDATE(), 120, 3, 'Summer Vibes'),
(GETDATE(), 45, 7, 'Funny Sound Effect');

-- =========================
--  VIDEO-AUDIO (N:M)
-- =========================
INSERT INTO VideoAudio (VideoID, AudioID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 2);

-- =========================
--  COMMENTS
-- =========================
INSERT INTO Comments (Text, CreatedDate, IsPinned, CommentCount, UserID, VideoID)
VALUES
('Awesome video!', GETDATE(), 0, 10, 2, 1),
('Hahaha so funny!', GETDATE(), 0, 4, 3, 3),
('Nice editing!', GETDATE(), 0, 2, 4, 5),
('Love this!', GETDATE(), 1, 6, 5, 2),
('Very helpful, thanks!', GETDATE(), 0, 1, 1, 4);

-- =========================
--  MESSAGES
-- =========================
INSERT INTO Messages (Text, SentDate, ReceiverID, VideoID)
VALUES
('Hey, check out my new video!', GETDATE(), 2, 1),
('This audio is fire!', GETDATE(), 3, 2),
('Can we collab?', GETDATE(), 4, 5);

-- =========================
--  REPORTS
-- =========================
INSERT INTO Reports (CreatedDate, VideoCount, LikeCount, CommentCount, ViewCount, UserID)
VALUES
(GETDATE(), 5, 120, 25, 1500, 1),
(GETDATE(), 3, 80, 14, 1000, 2),
(GETDATE(), 4, 90, 18, 2000, 3);
