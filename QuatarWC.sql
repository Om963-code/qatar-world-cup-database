-- Use the "quatarwc" database
USE quatarwc;

-- Create the Game table
CREATE TABLE Game (
    GameID INT AUTO_INCREMENT PRIMARY KEY,
    GameDate DATE,
    Venue VARCHAR(255),
    Team1 VARCHAR(50),
    Team2 VARCHAR(50),
    Result VARCHAR(50)
);

-- Create the Customer table
CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    RegistrationDate DATE,
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50)
);

-- Create the Transaction table
CREATE TABLE Transaction (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    TransactionDate DATE,
    TotalAmount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    CustomerID INT,
    FanCampID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
    FOREIGN KEY (FanCampID) REFERENCES FanCamp (FanCampID)
);

-- Create the GameTicket table
CREATE TABLE GameTicket (
    TicketID INT AUTO_INCREMENT PRIMARY KEY,
    GameID INT NOT NULL,
    CustomerID INT NOT NULL,
    TicketPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (GameID) REFERENCES Game (GameID),
    FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
);

-- Create the FanCamp table
CREATE TABLE FanCamp (
    FanCampID INT AUTO_INCREMENT PRIMARY KEY,
    Capacity INT,
    AvailableRooms INT
);

-- Create the Room table
CREATE TABLE Room (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    FanCampID INT,
    RoomNumber VARCHAR(20),
    OccupancyStatus VARCHAR(20),
    FOREIGN KEY (FanCampID) REFERENCES FanCamp (FanCampID)
);

-- Create the Train table
CREATE TABLE Train (
    TrainID INT AUTO_INCREMENT PRIMARY KEY,
    DepartureTime TIME,
    ArrivalTime TIME,
    Capacity INT,
    AvailableSeats INT,
    GameID INT,
    FOREIGN KEY (GameID) REFERENCES Game (GameID)
);

-- Create the TransactionGameTicket bridge table
CREATE TABLE TransactionGameTicket (
    TransactionGameTicketID INT AUTO_INCREMENT PRIMARY KEY,
    TransactionID INT,
    TicketID INT,
    FOREIGN KEY (TransactionID) REFERENCES Transaction (TransactionID),
    FOREIGN KEY (TicketID) REFERENCES GameTicket (TicketID)
);

-- Add a Status column to the Transaction table
ALTER TABLE Transaction
ADD Status VARCHAR(20);

-- Insert two game records into the Game table
INSERT INTO Game (GameDate, Venue, Team1, Team2)
VALUES
    ('2023-10-10', 'Stadium 1', 'Team A', 'Team B'),
    ('2023-10-15', 'Stadium 2', 'Team C', 'Team D');

-- Modify the GameTicket table to include a GameID foreign key
ALTER TABLE GameTicket
ADD GameID INT,
ADD CONSTRAINT FK_GameTicket_Game FOREIGN KEY (GameID) REFERENCES Game (GameID);

