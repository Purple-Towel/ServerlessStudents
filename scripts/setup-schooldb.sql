IF DB_ID(N'SchoolDB') IS NULL
BEGIN
    CREATE DATABASE SchoolDB;
END;
GO

USE SchoolDB;
GO

IF OBJECT_ID(N'dbo.Students', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Students
    (
        StudentId int IDENTITY(1,1) NOT NULL
            CONSTRAINT PK_Students PRIMARY KEY,
        FirstName nvarchar(50) NOT NULL,
        LastName nvarchar(50) NOT NULL,
        School nvarchar(100) NOT NULL,
        Gender nvarchar(10) NOT NULL,
        DateOfBirth date NOT NULL
    );
END;
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Students)
BEGIN
    SET IDENTITY_INSERT dbo.Students ON;

    INSERT INTO dbo.Students
        (StudentId, FirstName, LastName, School, Gender, DateOfBirth)
    VALUES
        (101, N'Ada', N'Lovelace', N'Computer Science', N'Female', '1815-12-10'),
        (102, N'Alan', N'Turing', N'Mathematics', N'Male', '1912-06-23'),
        (103, N'Katherine', N'Johnson', N'Mathematics', N'Female', '1918-08-26'),
        (104, N'Grace', N'Hopper', N'Computer Science', N'Female', '1906-12-09'),
        (105, N'James', N'Bond', N'Intelligence', N'Male', '1977-12-05');

    SET IDENTITY_INSERT dbo.Students OFF;
END;
GO

SELECT DB_NAME() AS DatabaseName, COUNT(*) AS StudentCount
FROM dbo.Students;
GO
