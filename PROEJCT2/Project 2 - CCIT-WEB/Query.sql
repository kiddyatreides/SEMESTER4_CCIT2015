CREATE DATABASE CCIT_WEB
USE CCIT_WEB
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
-----------------------------------------------	SCHEMA	-------------------------------------------------
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
CREATE SCHEMA Accounts
GO
CREATE SCHEMA Students
GO
CREATE SCHEMA Categories
GO
CREATE SCHEMA Faculties
GO
CREATE SCHEMA Staffs
GO
CREATE SCHEMA Class
GO
CREATE SCHEMA Commentary
GO
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
------------------------------------------------	TABLES	---------------------------------------------
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
CREATE TABLE Students.Student
(
	NIM CHAR(10) PRIMARY KEY NOT NULL,
	Name VARCHAR(30) NOT NULL,
	Phone_Number VARCHAR(12) UNIQUE NOT NULL,
	Semester INT NOT NULL,
	Date_Of_Birth DATE NOT NULL,
	Gender VARCHAR(6) NOT NULL,
	Address VARCHAR(100) NOT NULL,
	Academic_Year INT NOT NULL
)
GO
CREATE TABLE Class.Class
(
	IDClass INT NOT NULL PRIMARY KEY,
	Class VARCHAR(10) NOT NULL
)
GO
CREATE TABLE Students.Class
(
	IDStudentClass INT NOT NULL,
	IDClass INT NOT NULL FOREIGN KEY REFERENCES Class.Class(IDClass),
	NIM CHAR(10) NOT NULL FOREIGN KEY REFERENCES Students.Student(NIM)
)
GO
CREATE TABLE Accounts.Users
(
	UserID INT PRIMARY KEY NOT NULL,
	NIM CHAR(10) FOREIGN KEY REFERENCES Students.Student(NIM) NOT NULL,
	Password VARCHAR(30) NOT NULL,
	Photo VARCHAR(100) NOT NULL
)
GO
CREATE TABLE Staffs.Position
(
	PositionID INT PRIMARY KEY NOT NULL,
	Position VARCHAR(50) NOT NULL
)
GO
CREATE TABLE Staffs.Staff
(
	StaffID CHAR(3) PRIMARY KEY NOT NULL,
	PositionID INT FOREIGN KEY REFERENCES Staffs.Position(PositionID) NOT NULL,
	NIK CHAR(16) UNIQUE NOT NULL,
	Name VARCHAR(30) NOT NULL,
	Address VARCHAR(100) NOT NULL,
	DateA_Of_Birth DATE NOT NULL,
	Phone_Number VARCHAR(12) UNIQUE NOT NULL,
	Gender VARCHAR(6) NOT NULL
)
GO
CREATE TABLE Accounts.Admins
(
	AdminID CHAR(3) PRIMARY KEY NOT NULL,
	StaffID CHAR(3) FOREIGN KEY REFERENCES Staffs.Staff(StaffID) NOT NULL,
	Username VARCHAR(30) NOT NULL,
	Passwords VARCHAR(30) NOT NULL,
	Photo VARCHAR(100) NOT NULL
)
GO
CREATE TABLE Categories.Category
(
	CategoryID CHAR(3) PRIMARY KEY NOT NULL,
	Category VARCHAR(25) NOT NULL,
	Descriptions VARCHAR(100) NOT NULL
)
GO
CREATE TABLE Faculties.Faculty
(
	NIK CHAR(16) UNIQUE NOT NULL,
	FacultyID CHAR(4) PRIMARY KEY NOT NULL,
	Name VARCHAR(30) NOT NULL,
	Gender VARCHAR(6) NOT NULL,
	Address VARCHAR(100) NOT NULL,
	Phone_Number VARCHAR(12) NOT NULL,
	Date_Of_Birth DATE NOT NULL,
	Date_of_IN DATETIME NOT NULL
)
GO
CREATE TABLE Faculties.Class
(
	IDFacultyClass INT NOT NULL PRIMARY KEY,
	IDClass INT NOT NULL FOREIGN KEY REFERENCES Class.Class(IDClass),
	FacultyID CHAR(4) NOT NULL FOREIGN KEY REFERENCES Faculties.Faculty(FacultyID)
)
GO
CREATE TABLE Faculties.Course
(
	IDCourse INT NOT NULL PRIMARY KEY,
	Course VARCHAR(100) NOT NULL UNIQUE
)
GO
CREATE TABLE Faculties.EFALEMA
(
	IDFacultyEFALEMA INT NOT NULL PRIMARY KEY,
	FacultyID CHAR(4) NOT NULL FOREIGN KEY REFERENCES Faculties.Faculty(FacultyID),
	IDClass INT NOT NULL FOREIGN KEY REFERENCES Class.Class(IDClass),
	IDCourse INT NOT NULL FOREIGN KEY REFERENCES Faculties.Course(IDCourse),
	Status VARCHAR(4) NOT NULL,
	NIM CHAR(10) NOT NULL FOREIGN KEY REFERENCES Students.Student(NIM)
)