-- Insert data for 40 customers 
INSERT INTO Customer (FirstName, LastName, Country)
VALUES
    ('John', 'Doe', 'USA'),
    ('Jane', 'Smith', 'USA'),
    ('David', 'Brown', 'USA'),
    ('Alice', 'Johnson', 'USA'),
    ('Michael', 'Lee', 'USA'),
    ('Emily', 'Davis', 'USA'),
    ('William', 'White', 'USA'),
    ('Sarah', 'Wilson', 'Canada'),
    ('James', 'Miller', 'USA'),
    ('Linda', 'Garcia', 'USA'),
    ('Robert', 'Martinez', 'Mexico'),
    ('Karen', 'Anderson', 'USA'),
    ('Richard', 'Harris', 'USA'),
    ('Patricia', 'Thomas', 'Canada'),
    ('Daniel', 'Young', 'USA'),
    ('Susan', 'Walker', 'USA'),
    ('Matthew', 'Hill', 'Mexico'),
    ('Nancy', 'Scott', 'USA'),
    ('Joseph', 'King', 'USA'),
    ('Betty', 'Green', 'USA'),
    ('Charles', 'Baker', 'Canada'),
    ('Dorothy', 'Hernandez', 'USA'),
    ('Christopher', 'Turner', 'USA'),
    ('Donna', 'Wright', 'USA'),
    ('Anthony', 'Gonzalez', 'Mexico'),
    ('Rebecca', 'Evans', 'USA'),
    ('Thomas', 'Russell', 'USA'),
    ('Helen', 'Perez', 'USA'),
    ('Paul', 'Collins', 'Canada'),
    ('Sharon', 'Murphy', 'USA'),
    ('Kenneth', 'Simmons', 'USA'),
    ('Margaret', 'Rivera', 'Mexico'),
    ('Steven', 'Long', 'USA'),
    ('Jessica', 'Gray', 'USA'),
    ('Brian', 'Ward', 'USA'),
    ('Elizabeth', 'Hayes', 'Canada'),
    ('Donald', 'Foster', 'USA'),
    ('Deborah', 'Ward', 'USA');


-- Insert 10 tickets for GameID 1
INSERT INTO GameTicket (GameID, CustomerID, TicketPrice)
VALUES
    (1, 1, 50.00),
    (1, 2, 50.00),
    (1, 3, 50.00),
    (1, 4, 50.00),
    (1, 5, 50.00),
    (1, 6, 50.00),
    (1, 7, 50.00),
    (1, 8, 50.00),
    (1, 9, 50.00),
    (1, 10, 50.00);

-- Insert 10 tickets for GameID 2
INSERT INTO GameTicket (GameID, CustomerID, TicketPrice)
VALUES
    (2, 11, 55.00),
    (2, 12, 55.00),
    (2, 13, 55.00),
    (2, 14, 55.00),
    (2, 15, 55.00),
    (2, 16, 55.00),
    (2, 17, 55.00),
    (2, 18, 55.00),
    (2, 19, 55.00),
    (2, 20, 55.00);


-- Insert data for the FanCamp table (assuming one fan camp for all games)
INSERT INTO FanCamp (Capacity, AvailableRooms)
VALUES
    (30, 20); -- You can adjust the capacity and available rooms as needed
    
-- Insert 40 rows of dummy data into the Transaction table
-- First 20 rows with "successful" status
INSERT INTO Transaction (TransactionID, TransactionDate, CustomerID, FanCampID, Status)
VALUES
    (1, CURRENT_DATE - INTERVAL 5 DAY, 1, 1, 'successful'),
    (2, CURRENT_DATE - INTERVAL 8 DAY, 2, 1, 'successful'),
    (3, CURRENT_DATE - INTERVAL 10 DAY, 3, 1, 'successful'),
    (4, CURRENT_DATE - INTERVAL 12 DAY, 4, 1, 'successful'),
    (5, CURRENT_DATE - INTERVAL 15 DAY, 5, 1, 'successful'),
    (6, CURRENT_DATE - INTERVAL 18 DAY, 6, 1, 'successful'),
    (7, CURRENT_DATE - INTERVAL 20 DAY, 7, 1, 'successful'),
    (8, CURRENT_DATE - INTERVAL 22 DAY, 8, 1, 'successful'),
    (9, CURRENT_DATE - INTERVAL 25 DAY, 9, 1, 'successful'),
    (10, CURRENT_DATE - INTERVAL 28 DAY, 10, 1, 'successful'),
    (11, CURRENT_DATE - INTERVAL 5 DAY, 11, 1, 'successful'),
    (12, CURRENT_DATE - INTERVAL 8 DAY, 12, 1, 'successful'),
    (13, CURRENT_DATE - INTERVAL 10 DAY, 13, 1, 'successful'),
    (14, CURRENT_DATE - INTERVAL 12 DAY, 14, 1, 'successful'),
    (15, CURRENT_DATE - INTERVAL 15 DAY, 15, 1, 'successful'),
    (16, CURRENT_DATE - INTERVAL 18 DAY, 16, 1, 'successful'),
    (17, CURRENT_DATE - INTERVAL 20 DAY, 17, 1, 'successful'),
    (18, CURRENT_DATE - INTERVAL 22 DAY, 18, 1, 'successful'),
    (19, CURRENT_DATE - INTERVAL 25 DAY, 19, 1, 'successful'),
    (20, CURRENT_DATE - INTERVAL 28 DAY, 20, 1, 'successful');

