/* =========================
   CREATE DATABASE
========================= */

CREATE DATABASE LibraryDB;
GO

USE LibraryDB;
GO


/* =========================
   CREATE TABLES
========================= */

CREATE TABLE LIBRARY_BRANCH (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    Address VARCHAR(200)
);

CREATE TABLE BORROWER (
    CardNo INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(200),
    Phone VARCHAR(20)
);

CREATE TABLE PUBLISHER (
    PublisherName VARCHAR(100) PRIMARY KEY,
    Address VARCHAR(200),
    Phone VARCHAR(20)
);

CREATE TABLE BOOKS (
    BookID INT PRIMARY KEY,
    Title VARCHAR(200),
    PublisherName VARCHAR(100),
    FOREIGN KEY (PublisherName) REFERENCES PUBLISHER(PublisherName)
);

CREATE TABLE BOOK_AUTHORS (
    BookID INT,
    AuthorName VARCHAR(100),
    FOREIGN KEY (BookID) REFERENCES BOOKS(BookID)
);

CREATE TABLE BOOK_COPIES (
    BookID INT,
    BranchID INT,
    Number_Of_Copies INT,
    FOREIGN KEY (BookID) REFERENCES BOOKS(BookID),
    FOREIGN KEY (BranchID) REFERENCES LIBRARY_BRANCH(BranchID)
);

CREATE TABLE BOOK_LOANS (
    BookID INT,
    BranchID INT,
    CardNo INT,
    DateOut DATE,
    DateDue DATE,
    FOREIGN KEY (BookID) REFERENCES BOOKS(BookID),
    FOREIGN KEY (BranchID) REFERENCES LIBRARY_BRANCH(BranchID),
    FOREIGN KEY (CardNo) REFERENCES BORROWER(CardNo)
);


/* =========================
   INSERT DATA
========================= */

-- LIBRARY_BRANCH (6 rows including Sharpstown)

INSERT INTO LIBRARY_BRANCH VALUES
(1, 'Sharpstown', '123 Main St'),
(2, 'Downtown', '45 King St'),
(3, 'Northside', '78 Maple Ave'),
(4, 'West End', '90 Sunset Blvd'),
(5, 'Eastside', '12 Ocean Dr'),
(6, 'Central', '200 Library Rd');


-- BORROWER (8 rows)

INSERT INTO BORROWER VALUES
(101, 'John Smith', '1 Apple St', '111-111-1111'),
(102, 'Mary Johnson', '2 Berry St', '222-222-2222'),
(103, 'David Brown', '3 Cherry St', '333-333-3333'),
(104, 'Sarah Davis', '4 Peach St', '444-444-4444'),
(105, 'Michael Wilson', '5 Plum St', '555-555-5555'),
(106, 'Emily Clark', '6 Pear St', '666-666-6666'),
(107, 'Daniel Hall', '7 Lime St', '777-777-7777'),
(108, 'Olivia Young', '8 Mango St', '888-888-8888');


-- PUBLISHER (10 rows)

INSERT INTO PUBLISHER VALUES
('Penguin Books', 'NY', '111-000-0000'),
('HarperCollins', 'LA', '222-000-0000'),
('Random House', 'Chicago', '333-000-0000'),
('Simon & Schuster', 'Boston', '444-000-0000'),
('Macmillan', 'Seattle', '555-000-0000'),
('Scholastic', 'Houston', '666-000-0000'),
('Oxford Press', 'London', '777-000-0000'),
('Cambridge Press', 'UK', '888-000-0000'),
('Vintage', 'Toronto', '999-000-0000'),
('Orbit', 'Denver', '000-000-0000');


-- BOOKS (20 rows including The Lost Tribe)

INSERT INTO BOOKS VALUES
(1, 'The Lost Tribe', 'Penguin Books'),
(2, 'The Great Adventure', 'HarperCollins'),
(3, 'Mystery of the Night', 'Random House'),
(4, 'Hidden Truths', 'Simon & Schuster'),
(5, 'Journey Beyond', 'Macmillan'),
(6, 'Silent Forest', 'Scholastic'),
(7, 'Dark Waters', 'Oxford Press'),
(8, 'Broken Kingdom', 'Cambridge Press'),
(9, 'Golden Empire', 'Vintage'),
(10, 'Last Horizon', 'Orbit'),
(11, 'Crimson Sky', 'Penguin Books'),
(12, 'Frozen Path', 'HarperCollins'),
(13, 'Shattered Dreams', 'Random House'),
(14, 'Midnight Call', 'Simon & Schuster'),
(15, 'Desert Storm', 'Macmillan'),
(16, 'Ocean Whisper', 'Scholastic'),
(17, 'Ancient Code', 'Oxford Press'),
(18, 'Lost City', 'Cambridge Press'),
(19, 'Hidden Flame', 'Vintage'),
(20, 'Final Stand', 'Orbit');


