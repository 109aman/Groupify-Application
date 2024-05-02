DROP DATABASE IF EXISTS Groupify;
CREATE DATABASE Groupify;
USE Groupify;

CREATE TABLE Projects (
    projectName VARCHAR(30),
    ownerID VARCHAR(30),
    projectDescription varchar(500),
    projectProgress FLOAT(6),
    projectDueDate VARCHAR(30),
    PRIMARY KEY (projectName, ownerID)
);

CREATE TABLE Tasks (
    projectName VARCHAR(30),
    ownerID VARCHAR(30),
    taskName VARCHAR(30),
    taskDescription VARCHAR(500),
    taskProgress FLOAT(6),
    taskDifficulty FLOAT(6),
    taskAssigned VARCHAR(100),
    taskDueDate VARCHAR(30),
    Primary key (projectName, ownerID, taskName),
    FOREIGN KEY (projectName, ownerID) REFERENCES Projects(projectName, ownerID),
    Unique (taskName)
);

CREATE TABLE Subtasks (
    projectName VARCHAR(30),
    ownerID VARCHAR(30),
    taskName VARCHAR(30),
    subTaskName VARCHAR(30),
    subTaskDescription VARCHAR(500),
    subTaskProgress FLOAT(6),
    subTaskDifficulty FLOAT(6),
    subTaskAssigned VARCHAR(100),
    subTaskDueDate VARCHAR(30),
    FOREIGN KEY (projectName, ownerID) REFERENCES Projects(projectName, ownerID),
    FOREIGN KEY (taskName) REFERENCES Tasks(taskName),
    Unique (subTaskName)
);

create table ProjectMembers(
    userID varchar(30),
    projectName VARCHAR(30),
    ownerID VARCHAR(30),
    FOREIGN KEY (projectName, ownerID) REFERENCES Projects(projectName, ownerID)
);

create table Inbox(
    userID varchar(30),
    projectName varchar(30),
    ownerID varchar(30),
    foreign key (projectName, ownerID) references Projects(projectName, ownerID)
);

create table UserRating(
    userID varchar(30),
    rating float(6)
);

create table finalProjectMembers(
    userID varchar(30),
    projectName VARCHAR(30),
    ownerID VARCHAR(30),
    FOREIGN KEY (projectName, ownerID) REFERENCES Projects(projectName, ownerID),
    UNIQUE KEY unique_user_project_owner (userID, projectName, ownerID)
);

CREATE TABLE Courses (
    CourseNumber VARCHAR(30) PRIMARY KEY,
    CourseTitle VARCHAR(255)
);

CREATE TABLE UserClasses (
    UserID VARCHAR(50),
    CourseNumber VARCHAR(30),
    FOREIGN KEY (CourseNumber) REFERENCES Courses(CourseNumber)
); 

INSERT INTO Courses (CourseNumber, CourseTitle) VALUES 
('COSC 1436', 'Programming Fundamentals I'),
('COSC 1437', 'Programming Fundamentals II'),
('COSC 2327', 'Introduction to Computer Networks'),
('COSC 2329', 'Computer Organization & Machine Language'),
('COSC 2340', 'Special Topics in Computer Science'),
('COSC 2347', 'Special Topics/Programming'),
('COSC 3312', 'Numerical Methods'),
('COSC 3318', 'Data Base Management Systems'),
('COSC 3319', 'Data Structures and Algorithms'),
('COSC 3321', 'Digital System Design'),
('COSC 3327', 'Computer Architecture'),
('COSC 3331', 'Human-Computer Interaction'),
('COSC 3332', 'Game Programming and Design'),
('COSC 3337', 'Information Systems Design & Management'),
('COSC 4050', 'Independent Study'),
('COSC 4149', 'Seminar in Computer Science'),
('COSC 4314', 'Data Mining'),
('COSC 4316', 'Compiler Design & Construction'),
('COSC 4318', 'Advanced Language Concepts'),
('COSC 4319', 'Software Engineering'),
('COSC 4320', 'System Modeling and Simulation'),
('COSC 4326', 'Network Theory'),
('COSC 4327', 'Computer Operating Systems'),
('COSC 4332', 'Computer Graphics'),
('COSC 4337', 'Digital Signal Processing'),
('COSC 4340', 'Special Topics in Computer Science'),
('COSC 4349', 'Professionalism and Ethics');