-- Insert 10 rows for occupied rooms
INSERT INTO Room (FanCampID, RoomNumber, OccupancyStatus)
VALUES
    (1, 'R01', 'occupied'),
    (1, 'R02', 'occupied'),
    (1, 'R03', 'occupied'),
    (1, 'R04', 'occupied'),
    (1, 'R05', 'occupied'),
    (1, 'R06', 'occupied'),
    (1, 'R07', 'occupied'),
    (1, 'R08', 'occupied'),
    (1, 'R09', 'occupied'),
    (1, 'R10', 'occupied');

-- Insert 20 rows for available rooms
INSERT INTO Room (FanCampID, RoomNumber, OccupancyStatus)
VALUES
    (1, 'R11', 'available'),
    (1, 'R12', 'available'),
    (1, 'R13', 'available'),
    (1, 'R14', 'available'),
    (1, 'R15', 'available'),
    (1, 'R16', 'available'),
    (1, 'R17', 'available'),
    (1, 'R18', 'available'),
    (1, 'R19', 'available'),
    (1, 'R20', 'available'),
    (1, 'R21', 'available'),
    (1, 'R22', 'available'),
    (1, 'R23', 'available'),
    (1, 'R24', 'available'),
    (1, 'R25', 'available'),
    (1, 'R26', 'available'),
    (1, 'R27', 'available'),
    (1, 'R28', 'available'),
    (1, 'R29', 'available'),
    (1, 'R30', 'available');


-- Insert 20 rows of ticket data into the GameTicket table
INSERT INTO GameTicket (GameID, CustomerID, TicketPrice)
VALUES
    (1, 1, 50.00),
    (1, 2, 50.00),
    (1, 3, 50.00),
    (1, 4, 50.00),
    (1, 5, 50.00),
    (2, 6, 55.00),
    (2, 7, 55.00),
    (2, 8, 55.00),
    (2, 9, 55.00),
    (2, 10, 55.00),
    (3, 11, 60.00),
    (3, 12, 60.00),
    (3, 13, 60.00),
    (3, 14, 60.00),
    (3, 15, 60.00),
    (4, 16, 65.00),
    (4, 17, 65.00),
    (4, 18, 65.00),
    (4, 19, 65.00),
    (4, 20, 65.00);


-- Insert 20 rows of data into the TransactionGameTicket table
-- Replace the placeholders with actual TransactionID and TicketID values
INSERT INTO TransactionGameTicket (TransactionID, TicketID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20);

-- Insert train data for Game 1 (two going to the game and two coming from the game)
INSERT INTO Train (GameID, DepartureTime, ArrivalTime, Capacity, AvailableSeats)
VALUES
    (1, '2023-10-01 10:00:00', '2023-10-01 12:00:00', 5, 5),
    (1, '2023-10-01 14:00:00', '2023-10-01 16:00:00', 5, 5),
    (1, '2023-10-02 10:00:00', '2023-10-02 12:00:00', 5, 5),
    (1, '2023-10-02 14:00:00', '2023-10-02 16:00:00', 5, 5);