GO
CREATE TABLE Categories.EFALEMA_Description
(
	DescriptionID CHAR(3) NOT NULL PRIMARY KEY,
	Descriptions TEXT NOT NULL
)

GO
CREATE TABLE Categories.EFALEMA 
(
	EFALEMAID CHAR(3) PRIMARY KEY NOT NULL,
	IDFacultyEFALEMA INT NOT NULL FOREIGN KEY REFERENCES Faculties.EFALEMA(IDFacultyEFALEMA),
	NIM CHAR(10) FOREIGN KEY REFERENCES Students.Student (NIM) NOT NULL,
	Question TEXT NOT NULL,
	Value VARCHAR(10) NOT NULL,
	Criticism TEXT NOT NULL,
	Suggestion TEXT NOT NULL
)
GO
CREATE TABLE Categories.Post
(
	PostID CHAR(6) PRIMARY KEY NOT NULL,
	Dates DATETIME NOT NULL,
	CategoryID CHAR(3) FOREIGN KEY REFERENCES Categories.Category(CategoryID) NOT NULL,
	Texts TEXT NOT NULL,
	Title VARCHAR(100) NOT NULL,
	AdminID CHAR(3) FOREIGN KEY REFERENCES Accounts.Admins (AdminID) NOT NULL,
	Photo VARCHAR(100) NULL
)
GO
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
---------------------------------------------	PROCEDURE	---------------------------------------------
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
CREATE PROCEDURE spInsertClass @Class VARCHAR(10)
AS
BEGIN
	DECLARE @last INT
	DECLARE @nplus INT
	SET @last = (SELECT MAX(IDClass) FROM Class.Class)
	SET @nplus = (@last + 1)
	IF EXISTS(SELECT * FROM Class.Class)
	BEGIN
		INSERT INTO Class.Class VALUES (@nplus, @Class)
	END
	ELSE
	BEGIN
		INSERT INTO Class.Class VALUES (1, @Class)
	END
END
GO
create PROCEDURE spInsertFacultyEFALEMA @FacultyID CHAR(4),	@IDClass INT, @Status int, @IDCourse INT, @NIM CHAR(10)
AS
BEGIN
	DECLARE @nplus INT
	DECLARE @last INT
	SET @last = (SELECT MAX(IDFacultyEFALEMA) FROM Faculties.EFALEMA)
	SET @nplus = (@last + 1)
	IF EXISTS(SELECT * FROM Faculties.EFALEMA)
	BEGIN
		INSERT INTO Faculties.EFALEMA VALUES(@nplus, @FacultyID, @IDClass, @Status,@IDCourse,@NIM)
	END
	ELSE
	BEGIN
		INSERT INTO Faculties.EFALEMA VALUES(1, @FacultyID, @IDClass, @Status,@IDCourse,@NIM)
	END
END

Exec spInsertFacultyEFALEMA 'F001', 1, 2, 1, '1310010001'
select * from Faculties.Course
GO
CREATE PROCEDURE spInsertDescription @Descriptions TEXT
AS
BEGIN
	DECLARE @nplus INT
	DECLARE @last CHAR(2)
	SET @last = (SELECT MAX(RIGHT(DescriptionID,2)) FROM Categories.EFALEMA_Description)
	SET @nplus = (CONVERT(INT, @last)+1)
	IF EXISTS(SELECT * FROM Categories.EFALEMA_Description)
	BEGIN
		IF @nplus < 10
		BEGIN
			INSERT INTO Categories.EFALEMA_Description VALUES('D0'+CONVERT(CHAR(1),@nplus), @Descriptions)
		END
		ELSE IF @nplus < 100
		BEGIN
			INSERT INTO Categories.EFALEMA_Description VALUES('D'+CONVERT(CHAR(2),@nplus), @Descriptions)
		END
	END
	ELSE
	BEGIN
		INSERT INTO Categories.EFALEMA_Description VALUES('D01', @Descriptions)
	END
