CREATE DATABASE [TikTokProject];
GO

USE [TikTokProject];
GO

CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Bio NVARCHAR(255)
);

CREATE TABLE Videos (
    VideoID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(100),
    Description NVARCHAR(255),
    Duration INT,
    CommentCount INT,
    UploadDate DATETIME,
    UserID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Comments (
    CommentID INT IDENTITY(1,1) PRIMARY KEY,
    Text NVARCHAR(255),
    CreatedDate DATETIME,
    IsPinned BIT,
    CommentCount INT,
    UserID INT NOT NULL,
    VideoID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (VideoID) REFERENCES Videos(VideoID)
);

CREATE TABLE Audio (
    AudioID INT IDENTITY(1,1) PRIMARY KEY,
    UploadDate DATETIME,
    Duration INT,
    UsageCount INT,
    Title NVARCHAR(100)
);

CREATE TABLE VideoAudio (
    VideoID INT NOT NULL,
    AudioID INT NOT NULL,
    FOREIGN KEY (VideoID) REFERENCES Videos(VideoID),
    FOREIGN KEY (AudioID) REFERENCES Audio(AudioID),
    PRIMARY KEY (VideoID, AudioID)
);

CREATE TABLE Messages (
    MessageID INT IDENTITY(1,1) PRIMARY KEY,
    Text NVARCHAR(255),
    SentDate DATETIME,
    ReceiverID INT NOT NULL,
    VideoID INT NULL,
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID),
    FOREIGN KEY (VideoID) REFERENCES Videos(VideoID)
);

CREATE TABLE Reports (
    ReportID INT IDENTITY(1,1) PRIMARY KEY,
    CreatedDate DATETIME,
    VideoCount INT,
    LikeCount INT,
    CommentCount INT,
    ViewCount INT,
    UserID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
