--
-- Plik wygenerowany przez SQLiteStudio v3.3.3 dnia wt. cze 1 09:39:36 2021
--
-- Użyte kodowanie tekstu: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Tabela: Answer
CREATE TABLE Answer (AnswerID INT PRIMARY KEY UNIQUE NOT NULL, QuestionID INT, UserID INT, AnswerDescription STRING (250));

-- Tabela: Dog_Breads
CREATE TABLE Dog_Breads (BreadID INT PRIMARY KEY UNIQUE NOT NULL, DogBread STRING);

-- Tabela: Dog_Trainings_Available
CREATE TABLE Dog_Trainings_Available (TrainingID INT PRIMARY KEY UNIQUE NOT NULL, TrainingName STRING NOT NULL, TrainingDescription STRING NOT NULL, LevelOfAdvancement INT, TrainingURL STRING);

-- Tabela: Personalized_Calendar
CREATE TABLE Personalized_Calendar (UserID INT UNIQUE NOT NULL, EventName STRING (20), Date DATE, Description STRING (30), EventColor STRING, PRIMARY KEY (UserID, EventName));

-- Tabela: Question
CREATE TABLE Question (QuestionID INT UNIQUE NOT NULL, UserID INT NOT NULL, Title NOT NULL, QuestionDescription STRING (140) NOT NULL, QuestionTo INT NOT NULL, Answered BOOLEAN DEFAULT (0), PRIMARY KEY (QuestionID, UserID));

-- Tabela: Trainings_Advancement
CREATE TABLE Trainings_Advancement (LevelID INT PRIMARY KEY NOT NULL UNIQUE, LevelOfAdvancement STRING);

-- Tabela: User
CREATE TABLE User (UserID INT PRIMARY KEY UNIQUE NOT NULL, TypeOfUser INT, Name STRING, Surname STRING, DogName STRING (15), Address1 STRING, Address2 STRING, Login STRING (20), Password STRING (20), Email STRING, DogBreadID INT, Avatar STRING);

-- Tabela: User_Trainings
CREATE TABLE User_Trainings (UserID INT NOT NULL, TrainingID INT NOT NULL, IsFinished BOOLEAN DEFAULT (0), LastDate DATE, PRIMARY KEY (UserID, TrainingID));

-- Tabela: User_Types
CREATE TABLE User_Types (TypeID INT PRIMARY KEY UNIQUE NOT NULL, Type STRING);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