END
GO
CREATE PROCEDURE spInsertStudents @Name VARCHAR(30), @Phone_Number VARCHAR(12), @Semester INT, @Date_Of_Birth DATE,
@Gender VARCHAR(6), @Address VARCHAR(100), @Academic_Year INT
AS
BEGIN
	DECLARE @LastNIM CHAR(4)
	DECLARE @nplus INT
	SET @LastNIM = (SELECT MAX(RIGHT(NIM,3)) FROM Students.Student)
	SET @nplus = (CONVERT(INT, @LastNIM) + 1)
	IF EXISTS(SELECT NIM FROM Students.Student WHERE Academic_Year = @Academic_Year)
	BEGIN
		IF @nplus < 10
		BEGIN
			INSERT INTO Students.Student
			VALUES(CONVERT(CHAR(2), RIGHT(@Academic_Year,2))+'1001000'+CONVERT(CHAR(1), @nplus), @Name, @Phone_Number, @Semester, @Date_Of_Birth, @Gender, @Address, @Academic_Year)
		END
		ELSE IF @nplus < 100
		BEGIN
			INSERT INTO Students.Student
			VALUES(CONVERT(CHAR(2), RIGHT(@Academic_Year,2))+'100100'+CONVERT(CHAR(2), @nplus), @Name, @Phone_Number, @Semester, @Date_Of_Birth, @Gender, @Address,@Academic_Year)
		END
		ELSE IF @nplus < 1000
		BEGIN
			INSERT INTO Students.Student
			VALUES(CONVERT(CHAR(2), RIGHT(@Academic_Year,2))+'10010'+CONVERT(CHAR(3), @nplus), @Name, @Phone_Number, @Semester, @Date_Of_Birth, @Gender, @Address,@Academic_Year)
		END
	END
	ELSE
	BEGIN
		INSERT INTO Students.Student
		VALUES(CONVERT(CHAR(2), RIGHT(@Academic_Year,2))+'10010001', @Name, @Phone_Number, @Semester, @Date_Of_Birth, @Gender, @Address, @Academic_Year)
	END
END
GO
CREATE PROCEDURE spInsertUsers @NIM CHAR(10), @Passwords VARCHAR(30), @Photo VARCHAR(100)
AS
BEGIN
	DECLARE @Last INT
	DECLARE @nplus INT
	SET @Last = (SELECT MAX(UserID) FROM Accounts.Users)
	SET @nplus = (@Last+1)
	IF EXISTS (SELECT USERID FROM Accounts.Users)
	BEGIN
		INSERT INTO Accounts.Users
		VALUES (@nplus, @NIM, @Passwords, @Photo)
	END
	ELSE
	BEGIN
		INSERT INTO Accounts.Users
		VALUES(1, @NIM, @Passwords, @Photo)
	END
END
GO
CREATE PROCEDURE spInsertAdmin @StaffID CHAR(3), @Username VARCHAR(30), @Passwords VARCHAR(30), @Photo VARCHAR(100)
AS
BEGIN
	DECLARE @Last CHAR(2)
	DECLARE @nplus INT
	SET @Last = (SELECT MAX(RIGHT(AdminID,2)) FROM Accounts.Admins)
	SET @nplus = (CONVERT(INT, @Last) + 1)
	IF EXISTS(SELECT AdminID FROM Accounts.Admins)
	BEGIN
		IF @nplus < 10
		BEGIN
			INSERT INTO Accounts.Admins VALUES('A0'+CONVERT(CHAR(1), @nplus), @StaffID, @Username, @Passwords,@Photo)
		END
		ELSE IF @nplus < 100
		BEGIN
			INSERT INTO Accounts.Admins VALUES('A'+CONVERT(CHAR(2), @nplus), @StaffID, @Username, @Passwords, @Photo)
		END
	END
	ELSE
	BEGIN
		INSERT INTO Accounts.Admins VALUES('A01', @StaffID, @Username, @Passwords, @Photo)
	END