-- BOOK_AUTHORS (10 rows)

INSERT INTO BOOK_AUTHORS VALUES
(1, 'A. Writer'),
(2, 'B. Author'),
(3, 'C. Novelist'),
(4, 'D. Storyteller'),
(5, 'E. Creator'),
(6, 'F. Thinker'),
(7, 'G. Poet'),
(8, 'H. Historian'),
(9, 'I. Scholar'),
(10, 'J. Legend');


-- BOOK_COPIES (Minimum 2 copies each)

INSERT INTO BOOK_COPIES VALUES
(1, 1, 5),
(1, 2, 3),
(2, 1, 2),
(3, 2, 4),
(4, 3, 2),
(5, 4, 3),
(6, 5, 2),
(7, 6, 4),
(8, 1, 3),
(9, 2, 2);


-- BOOK_LOANS (10 rows)

INSERT INTO BOOK_LOANS VALUES
(1, 1, 101, '2026-02-01', '2026-02-15'),
(2, 1, 102, '2026-02-02', '2026-02-16'),
(3, 2, 103, '2026-02-03', '2026-02-17'),
(4, 3, 104, '2026-02-04', '2026-02-18'),
(5, 4, 105, '2026-02-05', '2026-02-19'),
(6, 5, 106, '2026-02-06', '2026-02-20'),
(7, 6, 107, '2026-02-07', '2026-02-21'),
(8, 1, 108, '2026-02-08', '2026-02-22'),
(9, 2, 101, '2026-02-09', '2026-02-23'),
(10, 3, 102, '2026-02-10', '2026-02-24');


/* =========================
   REQUIRED QUERIES
========================= */

-- FULL OUTER JOIN

SELECT *
FROM BOOK_LOANS
FULL OUTER JOIN BORROWER
    ON BOOK_LOANS.CardNo = BORROWER.CardNo
FULL OUTER JOIN BOOKS
    ON BOOK_LOANS.BookID = BOOKS.BookID;


-- Book Titles and Author Names

SELECT BOOKS.Title, BOOK_AUTHORS.AuthorName
FROM BOOKS
INNER JOIN BOOK_AUTHORS
    ON BOOKS.BookID = BOOK_AUTHORS.BookID;


/* =========================
   STORED PROCEDURES
========================= */

-- 1. Copies of The Lost Tribe at Sharpstown

CREATE PROCEDURE usp_LostTribe_Sharpstown
AS
BEGIN
    SELECT lb.BranchName,
           b.Title,
           bc.Number_Of_Copies
    FROM BOOK_COPIES bc
    INNER JOIN BOOKS b ON bc.BookID = b.BookID
    INNER JOIN LIBRARY_BRANCH lb ON bc.BranchID = lb.BranchID
    WHERE b.Title = 'The Lost Tribe'
      AND lb.BranchName = 'Sharpstown';
END;
GO


-- 2. Copies of The Lost Tribe at each branch

CREATE PROCEDURE usp_LostTribe_AllBranches
AS
BEGIN
    SELECT lb.BranchName,
           b.Title,
           bc.Number_Of_Copies
    FROM BOOK_COPIES bc
    INNER JOIN BOOKS b ON bc.BookID = b.BookID
    INNER JOIN LIBRARY_BRANCH lb ON bc.BranchID = lb.BranchID
    WHERE b.Title = 'The Lost Tribe';
END;
GO


-- 3. Borrowers with no books checked out

CREATE PROCEDURE usp_Borrowers_WithNoBooks
AS
BEGIN
    SELECT br.Name
    FROM BORROWER br
    LEFT JOIN BOOK_LOANS bl
        ON br.CardNo = bl.CardNo
    WHERE bl.CardNo IS NULL;
END;
GO