-- Insert train data for Game 2 (two going to the game and two coming from the game)
INSERT INTO Train (GameID, DepartureTime, ArrivalTime, Capacity, AvailableSeats)
VALUES
    (2, '2023-10-03 10:00:00', '2023-10-03 12:00:00', 5, 5),
    (2, '2023-10-03 14:00:00', '2023-10-03 16:00:00', 5, 5),
    (2, '2023-10-04 10:00:00', '2023-10-04 12:00:00', 5, 5),
    (2, '2023-10-04 14:00:00', '2023-10-04 16:00:00', 5, 5);
-- Insert train data for Game 3 (two going to the game and two coming from the game)
INSERT INTO Train (GameID, DepartureTime, ArrivalTime, Capacity, AvailableSeats)
VALUES
    (3, '2023-10-05 10:00:00', '2023-10-05 12:00:00', 5, 5),
    (3, '2023-10-05 14:00:00', '2023-10-05 16:00:00', 5, 5),
    (3, '2023-10-06 10:00:00', '2023-10-06 12:00:00', 5, 5),
    (3, '2023-10-06 14:00:00', '2023-10-06 16:00:00', 5, 5);

-- Insert train data for Game 4 (two going to the game and two coming from the game)
INSERT INTO Train (GameID, DepartureTime, ArrivalTime, Capacity, AvailableSeats)
VALUES
    (4, '2023-10-07 10:00:00', '2023-10-07 12:00:00', 5, 5),
    (4, '2023-10-07 14:00:00', '2023-10-07 16:00:00', 5, 5),
    (4, '2023-10-08 10:00:00', '2023-10-08 12:00:00', 5, 5),
    (4, '2023-10-08 14:00:00', '2023-10-08 16:00:00', 5, 5);


ALTER TABLE GameTicket ADD COLUMN ComplimentaryTrainTicket BOOLEAN;
UPDATE GameTicket AS gt
JOIN Transaction AS t ON gt.CustomerID = t.CustomerID
SET gt.ComplimentaryTrainTicket = 1
WHERE t.Status = 'successful';

-- Create the TrainTicketReservation table
CREATE TABLE TrainTicketReservation (
    TrainTicketReservationID INT AUTO_INCREMENT PRIMARY KEY,
    GameTicketID INT,
    SeatNumber VARCHAR(20),
    -- Add other relevant columns for train ticket reservations
    FOREIGN KEY (GameTicketID) REFERENCES GameTicket(TicketID)
);

-- Insert sample data into TrainTicketReservation
INSERT INTO TrainTicketReservation (GameTicketID, SeatNumber)
VALUES
    (1, 'A1'),
    (2, 'B2'),
    (3, 'C3'),
    (4, 'D4'),
    (5, 'E5'),
    (6, 'F6'),
    (7, 'G7'),
    (8, 'H8'),
    (9, 'I9'),
    (10, 'J10');
-- Insert sample data into TrainTicketReservation for Game Tickets 11-20
INSERT INTO TrainTicketReservation (GameTicketID, SeatNumber)
VALUES
    (11, 'K11'),
    (12, 'L12'),
    (13, 'M13'),
    (14, 'N14'),
    (15, 'O15'),
    (16, 'P16'),
    (17, 'Q17'),
    (18, 'R18'),
    (19, 'S19'),
    (20, 'T20');

-- Add a priority column to the Room table
ALTER TABLE Room
ADD COLUMN CustomerPriority INT;

-- Add a priority column to the Customer table
ALTER TABLE Customer
ADD COLUMN CustomerPriority INT;

-- Update the Customer table with customer priorities using a JOIN
SET @priority := 0;
UPDATE Customer AS c
JOIN (
    SELECT CustomerID,
           (@priority := @priority + 1) AS Priority
    FROM Customer
    ORDER BY CustomerID
) AS ranked_customers
ON c.CustomerID = ranked_customers.CustomerID
SET c.CustomerPriority = ranked_customers.Priority;

SELECT
	GameID,
    COUNT(*) AS NumberOfTrains
FROM Train
GROUP BY GameID;

SELECT
    FanCampID,
    COUNT(*) AS NumberOfRooms
FROM Room
GROUP BY FanCampID;