END
GO
CREATE PROCEDURE spInsertCategory @Category VARCHAR(25), @Descriptions VARCHAR(100)
AS
BEGIN
	DECLARE @Last CHAR(2)
	DECLARE @nplus INT
	SET @Last = (SELECT MAX(RIGHT(CategoryID,2)) FROM Categories.Category)
	SET @nplus = (CONVERT(INT, @Last) + 1)
	IF EXISTS(SELECT CategoryID FROM Categories.Category)
	BEGIN
		IF @nplus < 10
		BEGIN
				INSERT INTO Categories.Category VALUES ('C0'+CONVERT(CHAR(1), @nplus), @Category, @Descriptions)
		END
		ELSE IF @nplus < 100
		BEGIN
				INSERT INTO Categories.Category VALUES ('C'+CONVERT(CHAR(2), @nplus), @Category, @Descriptions)
		END
	END
	ELSE
	BEGIN
		INSERT INTO Categories.Category VALUES ('C01', @Category, @Descriptions)
	END
END
GO
CREATE PROCEDURE spInsertFaculty @NIK CHAR(16), @Name VARCHAR(30), @Gender VARCHAR(6), @Address VARCHAR(100),
@Phone_Number VARCHAR(12), @Date_Of_Birth DATE
AS
BEGIN
	DECLARE @Date_Of_IN DATETIME
	DECLARE @nplus INT
	DECLARE @Last CHAR(3)
	SET @Date_Of_IN = (GETDATE())
	SET @Last = (SELECT MAX(RIGHT(FacultyID,3)) FROM Faculties.Faculty)
	SET @nplus = (CONVERT(INT, @Last)+1)
	IF EXISTS(SELECT FacultyID FROM Faculties.Faculty)
	BEGIN
		IF @nplus < 10
		BEGIN
			INSERT INTO Faculties.Faculty
			VALUES(@NIK, 'F00'+CONVERT(CHAR(1), @nplus), @Name, @Gender, @Address, @Phone_Number, @Date_Of_Birth, @Date_Of_IN)
		END
		ELSE IF @nplus < 100
		BEGIN
			INSERT INTO Faculties.Faculty
			VALUES(@NIK, 'F0'+CONVERT(CHAR(2), @nplus), @Name, @Gender, @Address, @Phone_Number, @Date_Of_Birth, @Date_Of_IN)
		END
		ELSE IF @nplus < 1000
		BEGIN
			INSERT INTO Faculties.Faculty
			VALUES(@NIK, 'F'+CONVERT(CHAR(3), @nplus), @Name, @Gender, @Address, @Phone_Number, @Date_Of_Birth, @Date_Of_IN)
		END
	END
	ELSE
	BEGIN
		INSERT INTO Faculties.Faculty
		VALUES(@NIK, 'F001', @Name, @Gender, @Address, @Phone_Number, @Date_Of_Birth, @Date_Of_IN)
	END
END
GO
CREATE PROCEDURE spInsertEFALEMA @NIM CHAR(10), @IDFacultyEFALEMA INT, @Question TEXT, @Value VARCHAR(10),
@Criticism TEXT, @Suggestion TEXT
AS
BEGIN
	DECLARE @Last CHAR(2)
	DECLARE @nplus INT
	SET @Last = (SELECT MAX(RIGHT(EFALEMAID,2)) FROM Categories.EFALEMA)
	SET @nplus = (CONVERT(INT,@Last)+1)
	IF EXISTS(SELECT EFALEMAID FROM Categories.EFALEMA)
	BEGIN
		IF @nplus <10
		BEGIN
			INSERT INTO Categories.EFALEMA
			VALUES('E0'+CONVERT(CHAR(1),@nplus), @NIM, @IDFacultyEFALEMA, @Question, @Value, @Criticism, @Suggestion)
		END
		ELSE IF @nplus < 100
		BEGIN
			INSERT INTO Categories.EFALEMA
			VALUES('E'+CONVERT(CHAR(2),@nplus), @NIM, @IDFacultyEFALEMA, @Question, @Value, @Criticism, @Suggestion)
		END
	END
	ELSE
	BEGIN
		INSERT INTO Categories.EFALEMA
		VALUES('E01', @NIM, @IDFacultyEFALEMA, @Question, @Value, @Criticism, @Suggestion)
	END
