--
-- Plik wygenerowany przez SQLiteStudio v3.3.3 dnia pon. cze 7 14:53:42 2021
--
-- Użyte kodowanie tekstu: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Tabela: Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer (AnswerID INT PRIMARY KEY UNIQUE NOT NULL, QuestionID INT, UserID INT, AnswerDescription VARCHAR (250));

-- Tabela: Dog_Breads
DROP TABLE IF EXISTS Dog_Breads;
CREATE TABLE Dog_Breads (BreadID INT PRIMARY KEY UNIQUE NOT NULL, DogBread VARCHAR (25));
INSERT INTO Dog_Breads (BreadID, DogBread) VALUES (11, 'Shiba');
INSERT INTO Dog_Breads (BreadID, DogBread) VALUES (10, 'Sznaucer miniaturowy');
INSERT INTO Dog_Breads (BreadID, DogBread) VALUES (9, 'Greyhound');
INSERT INTO Dog_Breads (BreadID, DogBread) VALUES (8, 'Rottweiler');
INSERT INTO Dog_Breads (BreadID, DogBread) VALUES (7, 'Husky syberyjski');
INSERT INTO Dog_Breads (BreadID, DogBread) VALUES (6, 'Chihuahua');
INSERT INTO Dog_Breads (BreadID, DogBread) VALUES (5, 'Golden retriever');
INSERT INTO Dog_Breads (BreadID, DogBread) VALUES (4, 'Jamnik');
INSERT INTO Dog_Breads (BreadID, DogBread) VALUES (3, 'Buldog angielski');
INSERT INTO Dog_Breads (BreadID, DogBread) VALUES (2, 'Pudel duży');
INSERT INTO Dog_Breads (BreadID, DogBread) VALUES (1, 'Owczarek niemiecki');

-- Tabela: Dog_Trainings_Available
DROP TABLE IF EXISTS Dog_Trainings_Available;
CREATE TABLE Dog_Trainings_Available (TrainingID INT PRIMARY KEY UNIQUE NOT NULL, TrainingName VARCHAR (40) NOT NULL, TrainingDescription VARCHAR (250) NOT NULL, LevelOfAdvancement INT, TrainingURL STRING);
INSERT INTO Dog_Trainings_Available (TrainingID, TrainingName, TrainingDescription, LevelOfAdvancement, TrainingURL) VALUES (1, 'Łapka', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vel feugiat libero. Duis bibendum tortor tortor, tempus vulputate arcu volutpat vitae. Phasellus et tristique nibh. Mauris consequat mauris sapien, ac laoreet magna accumsan sed.', 1, 'https://youtu.be/dQw4w9WgXcQ');
INSERT INTO Dog_Trainings_Available (TrainingID, TrainingName, TrainingDescription, LevelOfAdvancement, TrainingURL) VALUES (2, 'Turlanie', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vel feugiat libero. Duis bibendum tortor tortor, tempus vulputate arcu volutpat vitae. Phasellus et tristique nibh. Mauris consequat mauris sapien, ac laoreet magna accumsan sed.', 2, 'https://youtu.be/dQw4w9WgXcQ');

-- Tabela: Personalized_Calendar
DROP TABLE IF EXISTS Personalized_Calendar;
CREATE TABLE Personalized_Calendar (UserID INT UNIQUE NOT NULL, EventName VARCHAR (20), Date DATE, Description VARCHAR (30), EventColor VARCHAR (6), PRIMARY KEY (UserID, EventName));
INSERT INTO Personalized_Calendar (UserID, EventName, Date, Description, EventColor) VALUES (1, 'Weterynarz', '21.06.2020', 'Lorem ipsum dolor sit amet', '99ff99');

-- Tabela: Question
DROP TABLE IF EXISTS Question;
CREATE TABLE Question (QuestionID INT UNIQUE NOT NULL, UserID INT NOT NULL, Title VARCHAR (20) NOT NULL, QuestionDescription VARCHAR (140) NOT NULL, QuestionTo INT NOT NULL, Answered BOOLEAN DEFAULT (0), PRIMARY KEY (QuestionID, UserID));

-- Tabela: Trainings_Advancement
DROP TABLE IF EXISTS Trainings_Advancement;
CREATE TABLE Trainings_Advancement (LevelID INT PRIMARY KEY NOT NULL UNIQUE, LevelOfAdvancement VARCHAR (20));
INSERT INTO Trainings_Advancement (LevelID, LevelOfAdvancement) VALUES (3, 'Zaawansowane');
INSERT INTO Trainings_Advancement (LevelID, LevelOfAdvancement) VALUES (2, 'Średniozaawansowane');
INSERT INTO Trainings_Advancement (LevelID, LevelOfAdvancement) VALUES (1, 'Łatwe');

-- Tabela: User
DROP TABLE IF EXISTS User;
CREATE TABLE User (UserID INT PRIMARY KEY UNIQUE NOT NULL, TypeOfUser INT, Name VARCHAR (15), Surname VARCHAR (15), DogName VARCHAR (15), Login VARCHAR (20), Password VARCHAR (20), Email VARCHAR (20), DogBreadID INT, Avatar STRING, PostalCode VARCHAR (6), City VARCHAR (15), StreetName VARCHAR (20), BuildingNumber VARCHAR (4), ApartmentNumber VARCHAR (5));
INSERT INTO User (UserID, TypeOfUser, Name, Surname, DogName, Login, Password, Email, DogBreadID, Avatar, PostalCode, City, StreetName, BuildingNumber, ApartmentNumber) VALUES (1, 1, 'Kasia', 'Sikora', 'Azor', 'ks1234', 'ksksks', 'ks1234@o2.pl', 3, 'C://piesek.png', '73-110', 'Stargrad', 'Wyszyńskiego', '5', '12');
INSERT INTO User (UserID, TypeOfUser, Name, Surname, DogName, Login, Password, Email, DogBreadID, Avatar, PostalCode, City, StreetName, BuildingNumber, ApartmentNumber) VALUES (2, 2, 'Krzysztof', 'Bzdura', 'Hades', 'krzysiu1', 'kbkbkb', 'kkk1234@gmail.com', 8, 'C://pies.jpg', '73-110', 'Stargard', 'Wojska Polskiego', '56', '8');

-- Tabela: User_Trainings
DROP TABLE IF EXISTS User_Trainings;
CREATE TABLE User_Trainings (UserID INT NOT NULL, TrainingID INT NOT NULL, IsFinished BOOLEAN DEFAULT (0), LastDate DATE, PRIMARY KEY (UserID, TrainingID));
INSERT INTO User_Trainings (UserID, TrainingID, IsFinished, LastDate) VALUES (1, 1, 0, '07.06.2021');
INSERT INTO User_Trainings (UserID, TrainingID, IsFinished, LastDate) VALUES (1, 2, 1, '07.06.2021');

-- Tabela: User_Types
DROP TABLE IF EXISTS User_Types;
CREATE TABLE User_Types (TypeID INT PRIMARY KEY UNIQUE NOT NULL, Type VARCHAR (15));
INSERT INTO User_Types (TypeID, Type) VALUES (5, 'Administrator');
INSERT INTO User_Types (TypeID, Type) VALUES (4, 'Ekspert');
INSERT INTO User_Types (TypeID, Type) VALUES (3, 'Weterynarz');
INSERT INTO User_Types (TypeID, Type) VALUES (2, 'Premium');
INSERT INTO User_Types (TypeID, Type) VALUES (1, 'Standardowy');

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
