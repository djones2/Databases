CREATE TABLE Albums(
    AId INTEGER,
    Title VARCHAR(50),
    Year INTEGER,
    Label VARCHAR(50),
    Type VARCHAR(20),
    PRIMARY KEY (AId)
);

CREATE TABLE Band(
    Id INTEGER,
    Firstname VARCHAR(50),
    Lastname VARCHAR(50),
    PRIMARY KEY (Id)
);

CREATE TABLE Songs(
    SongId INTEGER,
    Title VARCHAR(50),
    PRIMARY KEY (SongId)
);

CREATE TABLE Instruments(
    SongId INTEGER,
    BandmateId INTEGER,
    Instrument VARCHAR(50),
    PRIMARY KEY (SongId, BandmateId),
    FOREIGN KEY (SongId) REFERENCES Songs (SongId),
    FOREIGN KEY (BandmateId) REFERENCES Band (Id)
);

CREATE TABLE Performance(
    SongId INTEGER,
    Bandmate INTEGER,
    StagePosition VARCHAR(20),
    PRIMARY KEY (SongId, Bandmate),
    FOREIGN KEY (Bandmate) REFERENCES Band (Id)
);

CREATE TABLE Tracklists(
    AlbumId INTEGER,
    Position INTEGER,
    SongId INTEGER,
    PRIMARY KEY (AlbumId, Position),
    FOREIGN KEY (AlbumId) REFERENCES Albums (AId),
    FOREIGN KEY (SongId) REFERENCES Songs(SongId)
);

CREATE TABLE Vocals(
    SongId INTEGER,
    Bandmate INTEGER,
    `Type` VARCHAR (20),
    PRIMARY KEY (SongId, Bandmate),
    FOREIGN KEY (SongId) REFERENCES Songs (SongId),
    FOREIGN KEY (Bandmate) REFERENCES Band(Id)
);


