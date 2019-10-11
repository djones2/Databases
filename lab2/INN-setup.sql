drop table RESERVATIONS;
drop table ROOMS;

CREATE TABLE ROOMS(
    RoomId VARCHAR(5),
    roomName VARCHAR(100),
    beds INTEGER,
    bedType VARCHAR(20),
    maxOccupancy INTEGER,
    basePrice INTEGER,
    decor VARCHAR(20),
    PRIMARY KEY (RoomId)
);

CREATE TABLE RESERVATIONS(
   Code INTEGER,
   Room VARCHAR (5),
   CheckIn DATE,
   CheckOut DATE,
   Rate FLOAT,
   LastName VARCHAR (50),
   FirstName VARCHAR (50),
   Adults INTEGER,
   Kids INTEGER,
   PRIMARY KEY (Code),
   FOREIGN KEY (Room) REFERENCES ROOMS (RoomId)
);
    
