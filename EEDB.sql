--DATABASE CREATION SECTION
use master
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'EventEaseDB')
DROP DATABASE EventEaseDB
CREATE DATABASE EventEaseDB
USE EventEaseDB

--TABLE CREATION SECTION
CREATE TABLE Venue (
    VenueID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    VenueName VARCHAR(250) NOT NULL,
    VenueLocation VARCHAR(250) NOT NULL, 
    VenueCapacity INT NOT NULL, 
    VenueImage VARCHAR(MAX) NOT NULL
);

CREATE TABLE Event (
    EventID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    EventDate VARCHAR(250) NOT NULL,
    EventDescription VARCHAR(500) NOT NULL, 
);

CREATE TABLE Booking (
    BookingID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    EventID INT NOT NULL,
    VenueID INT NOT NULL,
    BookingDate DATE NOT NULL, 
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)
);

-- Insert data into Venue
INSERT INTO Venue (VenueName, VenueLocation, VenueCapacity, VenueImage) 
VALUES 
('Sonto','Trends Lounge Mbombela', 500, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7yDjVgoTREHYHOxlYeDm5SnZvgG31loWcIg&s'),
('Sonto 2','Industrial Works Centurion', 1000, 'https://static.vecteezy.com/system/resources/thumbnails/014/576/658/small_2x/check-in-location-icon-in-blue-circle-png.png'),
('Sonto 3','The Playground, Braamfontein', 750, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxsFJQG3Gt9OQRiG13s5x9gVq-Ci-ZJMwWmw&s');

-- Insert data into Event
INSERT INTO Event (EventDate, EventDescription) 
VALUES 
('2025-06-12', 'Fashion Show'),
('2025-07-20', 'Outdoor Music Festival'),
('2025-08-25', 'Listening Party');

-- Insert data into Booking
INSERT INTO Booking (EventID, VenueID, BookingDate) 
VALUES 
(1, 1, '2025-05-09'),
(2, 2, '2025-06-18'),
(3, 3, '2025-07-23');

--TABLE MANIPULATION SECTION
SELECT * FROM Venue
SELECT * FROM Event
SELECT * FROM Booking