END
GO
CREATE PROCEDURE spInsertStaff @PositionID INT,@NIK CHAR(16), @Name VARCHAR(30), @Address VARCHAR(100), @DateA_Of_Birth DATE, @Phone_Number VARCHAR(12),
@Gender VARCHAR(6)
AS
BEGIN
	DECLARE @Last CHAR(2)
	DECLARE @nplus INT
	SET @Last = (SELECT MAX(RIGHT(StaffID,2)) FROM Staffs.Staff)
	SET @nplus = (CONVERT(INT, @Last) + 1)
	IF EXISTS(SELECT StaffID FROM Staffs.Staff)
	BEGIN
		IF @nplus < 10
		BEGIN
			INSERT INTO Staffs.Staff
			VALUES ('S0'+CONVERT(CHAR(1),@nplus), @PositionID, @NIK, @Name, @Address, @DateA_Of_Birth, @Phone_Number, @Gender)
		END
		ELSE IF @nplus < 100
		BEGIN
			INSERT INTO Staffs.Staff
			VALUES ('S'+CONVERT(CHAR(2),@nplus), @PositionID, @NIK, @Name, @Address, @DateA_Of_Birth, @Phone_Number, @Gender)
		END
	END
	ELSE
	BEGIN
		INSERT INTO Staffs.Staff
		VALUES ('S01', @PositionID, @NIK, @Name, @Address, @DateA_Of_Birth, @Phone_Number, @Gender)
	END
END
GO
CREATE PROCEDURE spInsertPost @CategoryID CHAR(3), @Texts TEXT, @Title VARCHAR(100), @AdminID CHAR(3), @Photo VARCHAR(100)
AS
BEGIN
	DECLARE @Date DATETIME
	DECLARE @Last CHAR(5)
	DECLARE @nplus INT
	SET @Date = (GETDATE())
	SET @Last = (SELECT MAX(RIGHT(PostID,5)) FROM Categories.Post)
	SET @nplus = (CONVERT(INT, @Last) + 1)
	IF EXISTS(SELECT PostID FROM Categories.Post)
	BEGIN
		IF @nplus < 10
		BEGIN
			INSERT INTO Categories.Post
			VALUES('P0000'+CONVERT(CHAR(1),@nplus), @Date, @CategoryID, @Texts, @Title, @AdminID, @Photo)
		END
		ELSE IF @nplus < 100
		BEGIN
			INSERT INTO Categories.Post
			VALUES('P000'+CONVERT(CHAR(2),@nplus), @Date, @CategoryID, @Texts, @Title, @AdminID, @Photo)
		END
		ELSE IF @nplus < 1000
		BEGIN
			INSERT INTO Categories.Post
			VALUES('P00'+CONVERT(CHAR(3),@nplus), @Date, @CategoryID, @Texts, @Title, @AdminID, @Photo)
		END
		ELSE IF @nplus < 10000
		BEGIN
			INSERT INTO Categories.Post
			VALUES('P0'+CONVERT(CHAR(4),@nplus), @Date, @CategoryID, @Texts, @Title, @AdminID, @Photo)
		END
		ELSE IF @nplus < 100000
		BEGIN
			INSERT INTO Categories.Post
			VALUES('P'+CONVERT(CHAR(5),@nplus), @Date, @CategoryID, @Texts, @Title, @AdminID, @Photo)
		END
	END
	ELSE
	BEGIN
		INSERT INTO Categories.Post
		VALUES('P00001', @Date, @CategoryID, @Texts, @Title, @AdminID, @Photo)
	END
END
GO
CREATE PROCEDURE spInsertCourse @Course VARCHAR(100)
AS
BEGIN
	DECLARE @last INT
	DECLARE @nplus INT
	SET @last = (SELECT MAX(IDCourse) FROM Faculties.Course)
	set @nplus = (@last + 1)
	IF EXISTS(SELECT * FROM Faculties.Course)
	BEGIN
		INSERT INTO Faculties.Course VALUES(@nplus, @Course)
	END
	ELSE
	BEGIN
		INSERT INTO Faculties.Course VALUES(1, @Course)
	END
END
	
GO
CREATE PROCEDURE spInsertPosition @Position VARCHAR(50)
AS
BEGIN
	DECLARE @nplus INT
	DECLARE @last INT
	SET @last= (SELECT MAX(PositionID) FROM Staffs.Position)
	SET @last = (@last+1)
	IF EXISTS(SELECT PositionID FROM Staffs.Position)
	BEGIN
		INSERT INTO Staffs.Position VALUES(@nplus, @Position)
	END
	ELSE
	BEGIN
		INSERT INTO Staffs.Position VALUES(1, @Position)
	END
