CREATE TABLE Booking
(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    TourId INT NULL,
    Name NVARCHAR(255) NULL,
    Email NVARCHAR(255) NULL,
    Transport INT NULL
);
