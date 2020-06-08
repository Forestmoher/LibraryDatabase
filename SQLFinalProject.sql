USE db_library

CREATE TABLE library_branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(30) NOT NULL,
	Address VARCHAR(50) NOT NULL);

INSERT INTO library_branch 
	(BranchName, Address)
	VALUES
	('Sharpstown', '233 N Temple Rd'),
	('Central', '6789 NE Marble Lane'),
	('Southville', '127 SW 34th Ave'),
	('Lakeland', '1011 Main St');

CREATE TABLE publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL,
	);

INSERT INTO publisher
	(PublisherName, Address, Phone)
	VALUES
	('Red Door Publishing','45 N Native Rd','467-789-3546'),
	('Ink Time Publishing','7895 SW Second Ave','309-321-7777'),
	('StarDust Publishers','5467 NE Shore Ln','941-383-3345');

CREATE TABLE books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName 
	FOREIGN KEY REFERENCES publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
	);

INSERT INTO books 
	(Title, PublisherName)
	VALUES
	('The Lost Tribe','Red Door Publishing'),
	('Seasons','Red Door Publishing'),
	('Fight The Army','StarDust Publishers'),
	('Songs About Love','Red Door Publishing'),
	('Changing Perceptions','StarDust Publishers'),
	('The End','Ink Time Publishing'),
	('Teddy Bear Adventures','Ink Time Publishing'),
	('Princess Party','StarDust Publishers'),
	('The Hot Sauce','Ink Time Publishing'),
	('Lights On','StarDust Publishers'),
	('Train','Red Door Publishing'),
	('The Yellow Mockingbird','Red Door Publishing'),
	('Ring It Up','Red Door Publishing'),
	('The Newspaper','Ink Time Publishing'),
	('Spring Turns to Summer','StarDust Publishers'),
	('It All Began...','StarDust Publishers'),
	('Sleepyhead','Red Door Publishing'),
	('Sheeps Follow','StarDust Publishers'),
	('A Win For Us All','Red Door Publishing'),
	('Smooth','StarDust Publishers'),
	('Eat It','Red Door Publishing'),
	('Simple Times','Ink Time Publishing');

CREATE TABLE book_authors (
	BookID INT PRIMARY KEY NOT NULL CONSTRAINT fk_BookID 
	FOREIGN KEY REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
	);

INSERT INTO book_authors
	(BookID, AuthorName)
	VALUES
	(100, 'Stephen King'),
	(101, 'Nora Elmore'),
	(102, 'JT Kings'),
	(103, 'Lori Noles'),
	(104, 'Stephen King'),
	(105, 'Ben Workman'),
	(106, 'Nora Elmore'),
	(107, 'Ben Workman'),
	(108, 'Stephen King'),
	(109, 'Nora Elmore'),
	(110, 'AJ Cooper'),
	(111, 'Sheldon Bogg'),
	(112, 'AJ Cooper'),
	(113, 'JT Kings'),
	(114, 'Sean Plakowitz'),
	(115, 'AJ Cooper'),
	(116, 'Stephen King'),
	(117, 'Peter Storm'),
	(118, 'Ben Workman'),
	(119, 'Elsie Kibble'),
	(120, 'Jonathon Julls'),
	(121, 'Simon Smith');

CREATE TABLE book_copies (
	BookID INT NOT NULL CONSTRAINT fk_BookID_ 
	FOREIGN KEY REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONsTRAINT fk_branch_id
	FOREIGN KEY REFERENCES library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_of_Copies INT NOT NULL
	);

INSERT INTO book_copies 
	(BookID, BranchID, Number_of_Copies)
	VALUES
	(100, 1, 3),
	(100, 2, 3),
	(101, 2, 2),
	(101, 3, 5),
	(102, 1, 4),
	(103, 1, 4),
	(103, 2, 6),
	(103, 3, 2),
	(104, 1, 2),
	(104, 2, 5),
	(104, 3, 3),
	(104, 4, 2),
	(105, 4, 5),
	(106, 3, 6),
	(106, 4, 4),
	(107, 1, 2),
	(107, 4, 5),
	(108, 2, 5),
	(108, 3, 3),
	(109, 2, 4),
	(109, 4, 3),
	(110, 1, 3),
	(111, 1, 3),
	(112, 4, 4),
	(113, 2, 3),
	(113, 3, 2),
	(113, 4, 2),
	(114, 1, 2),
	(115, 1, 4),
	(115, 3, 3),
	(116, 2, 3),
	(116, 4, 5),
	(117, 2, 3),
	(117, 3, 7),
	(117, 4, 4),
	(118, 1, 2),
	(118, 3, 2),
	(119, 2, 4),
	(119, 3, 5),
	(120, 1, 3),
	(120, 4, 2),
	(121, 3, 2),
	(121, 4, 2)
	;