END
GO
create TRIGGER Categories.trgEFALEMA
ON Categories.EFALEMA
FOR INSERT
AS
	DECLARE @IDFacultyEFALEMA INT
	DECLARE @Status VARCHAR(4)
	SET @IDFacultyEFALEMA = (SELECT IDFacultyEFALEMA FROM INSERTED)
	SET @Status = ('100%')
	UPDATE Faculties.EFALEMA SET Status = @Status WHERE  IDFacultyEFALEMA = @IDFacultyEFALEMA
RETURN
GO

---Execute Procedure----
EXEC spInsertCategory 'Berita', 'Tentang Berita'
EXEC spInsertCategory 'Event', 'Tentang Event'
EXEC spInsertCategory 'Pengumuman', 'Tentang Pengumuman'
EXEC spInsertPosition 'Akademik'
EXEC spInsertStaff 1,'0000000000000001', 'Fityan Aula', 'Jl. Asem 12', '11/01/1996', '089605258594','Male'
EXEC spInsertAdmin 'S01', 'fityan', 'fityan123','fityan.jpg'
EXEC spInsertPost 'C03', 
'untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 Kel 1-4 dengan pak RMN dan 4-8 di 0CR2 dengan pak Dudi.. untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 Kel 1-4 dengan pak RMN dan 4-8 di 0CR2 dengan pak Dudi.. untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 Kel 1-4 dengan pak RMN dan 4-8 di 0CR2 dengan pak Dudi.. untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 Kel 1-4 dengan pak RMN dan 4-8 di 0CR2 dengan pak Dudi.. untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 Kel 1-4 dengan pak RMN dan 4-8 di 0CR2 dengan pak Dudi.. untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 Kel 1-4 dengan pak RMN dan 4-8 di 0CR2 dengan pak Dudi.. untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 Kel 1-4 dengan pak RMN dan 4-8 di 0CR2 dengan pak Dudi.. untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 Kel 1-4 dengan pak RMN dan 4-8 di 0CR2 dengan pak Dudi.. untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 Kel 1-4 dengan pak RMN dan 4-8 di 0CR2 dengan pak Dudi.. untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 Kel 1-4 dengan pak RMN dan 4-8 di 0CR2 dengan pak Dudi.. untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 Kel 1-4 dengan pak RMN dan 4-8 di 0CR2 dengan pak Dudi.. untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 Kel 1-4 dengan pak RMN dan 4-8 di 0CR2 dengan pak Dudi.. untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 Kel 1-4 dengan pak RMN dan 4-8 di 0CR2 dengan pak Dudi.. untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 Kel 1-4 dengan pak RMN dan 4-8 di 0CR2 dengan pak Dudi.. untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 Kel 1-4 dengan pak RMN dan 4-8 di 0CR2 dengan pak Dudi.. untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 Kel 1-4 dengan pak RMN dan 4-8 di 0CR2 dengan pak Dudi.. untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 Kel 1-4 dengan pak RMN dan 4-8 di 0CR2 dengan pak Dudi.. untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 Kel 1-4 dengan pak RMN dan 4-8 di 0CR2 dengan pak Dudi.. untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 Kel 1-4 dengan pak RMN dan 4-8 di 0CR2 dengan pak Dudi.. '
, 'Cobacoba yuks', 'A01','CBR1000RWB02.jpg'

EXEC spInsertStudents 'Badrus Ridho', '089605258595',3,'08/28/1995','Male','Cakung','2013'
EXEC spInsertStudents 'Affan Nozawa', '089605258596',3,'08/28/1994','Male','Bekasi','2013'
EXEC spInsertUsers '1310010001', 'badrus123', ''

EXEC spInsertCourse 'Computer Network'
EXEC spInsertFaculty '0000000000000001','Fathan Muhda', 'Male', 'Jl. A', '081291119111','12/12/1991'
EXEC spInsertFaculty '0000000000000002','Fadhlah Musiska', 'Female', 'Jl. B', '081291119112','11/12/1991'
EXEC spInsertClass '3TIPS1'
