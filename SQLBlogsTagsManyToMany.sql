CREATE DATABASE BlogDB;
USE BlogDB;


CREATE TABLE Categories (
    Id INT PRIMARY KEY ,
    Name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Tags (
    Id INT PRIMARY KEY ,
    Name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Users (
    Id INT PRIMARY KEY ,
    UserName VARCHAR(55) NOT NULL UNIQUE,
    FullName VARCHAR(55) NOT NULL,
    Age INT CHECK (Age BETWEEN 0 AND 150)
);

CREATE TABLE Blogs (
    Id INT PRIMARY KEY ,
    Title VARCHAR(50) NOT NULL,
    Description TEXT NOT NULL,
    UserId INT,
    CategoryId INT,
    FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
);

CREATE TABLE Comments (
    Id INT PRIMARY KEY ,
    Content VARCHAR(250) NOT NULL,
    UserId INT,
    BlogId INT,
    FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (BlogId) REFERENCES Blogs(Id)
);

Create TABLE BlogTags (
    BlogId INT,
    TagId INT,
    FOREIGN KEY (BlogId) REFERENCES Blogs(Id),
    FOREIGN KEY (TagId) REFERENCES Tags(Id),
   
);
Drop Table BlogTags

INSERT INTO Categories (Name) VALUES ('Technology');
INSERT INTO Categories (Name) VALUES ('Phone');
INSERT INTO Categories (Name) VALUES ('KuxnaEsyasi');

INSERT INTO Tags (Name) VALUES ('Usb');
INSERT INTO Tags (Name) VALUES ('Yaddas');
INSERT INTO Tags (Name) VALUES ('Ekran');
INSERT INTO Tags (Name) VALUES ('Olcu');

INSERT INTO Users (UserName, FullName, Age) VALUES ('Xan', 'Orxan N', 30);
INSERT INTO Users (UserName, FullName, Age) VALUES ('Mus', 'Musa M', 24);
INSERT INTO Users (UserName, FullName, Age) VALUES ('Yusif', 'Yusif Z', 25);

INSERT INTO Blogs (Title, Description, UserId, CategoryId) VALUES 
('Geleceyin Texnologiyasi', 'Robotlar Dunyani Yixacag', 1, 1),
('Heyat Gozeldi', 'Heyatda cox riske girmiyin ama Risk siz de bir yere cixmag olmur', 2, 2),
('Kuxnada sizin komeycileriniz bizim elemizde', 'Sen Yat masin isdesin Ozude hamisinda Aİ var', 3, 3);

INSERT INTO Comments (Content, UserId, BlogId) VALUES 
('Cox deset geldiz bazara', 2, 1),
('OOOOO neciyedi ', 3, 2),
('Orxan bazari yixacag', 1, 3);

INSERT INTO BlogTags (BlogId, TagId) VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(1, 4), 
(2, 4); 