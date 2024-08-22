use TechCampCSharp

create table Countries(
	CountryID int Primary Key Identity(100,1),
	CountryName varchar(50) unique not null,
	CountryCode varchar(10) unique not null
)

create table Flags(
	FlagID int Primary Key Identity(100,1),
	Colors varchar(100) not null,
	CountryId int Foreign Key References Countries(CountryID) unique not null
)

insert into Countries(CountryName, CountryCode)
values
('Afghanistan',	'AF'),
('Albania',	'AL'),
('Algeria',	'DZ'),
('American Samoa',	'AS'),
('Andorra',	'AD'),
('Angola',	'AO'),
('Anguilla', 'AI'),
('Antarctica', 'AQ'),
('Antigua', 'AG'),
('Argentina', 'AR'),
('Armenia',	'AM'),
('Aruba', 'AW');


select * from dbo.Countries;


insert into Flags(Colors, CountryId)
values
('Yellow, Red', 104);

('Blue, Yellow, Red', 101),
('Grey, White, Red', 102),
('Blue, Blue, Gray', 105),
('Green, Yellow, Red', 103),
('Pink, Gray, Red', 106),
('Orange, Yellow, Yellow', 107);


select * from Flags
select c.CountryID,FlagID, CountryName,Colors from dbo.Countries as c
left join dbo.Flags as f on c.CountryID = f.CountryId


create table TestCustomers(
	CusID int Primary Key Identity(100,1),
	Name nvarchar(50) not null,
	Number nvarchar(50) not null
);


create table TestOrders(
	OrID int Primary Key Identity(100,1),
	OrderCode nvarchar(50) not null unique,
	ProductName nvarchar(50) not null,
	CustomerId int Foreign Key References TestCustomers(CusID) not null
);

insert into dbo.TestCustomers(Name, Number)

values 
(N'Əli','0555555555'),
(N'Emil','0554444444'),
(N'Xəyal','0553333333'),
(N'Mirzə','0556666666'),
(N'Əmir','0557777777');

select * from dbo.TestCustomers

insert into TestOrders(OrderCode,ProductName,CustomerId)
values
('456ba','T-shirt',100),
('456bb','Boot',100),
('456bc','Notebook',100),
('456bd','T-shirt',101),
('456be','Boot',103),
('456bf','Notebook',103);


select c.CusID,c.Name, OrderCode, ProductName from dbo.TestCustomers as c
left join dbo.TestOrders as f on c.CusID = f.CustomerId

select * from dbo.TestCustomers
select c.CusID,c.Name, OrderCode, ProductName from dbo.TestCustomers as c
left join dbo.TestOrders as f on c.CusID = f.CustomerId

create table Students(
	StudentID int Primary Key Identity(100,1),
	Name nvarchar(50) not null,
	Address nvarchar(70) not null
);


create table Courses(
	CourseID int Primary Key Identity(100,1),
	CourseName nvarchar(50) not null,
	Teacher nvarchar(50) not null
);

CREATE TABLE CourseStudents (
    CourseId INT NOT NULL,
    StudentId INT NOT NULL,
    Price DECIMAL(5, 4) NOT NULL,
    RegistrationDate DATETIME NOT NULL,
    
    PRIMARY KEY (CourseId, StudentId),
    FOREIGN KEY (CourseId) REFERENCES Courses(CourseID),
    FOREIGN KEY (StudentId) REFERENCES Students(StudentID)
);


CREATE TABLE CourseStudents (
    ID INT PRIMARY KEY IDENTITY(100,1),
    CourseId INT NOT NULL,
    StudentId INT NOT NULL,
    Price DECIMAL(5, 4) NOT NULL,
    RegistrationDate DATETIME NOT NULL,
    
    FOREIGN KEY (CourseId) REFERENCES Courses(CourseID),
    FOREIGN KEY (StudentId) REFERENCES Students(StudentID)
);