INSERT INTO UserRating (UserID, Rating)
VALUES
  ('RachelMoore', 4.8),
  ('RachelMoore', 4.2),
  ('RachelMoore', 3.9),
  ('RachelMoore', 4.5),
  ('RachelMoore', 4.1),

  ('JohnDoe', 4.3),
  ('JohnDoe', 4.6),
  ('JohnDoe', 4.1),

  ('JaneSmith', 4.0),
  ('JaneSmith', 3.8),
  ('JaneSmith', 1),
  ('JaneSmith', 4.2),

  ('AliceJohnson', 4.7),
  ('AliceJohnson', 4.1),
  ('AliceJohnson', 4.4),

  ('EmilyBrown', 2),
  ('EmilyBrown', 4.1),
  ('EmilyBrown', 4.4),

  ('MichaelClark', 3.9),
  ('MichaelClark', 1),
  ('MichaelClark', 3),

  ('JessicaLee', 4.5),
  ('JessicaLee', 4.3),
  ('JessicaLee', 4.1),

  ('DavidWong', 4.7),
  ('DavidWong', 4.4),
  ('DavidWong', 4.2),

  ('SarahKim', 4.6),
  ('SarahKim', 2),
  ('SarahKim', 2),
  ('SarahKim', 4.4),

  ('NicholasWilson', 2.8),
  ('NicholasWilson', 3.5),
  ('NicholasWilson', 3.9),

  ('AmandaThomas', 4.2),
  ('AmandaThomas', 2),
  ('AmandaThomas', 4.0),

  ('BrandonGarcia', 3.6),
  ('BrandonGarcia', 4.1),
  ('BrandonGarcia', 3.8),
  ('BrandonGarcia', 1),

  ('OliviaMartin', 4.4),
  ('OliviaMartin', 3.9),
  ('OliviaMartin', 4.1),
  ('OliviaMartin', 4.0),

  ('MatthewKim', 4.5),
  ('MatthewKim', 2.3),
  ('MatthewKim', 3.8);
  
INSERT INTO UserClasses (UserID, CourseNumber)
VALUES 
  ('RachelMoore', 'COSC 1436'),
  ('RachelMoore', 'COSC 3319'),
  ('RachelMoore', 'COSC 4319'),
  ('RachelMoore', 'COSC 4314'),
  ('RachelMoore', 'COSC 4327'),

  ('JohnDoe', 'COSC 1437'),
  ('JohnDoe', 'COSC 2329'),
  ('JohnDoe', 'COSC 3321'),
  ('JohnDoe', 'COSC 4319'),

  ('JaneSmith', 'COSC 2327'),
  ('JaneSmith', 'COSC 3332'),
  ('JaneSmith', 'COSC 3337'),
  ('JaneSmith', 'COSC 4149'),

  ('AliceJohnson', 'COSC 2340'),
  ('AliceJohnson', 'COSC 3318'),
  ('AliceJohnson', 'COSC 4320'),
  ('AliceJohnson', 'COSC 4340'),

  ('EmilyBrown', 'COSC 2347'),
  ('EmilyBrown', 'COSC 3319'),
  ('EmilyBrown', 'COSC 4326'),
  ('EmilyBrown', 'COSC 4332'),

  ('MichaelClark', 'COSC 2329'),
  ('MichaelClark', 'COSC 3331'),
  ('MichaelClark', 'COSC 4149'),
  ('MichaelClark', 'COSC 4337'),

  ('JessicaLee', 'COSC 1437'),
  ('JessicaLee', 'COSC 3321'),
  ('JessicaLee', 'COSC 4319'),
  ('JessicaLee', 'COSC 4332'),

  ('DavidWong', 'COSC 2340'),
  ('DavidWong', 'COSC 3318'),
  ('DavidWong', 'COSC 4320'),
  ('DavidWong', 'COSC 4340'),

  ('SarahKim', 'COSC 1436'),
  ('SarahKim', 'COSC 3321'),
  ('SarahKim', 'COSC 3319'),
  ('SarahKim', 'COSC 4327');