CREATE TABLE borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(1000000,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

INSERT INTO borrower
	(Name, Address, Phone)
	VALUES
	('Tony Bigg','235 N Town St','754-445-3465'),
	('Sam Melter','955 SE Market St','555-444-3333'),
	('Alysa Falk','235 N Town St','346-754-7777'),
	('Calla Brewster','1021 W October Ln','445-567-8354'),
	('Cody Cole','1212 N Wish St','683-954-4854'),
	('Lucas Wilson','2015 SW Salmon St','575-575-5757'),
	('Tina Brannon','1212 N Wish St','245-495-0284'),
	('Cori Nolan','445 Pensacola Ln','893-789-9089'),
	('Kelly Dodson','9099 SW Skiller Ave','730-284-2843');
	('Arturo Peralta', '667 S Cental St', '805-737-5995');	

CREATE TABLE book_loans (
	BookID INT NOT NULL CONSTRAINT fk_BookID_2 
	FOREIGN KEY REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONsTRAINT fk_branch_id2
	FOREIGN KEY REFERENCES library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONsTRAINT fk_cardno
	FOREIGN KEY REFERENCES borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
	);

INSERT INTO book_loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(100, 1, 1000000, '2019-12-12', '2019-12-22'),
	(100, 1, 1000001, '2019-12-13', '2019-12-23'),
	(100, 2, 1000002, '2019-12-10', '2019-12-20'),
	(100, 2, 1000007, '2019-12-17', '2019-12-27'),
	(101, 2, 1000001, '2019-12-13', '2019-12-23'),
	(101, 3, 1000003, '2019-12-18', '2019-12-28'),
	(101, 3, 1000008, '2019-12-17', '2019-12-27'),
	(102, 2, 1000002, '2019-12-10', '2019-12-20'),
	(102, 1, 1000006, '2019-12-11', '2019-12-21'),
	(102, 1, 1000000, '2019-12-12', '2019-12-22'),
	(102, 1, 1000005, '2019-12-15', '2019-12-25'),
	(103, 3, 1000003, '2019-12-18', '2019-12-28'),
	(103, 1, 1000005, '2019-12-15', '2019-12-25'),
	(103, 1, 1000006, '2019-12-11', '2019-12-21'),
	(103, 2, 1000007, '2019-12-17', '2019-12-27'),
	(104, 1, 1000000, '2019-12-12', '2019-12-22'),
	(104, 4, 1000004, '2019-12-10', '2019-12-20'),
	(104, 1, 1000005, '2019-12-15', '2019-12-25'),
	(104, 2, 1000007, '2019-12-17', '2019-12-27'),
	(104, 3, 1000008, '2019-12-17', '2019-12-27'),
	(105, 4, 1000004, '2019-12-10', '2019-12-20'),
	(106, 3, 1000008, '2019-12-17', '2019-12-27'),
	(107, 1, 1000000, '2019-12-12', '2019-12-22'),
	(107, 4, 1000004, '2019-12-10', '2019-12-20'),
	(107, 1, 1000006, '2019-12-11', '2019-12-21'),
	(108, 2, 1000002, '2019-12-10', '2019-12-20'),
	(108, 3, 1000003, '2019-12-18', '2019-12-28'),
	(108, 3, 1000008, '2019-12-17', '2019-12-27'),
	(109, 4, 1000009, '2019-12-18', '2019-12-28'),
	(110, 1, 1000000, '2019-12-12', '2019-12-22'),
	(111, 1, 1000005, '2019-12-15', '2019-12-25'),
	(111, 1, 1000006, '2019-12-11', '2019-12-21'),
	(113, 2, 1000002, '2019-12-10', '2019-12-20'),
	(113, 2, 1000007, '2019-12-17', '2019-12-27'),
	(114, 1, 1000006, '2019-12-11', '2019-12-21'),
	(115, 3, 1000003, '2019-12-18', '2019-12-28'),
	(115, 1, 1000005, '2019-12-15', '2019-12-25'),
	(115, 1, 1000006, '2019-12-11', '2019-12-21'),
	(116, 2, 1000002, '2019-12-10', '2019-12-20'),
	(116, 4, 1000004, '2019-12-10', '2019-12-20'),
	(116, 2, 1000007, '2019-12-17', '2019-12-27'),
	(117, 2, 1000002, '2019-12-10', '2019-12-20'),
	(117, 4, 1000004, '2019-12-10', '2019-12-20'),
	(117, 3, 1000008, '2019-12-17', '2019-12-27'),
	(118, 1, 1000005, '2019-12-15', '2019-12-25'),
	(118, 1, 1000006, '2019-12-11', '2019-12-21'),
	(118, 3, 1000008, '2019-12-17', '2019-12-27'),
	(119, 2, 1000007, '2019-12-17', '2019-12-27'),
	(119, 3, 1000008, '2019-12-17', '2019-12-27'),
	(120, 1, 1000000, '2019-12-12', '2019-12-22'),
	(121, 3, 1000003, '2019-12-18', '2019-12-28'),
	(121, 4, 1000004, '2019-12-10', '2019-12-20'),
	(121, 3, 1000008, '2019-12-17', '2019-12-27');

CREATE SCHEMA [LIB] AUTHORIZATION [DBO]



/*1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?*/

CREATE PROCEDURE dbo.uspGetNoCopies @Title VARCHAR(50), @BranchName VARCHAR(50)
AS
SELECT Number_of_Copies FROM book_copies
	INNER JOIN books ON books.BookID = book_copies.bookID
	INNER JOIN library_branch ON library_branch.branch_id = book_copies.BranchID
WHERE Title = @Title AND BranchName = @BranchName

EXEC dbo.uspGetNoCopies @Title = 'The Lost Tribe', @BranchName = 'Sharpstown'




/*2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?*/

CREATE PROCEDURE dbo.uspGetCopies @Title VARCHAR(50)
AS
SELECT BranchName, Number_of_Copies FROM book_copies
	INNER JOIN books ON books.BookID = book_copies.BookID
	INNER JOIN library_branch ON library_branch.branch_id = book_copies.BranchID
WHERE Title = @Title

EXEC dbo.uspGetCopies @Title = 'The Lost Tribe'



/*3.) Retrieve the names of all borrowers who do not have any books checked out.*/

CREATE PROCEDURE dbo.uspBookChecked @DateOut DATE
AS
SELECT * FROM book_loans 
	FULL OUTER JOIN borrower ON book_loans.CardNo = borrower.CardNo
WHERE DateOut = @DateOut

EXEC dbo.uspBookChecked @DateOut = NULL




/*4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, 
retrieve the book title, the borrower's name, and the borrower's address.*/

CREATE PROCEDURE dbo.uspGetDueBook @BranchName VARCHAR(50), @DateDue DATE
AS
SELECT Title, Name, borrower.Address FROM book_loans
	INNER JOIN borrower ON borrower.CardNo = book_loans.CardNo
	INNER JOIN books ON books.BookID = book_loans.BookID
	INNER JOIN library_branch ON library_branch.branch_id = book_loans.BranchID
WHERE BranchName = @BranchName AND DateDue = @DateDue

EXEC dbo.uspGetDueBook @BranchName = 'Sharpstown', @DateDue = '2019-12-18'





/*5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.*/

CREATE PROCEDURE dbo.uspTotalBooksLoaned @BranchName VARCHAR(50)
AS
SELECT BranchName, COUNT(*) AS "Total number of books loaned" FROM book_loans
	FULL OUTER JOIN library_branch ON book_loans.BranchId = library_branch.branch_id
WHERE BranchName = @BranchName
GROUP BY BranchName

EXEC dbo.uspTotalBooksLoaned @BranchName = 'Sharpstown'


/*6.) Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.*/

CREATE PROCEDURE dbo.uspGetBorrowers 
AS
SELECT Name, Address, COUNT(book_loans.CardNo) AS 'Checked out books' FROM borrower
	FULL OUTER JOIN book_loans ON borrower.CardNo = book_loans.CardNo
GROUP BY Name, Address
HAVING COUNT (book_loans.CardNo) > 5

EXEC dbo.uspGetBorrowers




/*7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".*/

CREATE PROCEDURE dbo.uspGetAuthorBranch @BranchName VARCHAR(50), @AuthorName VARCHAR(50)
AS
SELECT Title, Number_of_Copies, BranchName FROM books 
	FULL OUTER JOIN book_copies ON books.BookID = book_copies.BookID
	FULL OUTER JOIN library_branch ON book_copies.BranchId = library_branch.branch_id
	FULL OUTER JOIN book_authors ON books.BookID = book_authors.BookId
WHERE BranchName = @BranchName AND AuthorName = @AuthorName

EXEC dbo.uspGetAuthorBranch @BranchName = 'Central', @AuthorName = 'Stephen King'