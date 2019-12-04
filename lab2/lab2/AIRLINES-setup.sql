drop table AIRLINES, AIRPORTS, FLIGHTS;

CREATE TABLE 3nf_AIRLINES(
    Id INTEGER,
    Airline VARCHAR(100),
    Abbreviation VARCHAR(20),
    Country VARCHAR(20),
    PRIMARY KEY (Id)
);

CREATE 3nf_COUNTRIES(
    Country VARCHAR(50),
    CountryAbbrev VARCHAR(10)
)

CREATE TABLE 3nf_AIRPORTS(
    City VARCHAR(50),
    AirportCode VARCHAR(10),
    AirportName VARCHAR(50),
    PRIMARY KEY (AirportCode)
);

CREATE TABLE 3nf_FLIGHTS(
    Airline INTEGER,
    FlightNo INTEGER,
    SourceAirport VARCHAR(10),
    DestAirport VARCHAR(10),
    PRIMARY KEY (Airline, FlightNo),
    FOREIGN KEY (SourceAirport) REFERENCES AIRPORTS (AirportCode),
    FOREIGN KEY (DestAirport) REFERENCES AIRPORTS (AirportCode),
    FOREIGN KEY (Airline) REFERENCES AIRLINES(Id)
);