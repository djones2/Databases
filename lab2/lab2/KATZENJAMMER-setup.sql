drop table ALBUMS, BAND, SONGS, INSTRUMENTS, PERFORMANCE, TRACKLISTS, VOCALS; 

CREATE TABLE ALBUMS(
    AId INTEGER,
    Title VARCHAR(50),
    `Year` INTEGER,
    Label VARCHAR(50),
    `Type` VARCHAR(20),
    PRIMARY KEY (AId)
);

CREATE TABLE BAND(
    Id INTEGER,
    Firstname VARCHAR(50),
    Lastname VARCHAR(50),
    PRIMARY KEY (Id)
);

CREATE TABLE SONGS(
    SongId INTEGER,
    Title VARCHAR(50),
    PRIMARY KEY (SongId)
);

CREATE TABLE INSTRUMENTS(
    SongId INTEGER,
    BandmateId INTEGER,
    Instrument VARCHAR(50),
    PRIMARY KEY (SongId, BandmateId, Instrument),
    FOREIGN KEY (SongId) REFERENCES SONGS (SongId),
    FOREIGN KEY (BandmateId) REFERENCES BAND (Id)
);

CREATE TABLE PERFORMANCE(
    SongId INTEGER,
    Bandmate INTEGER,
    StagePosition VARCHAR(20),
    PRIMARY KEY (SongId, Bandmate),
    FOREIGN KEY (Bandmate) REFERENCES BAND (Id)
);


CREATE TABLE TRACKLISTS(
    AlbumId INTEGER,
    Position INTEGER,
    SongId INTEGER,
    PRIMARY KEY (AlbumId, Position),
    FOREIGN KEY (AlbumId) REFERENCES ALBUMS (AId),
    FOREIGN KEY (SongId) REFERENCES SONGS (SongId)
);

CREATE TABLE VOCALS(
    SongId INTEGER,
    Bandmate INTEGER,
    `Type` VARCHAR (20),
    PRIMARY KEY (SongId, Bandmate, `Type`),
    FOREIGN KEY (SongId) REFERENCES SONGS (SongId),
    FOREIGN KEY (Bandmate) REFERENCES BAND (Id)
);
