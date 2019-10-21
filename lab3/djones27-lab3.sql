-- AIRLINES-1
delete from FLIGHTS 
    where SourceAirport!='AKI' and DestAirport!='AKI';
-- AIRLINES-2
UPDATE FLIGHTS 
    SET FlightNo = FlightNo + 2000 
    WHERE Airline!=7 and Airline!=10 and Airline!=12;
-- AIRLINES-3
drop table 3nf_AIRLINES, 3nf_COUNTRIES, 3nf_AIRPORTS, 3nf_FLIGHTS;
CREATE TABLE 3nf_AIRLINES(
    Id INTEGER,
    Airline VARCHAR(100),
    Abbreviation VARCHAR(20),
    Country VARCHAR(20),
    PRIMARY KEY (Id)
);

CREATE TABLE 3nf_COUNTRIES(
    Country VARCHAR(50),
    CountryAbbrev VARCHAR(10)
);

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
    FOREIGN KEY (SourceAirport) REFERENCES 3nf_AIRPORTS (AirportCode),
    FOREIGN KEY (DestAirport) REFERENCES 3nf_AIRPORTS (AirportCode),
    FOREIGN KEY (Airline) REFERENCES 3nf_AIRLINES(Id)
);

INSERT INTO 3nf_AIRLINES (Id,  Airline,  Abbreviation,  Country) 
    VALUES (1, 'United Airlines', 'UAL', 'USA');
INSERT INTO 3nf_AIRLINES (Id,  Airline,  Abbreviation,  Country) 
    VALUES (2, 'US Airways', 'USAir', 'USA');
INSERT INTO 3nf_AIRLINES (Id,  Airline,  Abbreviation,  Country) 
    VALUES (3, 'Delta Airlines', 'Delta', 'USA');
INSERT INTO 3nf_AIRLINES (Id,  Airline,  Abbreviation,  Country) 
    VALUES (4, 'Southwest Airlines', 'Southwest', 'USA');
INSERT INTO 3nf_AIRLINES (Id,  Airline,  Abbreviation,  Country) 
    VALUES (5, 'American Airlines', 'American', 'USA');
INSERT INTO 3nf_AIRLINES (Id,  Airline,  Abbreviation,  Country) 
    VALUES (6, 'Northwest Airlines', 'Northwest', 'USA');
INSERT INTO 3nf_AIRLINES (Id,  Airline,  Abbreviation,  Country) 
    VALUES (7, 'Continental Airlines', 'Continental', 'USA');
INSERT INTO 3nf_AIRLINES (Id,  Airline,  Abbreviation,  Country) 
    VALUES (8, 'JetBlue Airways', 'JetBlue', 'USA');
INSERT INTO 3nf_AIRLINES (Id,  Airline,  Abbreviation,  Country) 
    VALUES (9, 'Frontier Airlines', 'Frontier', 'USA');
INSERT INTO 3nf_AIRLINES (Id,  Airline,  Abbreviation,  Country) 
    VALUES (10, 'AirTran Airways', 'AirTran', 'USA');
INSERT INTO 3nf_AIRLINES (Id,  Airline,  Abbreviation,  Country) 
    VALUES (11, 'Allegiant Air', 'Allegiant', 'USA');
INSERT INTO 3nf_AIRLINES (Id,  Airline,  Abbreviation,  Country) 
    VALUES (12, 'Virgin America', 'Virgin', 'USA');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_COUNTRIES (Country  ,  CountryAbbrev  ) 
    VALUES ('United States ', 'US ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Aberdeen ', 'APG', 'Phillips AAF ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Aberdeen ', 'ABR', 'Municipal ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Abilene ', 'DYS', 'Dyess AFB ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Abilene ', 'ABI', 'Municipal ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Abingdon ', 'VJI', 'Virginia Highlands ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Ada ', 'ADT', 'Ada ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Adak Island ', 'ADK', 'Adak Island Ns ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Adrian ', 'ADG', 'Lenawee County ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Afton ', 'AFO', 'Municipal ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Aiken ', 'AIK', 'Municipal ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Ainsworth ', 'ANW', 'Ainsworth ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Akhiok ', 'AKK', 'Akhiok SPB ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Akiachak ', 'KKI', 'Spb ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Akiak ', 'AKI', 'Akiak ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Akron CO ' , 'AKO', 'Colorado Plains Regional Airport ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Akron/Canton OH ' , 'CAK', 'Akron/canton Regional ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Akron/Canton ', 'AKC', 'Fulton International ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Akutan ', 'KQA', 'Akutan ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Alakanuk ', 'AUK', 'Alakanuk ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Alameda ', 'NGZ', 'NAS ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Alamogordo ', 'HMN', 'Holloman AFB ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Alamogordo ', 'ALM', 'Municipal ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Alamosa ', 'ALS', 'Municipal ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Albany ', 'NAB', 'Albany NAS ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Albany ', 'ABY', 'Dougherty County ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Albany ', 'ALB', 'Albany International ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Albany ', 'CVO', 'Albany ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Albert Lea ', 'AEL', 'Albert Lea ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Albuquerque ', 'ABQ', 'Albuquerque International ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Aleknagik ', 'WKK', 'Aleknagik ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Aleneva ', 'AED', 'Aleneva ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ( 'Alexander City AL ' , 'ALX', 'Thomas C Russell Fld ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ( 'Alexandria LA ' , 'AEX', 'Alexandria International ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Alexandria ', 'ESF', 'Esler Field ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Alexandria ', 'AXN', 'Alexandria ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Alexandria Bay ', 'AXB', 'Alexandria Bay ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Algona ', 'AXG', 'Algona ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Alice ', 'ALI', 'International ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ( 'Aliceville AL ' , 'AIV', 'George Downer ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Alitak ', 'ALZ', 'Alitak SPB ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Allakaket ', 'AET', 'Allakaket ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Alliance ', 'AIA', 'Alliance ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Alma ', 'AMN', 'Gratiot Community ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Alpena ', 'APN', 'Alpena County Regional ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Alpine ', 'ALE', 'Alpine ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Alton ', 'ALN', 'Alton ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Altus ', 'LTS', 'Altus AFB ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Altus ', 'AXS', 'Municipal ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Alyeska ', 'AQY', 'Alyeska ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ( 'Amarillo  ' , 'AMA', 'Rick Husband Amarillo International ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Amarillo ', 'TDW', 'Tradewind ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Ambler ', 'ABL', 'Ambler ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Amchitka ', 'AHT', 'Amchitka ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Amery ', 'AHH', 'Municipal ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Ames ', 'AMW', 'Ames ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Amityville ', 'AYZ', 'Zahns ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Amook ', 'AOS', 'Amook ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Anacortes ', 'OTS', 'Anacortes ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Anacostia ', 'NDV', 'USN Heliport ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Anaheim ', 'ANA', 'Orange County Steel Salvage Heliport ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Anaktuvuk ', 'AKP', 'Anaktuvuk ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Anchorage ', 'EDF', 'Elmendorf Afb ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Anchorage ', 'ANC', 'Ted Stevens Anchorage International Airport ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Anchorage ', 'MRI', 'Merrill Field ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Anderson ', 'AID', 'Municipal ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Anderson ', 'AND', 'Anderson ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Andrews ', 'ADR', 'Andrews ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Angel Fire ', 'AXX', 'Angel Fire ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Angola ', 'ANQ', 'Tri-State Steuben Cty ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Angoon ', 'AGN', 'Angoon ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Anguilla ', 'RFK', 'Rollang Field ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Aniak ', 'ANI', 'Aniak ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Anita Bay ', 'AIB', 'Anita Bay ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ( 'Ann Arbor MI ' , 'ARB', 'Municipal ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Annapolis ', 'ANP', 'Lee ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Annette Island ', 'ANN', 'Annette Island ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ( 'Anniston AL ' , 'ANB', 'Anniston Metropolitan ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Anniston ', 'QAW', 'Ft Mcclellan Bus Trml ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Anniston ', 'RLI', 'Reilly AHP ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Anthony ', 'ANY', 'Anthony ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Antlers ', 'ATE', 'Antlers ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Anvik ', 'ANV', 'Anvik ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Apalachicola ', 'AAF', 'Municipal ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Apple Valley ', 'APV', 'Apple Valley ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Appleton ', 'ATW', 'Outagamie County ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Arapahoe ', 'AHF', 'Municipal ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Arcata ', 'ACV', 'Arcata ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Arctic Village ', 'ARC', 'Arctic Village ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Ardmore ', 'AHD', 'Downtown ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Ardmore ', 'ADM', 'Ardmore Municipal Arpt ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Arlington Heights ', 'JLH', 'US Army Heliport ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Artesia ', 'ATS', 'Artesia ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ( 'Neptune ' , 'ARX', 'Asbury Park ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Ashland ', 'ASX', 'Ashland ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Ashley ', 'ASY', 'Ashley ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Aspen ', 'ASE', 'Aspen ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Astoria ', 'AST', 'Astoria ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Athens ', 'AHN', 'Athens ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Athens ', 'ATO', 'Ohio University ');
INSERT INTO 3nf_AIRPORTS (City  , AirportCode  ,  AirportName  ) 
    VALUES ('Athens ', 'MMI', 'McMinn County ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  28,  'APG',  'ASY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  29,  'ASY',  'APG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  44,  'CVO',  'ACV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  45,  'ACV',  'CVO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  54,  'AHD',  'AHT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  55,  'AHT',  'AHD');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  90,  'ATO',  'ABR');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  91,  'ABR',  'ATO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  108,  'ANV',  'MMI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  109,  'MMI',  'ANV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  142,  'ALI',  'AKC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  143,  'AKC',  'ALI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  148,  'HMN',  'ABL');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  149,  'ABL',  'HMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  198,  'NGZ',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  199,  'AAF',  'NGZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  226,  'CVO',  'KKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  227,  'KKI',  'CVO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  276,  'ARB',  'ANV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  277,  'ANV',  'ARB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  308,  'ATE',  'AKC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  309,  'AKC',  'ATE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  326,  'ALX',  'ALI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  327,  'ALI',  'ALX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  370,  'AKC',  'WKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  371,  'WKK',  'AKC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  414,  'AAF',  'ALB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  415,  'ALB',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  424,  'ADG',  'AOS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  425,  'AOS',  'ADG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  470,  'ABQ',  'MMI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  471,  'MMI',  'ABQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  520,  'AIV',  'ALS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  521,  'ALS',  'AIV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  556,  'AYZ',  'AHD');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  557,  'AHD',  'AYZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  560,  'AHF',  'ATO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  561,  'ATO',  'AHF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  604,  'ADG',  'ANN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  605,  'ANN',  'ADG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  608,  'AST',  'DYS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  609,  'DYS',  'AST');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  626,  'AKI',  'AEL');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  627,  'AEL',  'AKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  658,  'ARC',  'ALM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  659,  'ALM',  'ARC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  708,  'AXB',  'AFO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  709,  'AFO',  'AXB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  744,  'AED',  'OTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  745,  'OTS',  'AED');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  754,  'CVO',  'ANY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  755,  'ANY',  'CVO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  786,  'ACV',  'AHD');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  787,  'AHD',  'ACV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  810,  'ARC',  'AQY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  811,  'AQY',  'ARC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  828,  'HMN',  'EDF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  829,  'EDF',  'HMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  878,  'KKI',  'ALM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  879,  'ALM',  'KKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  888,  'ALZ',  'ANW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  889,  'ANW',  'ALZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  900,  'AHT',  'AXX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  901,  'AXX',  'AHT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  924,  'AXG',  'ASX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  925,  'ASX',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  946,  'APV',  'ADR');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  947,  'ADR',  'APV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  996,  'AXG',  'AXS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  997,  'AXS',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1000,  'ADK',  'KKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1001,  'KKI',  'ADK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1026,  'AHN',  'DYS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1027,  'DYS',  'AHN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1062,  'AQY',  'AFO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1063,  'AFO',  'AQY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1068,  'APN',  'ALB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1069,  'ALB',  'APN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1100,  'ATE',  'ALE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1101,  'ALE',  'ATE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1144,  'AIA',  'AMW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1145,  'AMW',  'AIA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1166,  'ABQ',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1167,  'AAF',  'ABQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1168,  'ADK',  'NAB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1169,  'NAB',  'ADK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1192,  'QAW',  'AHH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1193,  'AHH',  'QAW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1208,  'NAB',  'MMI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1209,  'MMI',  'NAB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1216,  'ATE',  'ALX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1217,  'ALX',  'ATE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1250,  'ARC',  'AED');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1251,  'AED',  'ARC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1274,  'ALS',  'APG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1275,  'APG',  'ALS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1284,  'ADK',  'ADG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1285,  'ADG',  'ADK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1328,  'RLI',  'LTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (1,  1329,  'LTS',  'RLI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  14,  'APV',  'ALX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  15,  'ALX',  'APV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  18,  'MRI',  'OTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  19,  'OTS',  'MRI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  64,  'VJI',  'AOS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  65,  'AOS',  'VJI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  88,  'AGN',  'AXX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  89,  'AXX',  'AGN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  124,  'OTS',  'ALZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  125,  'ALZ',  'OTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  142,  'ABQ',  'ADM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  143,  'ADM',  'ABQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  192,  'AKK',  'NDV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  193,  'NDV',  'AKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  240,  'ATE',  'ATW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  241,  'ATW',  'ATE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  278,  'ACV',  'ALX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  279,  'ALX',  'ACV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  322,  'ALN',  'ARB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  323,  'ARB',  'ALN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  330,  'AYZ',  'AND');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  331,  'AND',  'AYZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  356,  'AKC',  'MRI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  357,  'MRI',  'AKC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  358,  'ASE',  'ASX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  359,  'ASX',  'ASE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  384,  'AOS',  'AGN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  385,  'AGN',  'AOS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  426,  'AFO',  'AMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  427,  'AMN',  'AFO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  466,  'ARB',  'AGN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  467,  'AGN',  'ARB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  484,  'ARX',  'AQY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  485,  'AQY',  'ARX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  488,  'VJI',  'APG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  489,  'APG',  'VJI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  526,  'CAK',  'ANP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  527,  'ANP',  'CAK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  550,  'AIV',  'ADK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  551,  'ADK',  'AIV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  600,  'MRI',  'ARB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  601,  'ARB',  'MRI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  644,  'AHD',  'AMA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  645,  'AMA',  'AHD');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  670,  'KKI',  'ATS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  671,  'ATS',  'KKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  672,  'ANV',  'ABL');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  673,  'ABL',  'ANV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  692,  'CAK',  'ATS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  693,  'ATS',  'CAK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  728,  'AKI',  'ESF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  729,  'ESF',  'AKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  746,  'ANC',  'AST');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  747,  'AST',  'ANC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  790,  'APN',  'CVO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  791,  'CVO',  'APN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  830,  'ANQ',  'AMA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  831,  'AMA',  'ANQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  840,  'NGZ',  'ADT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  841,  'ADT',  'NGZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  886,  'ANW',  'ABY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  887,  'ABY',  'ANW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  902,  'AKO',  'OTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  903,  'OTS',  'AKO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  920,  'AET',  'ASX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  921,  'ASX',  'AET');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  950,  'ALB',  'ADM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  951,  'ADM',  'ALB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  988,  'ALS',  'ADG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  989,  'ADG',  'ALS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1020,  'ANP',  'ADG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1021,  'ADG',  'ANP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1064,  'NAB',  'ALB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1065,  'ALB',  'NAB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1068,  'AIK',  'ANN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1069,  'ANN',  'AIK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1076,  'AXG',  'ABQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1077,  'ABQ',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1120,  'ACV',  'AKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1121,  'AKK',  'ACV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1158,  'ABI',  'QAW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1159,  'QAW',  'ABI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1188,  'AIV',  'ALE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1189,  'ALE',  'AIV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1230,  'ANY',  'ANI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1231,  'ANI',  'ANY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1242,  'AED',  'AMA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1243,  'AMA',  'AED');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1266,  'AHT',  'ALE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1267,  'ALE',  'AHT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1286,  'HMN',  'ESF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1287,  'ESF',  'HMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1330,  'AXX',  'ANP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1331,  'ANP',  'AXX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1360,  'AHH',  'AST');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1361,  'AST',  'AHH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1374,  'ALI',  'AMW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1375,  'AMW',  'ALI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1376,  'ALI',  'APG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (2,  1377,  'APG',  'ALI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  2,  'ATS',  'OTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  3,  'OTS',  'ATS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  26,  'VJI',  'ATW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  27,  'ATW',  'VJI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  36,  'CAK',  'OTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  37,  'OTS',  'CAK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  84,  'ABY',  'ALS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  85,  'ALS',  'ABY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  100,  'AXN',  'APG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  101,  'APG',  'AXN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  118,  'AXB',  'ANA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  119,  'ANA',  'AXB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  126,  'LTS',  'EDF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  127,  'EDF',  'LTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  130,  'JLH',  'AND');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  131,  'AND',  'JLH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  162,  'AIK',  'ADT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  163,  'ADT',  'AIK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  194,  'AST',  'ARX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  195,  'ARX',  'AST');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  206,  'ANB',  'ALE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  207,  'ALE',  'ANB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  240,  'AKC',  'MMI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  241,  'MMI',  'AKC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  244,  'EDF',  'AHT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  245,  'AHT',  'EDF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  268,  'AMW',  'AHN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  269,  'AHN',  'AMW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  284,  'AXB',  'AXN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  285,  'AXN',  'AXB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  300,  'ASY',  'ALE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  301,  'ALE',  'ASY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  334,  'ALI',  'ATW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  335,  'ATW',  'ALI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  364,  'AYZ',  'AUK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  365,  'AUK',  'AYZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  396,  'AED',  'ASX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  397,  'ASX',  'AED');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  432,  'ABQ',  'ANN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  433,  'ANN',  'ABQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  438,  'AFO',  'AUK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  439,  'AUK',  'AFO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  460,  'RLI',  'AHD');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  461,  'AHD',  'RLI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  498,  'ATW',  'TDW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  499,  'TDW',  'ATW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  528,  'ARB',  'AKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  529,  'AKK',  'ARB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  548,  'ARX',  'ASX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  549,  'ASX',  'ARX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  588,  'AKO',  'WKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  589,  'WKK',  'AKO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  626,  'KQA',  'ANV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  627,  'ANV',  'KQA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  656,  'ANN',  'EDF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  657,  'EDF',  'ANN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  670,  'ALN',  'ARX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  671,  'ARX',  'ALN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  694,  'AUK',  'JLH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  695,  'JLH',  'AUK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  710,  'ANN',  'AHT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  711,  'AHT',  'ANN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  734,  'ASY',  'NDV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  735,  'NDV',  'ASY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  782,  'AXG',  'JLH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  783,  'JLH',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  826,  'ABQ',  'AEL');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  827,  'AEL',  'ABQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  862,  'LTS',  'RLI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  863,  'RLI',  'LTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  904,  'APV',  'ANV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  905,  'ANV',  'APV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  922,  'ASY',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  923,  'AAF',  'ASY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  962,  'NGZ',  'ALI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  963,  'ALI',  'NGZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  970,  'ANP',  'AIB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  971,  'AIB',  'ANP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1000,  'ASX',  'ANY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1001,  'ANY',  'ASX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1010,  'CVO',  'AST');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1011,  'AST',  'CVO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1040,  'AHF',  'OTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1041,  'OTS',  'AHF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1070,  'ANP',  'ARC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1071,  'ARC',  'ANP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1094,  'AAF',  'ALS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1095,  'ALS',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1140,  'ATW',  'ALB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1141,  'ALB',  'ATW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1186,  'ANB',  'AET');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1187,  'AET',  'ANB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1190,  'AXX',  'ADG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1191,  'ADG',  'AXX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1226,  'AID',  'ABL');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1227,  'ABL',  'AID');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1270,  'CAK',  'AXS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1271,  'AXS',  'CAK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1274,  'ASY',  'AFO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (3,  1275,  'AFO',  'ASY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  10,  'ASY',  'ATS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  11,  'ATS',  'ASY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  32,  'ALX',  'OTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  33,  'OTS',  'ALX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  34,  'ADR',  'ATS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  35,  'ATS',  'ADR');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  56,  'AET',  'AKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  57,  'AKI',  'AET');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  62,  'AEX',  'MRI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  63,  'MRI',  'AEX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  94,  'AHH',  'ANA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  95,  'ANA',  'AHH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  136,  'LTS',  'JLH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  137,  'JLH',  'LTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  166,  'AAF',  'AKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  167,  'AKI',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  168,  'ALI',  'ANY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  169,  'ANY',  'ALI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  200,  'ADT',  'EDF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  201,  'EDF',  'ADT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  226,  'VJI',  'OTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  227,  'OTS',  'VJI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  260,  'ADT',  'ANN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  261,  'ANN',  'ADT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  264,  'ARB',  'ATW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  265,  'ATW',  'ARB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  296,  'AIV',  'AFO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  297,  'AFO',  'AIV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  340,  'ADM',  'AST');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  341,  'AST',  'ADM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  358,  'ADG',  'AMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  359,  'AMN',  'ADG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  378,  'WKK',  'ANQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  379,  'ANQ',  'WKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  384,  'AYZ',  'CVO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  385,  'CVO',  'AYZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  430,  'CVO',  'LTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  431,  'LTS',  'CVO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  436,  'AMA',  'WKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  437,  'WKK',  'AMA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  478,  'AAF',  'AXX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  479,  'AXX',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  510,  'ANP',  'AIB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  511,  'AIB',  'ANP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  544,  'LTS',  'QAW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  545,  'QAW',  'LTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  546,  'ANY',  'AKC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  547,  'AKC',  'ANY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  558,  'AGN',  'AHN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  559,  'AHN',  'AGN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  564,  'AYZ',  'AED');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  565,  'AED',  'AYZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  582,  'AXX',  'WKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  583,  'WKK',  'AXX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  604,  'AFO',  'ANC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  605,  'ANC',  'AFO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  624,  'ANC',  'ANV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  625,  'ANV',  'ANC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  626,  'AIA',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  627,  'AXG',  'AIA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  666,  'AAF',  'AMA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  667,  'AMA',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  716,  'JLH',  'AYZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  717,  'AYZ',  'JLH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  742,  'HMN',  'APG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  743,  'APG',  'HMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  750,  'NAB',  'ESF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  751,  'ESF',  'NAB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  784,  'AQY',  'DYS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  785,  'DYS',  'AQY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  832,  'ANN',  'AOS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  833,  'AOS',  'ANN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  838,  'APV',  'ALM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  839,  'ALM',  'APV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  870,  'ATE',  'ARB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  871,  'ARB',  'ATE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  902,  'NGZ',  'ANQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  903,  'ANQ',  'NGZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  946,  'AHT',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  947,  'AXG',  'AHT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  990,  'ALI',  'ANN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  991,  'ANN',  'ALI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  1036,  'ANQ',  'ALS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  1037,  'ALS',  'ANQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  1064,  'ANV',  'AET');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  1065,  'AET',  'ANV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  1100,  'ARB',  'AEL');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  1101,  'AEL',  'ARB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  1118,  'ANC',  'ANY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  1119,  'ANY',  'ANC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  1138,  'ABR',  'AET');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  1139,  'AET',  'ABR');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  1162,  'ANW',  'AKO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  1163,  'AKO',  'ANW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  1172,  'AHH',  'AYZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  1173,  'AYZ',  'AHH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  1206,  'AXN',  'NDV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  1207,  'NDV',  'AXN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  1224,  'AND',  'MMI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (4,  1225,  'MMI',  'AND');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  22,  'WKK',  'ARB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  23,  'ARB',  'WKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  62,  'ALM',  'AKP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  63,  'AKP',  'ALM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  66,  'ANA',  'AIK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  67,  'AIK',  'ANA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  76,  'ANC',  'AMA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  77,  'AMA',  'ANC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  104,  'ALB',  'ANY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  105,  'ANY',  'ALB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  134,  'AFO',  'ADT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  135,  'ADT',  'AFO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  148,  'CAK',  'ALE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  149,  'ALE',  'CAK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  194,  'ASY',  'ALE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  195,  'ALE',  'ASY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  234,  'ALS',  'AET');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  235,  'AET',  'ALS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  238,  'AHF',  'ABY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  239,  'ABY',  'AHF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  242,  'ADR',  'LTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  243,  'LTS',  'ADR');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  244,  'ALM',  'EDF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  245,  'EDF',  'ALM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  264,  'ARX',  'AHN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  265,  'AHN',  'ARX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  300,  'AXS',  'AXX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  301,  'AXX',  'AXS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  318,  'ARX',  'QAW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  319,  'QAW',  'ARX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  350,  'ATW',  'AOS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  351,  'AOS',  'ATW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  360,  'ARX',  'ANW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  361,  'ANW',  'ARX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  386,  'NDV',  'EDF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  387,  'EDF',  'NDV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  412,  'ALS',  'AHT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  413,  'AHT',  'ALS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  432,  'APV',  'TDW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  433,  'TDW',  'APV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  468,  'CVO',  'AXS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  469,  'AXS',  'CVO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  484,  'QAW',  'MMI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  485,  'MMI',  'QAW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  504,  'ASX',  'AND');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  505,  'AND',  'ASX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  546,  'ALS',  'AOS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  547,  'AOS',  'ALS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  592,  'VJI',  'AIB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  593,  'AIB',  'VJI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  602,  'ANW',  'AHT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  603,  'AHT',  'ANW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  616,  'AHH',  'ASX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  617,  'ASX',  'AHH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  648,  'ASX',  'AND');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  649,  'AND',  'ASX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  688,  'ANI',  'DYS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  689,  'DYS',  'ANI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  726,  'RFK',  'ASY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  727,  'ASY',  'RFK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  752,  'ASE',  'CVO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  753,  'CVO',  'ASE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  798,  'AGN',  'ESF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  799,  'ESF',  'AGN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  808,  'ARC',  'AMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  809,  'AMN',  'ARC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  816,  'ALI',  'ABY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  817,  'ABY',  'ALI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  866,  'AND',  'ALE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  867,  'ALE',  'AND');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  894,  'ALS',  'KQA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  895,  'KQA',  'ALS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  902,  'AFO',  'WKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  903,  'WKK',  'AFO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  918,  'ASY',  'QAW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  919,  'QAW',  'ASY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  926,  'DYS',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  927,  'AAF',  'DYS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  964,  'AXN',  'AYZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  965,  'AYZ',  'AXN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1010,  'RLI',  'LTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1011,  'LTS',  'RLI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1054,  'ANN',  'ATW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1055,  'ATW',  'ANN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1088,  'ANV',  'AKO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1089,  'AKO',  'ANV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1128,  'ANB',  'ASY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1129,  'ASY',  'ANB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1178,  'ANQ',  'ALX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1179,  'ALX',  'ANQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1204,  'AOS',  'AST');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1205,  'AST',  'AOS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1248,  'ABR',  'ALE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1249,  'ALE',  'ABR');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1276,  'AMN',  'KQA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1277,  'KQA',  'AMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1324,  'DYS',  'TDW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1325,  'TDW',  'DYS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1334,  'CAK',  'AKC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (5,  1335,  'AKC',  'CAK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  4,  'ALX',  'NAB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  5,  'NAB',  'ALX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  28,  'ABQ',  'APG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  29,  'APG',  'ABQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  50,  'AIB',  'ALZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  51,  'ALZ',  'AIB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  70,  'AKC',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  71,  'AAF',  'AKC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  82,  'ABY',  'ATO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  83,  'ATO',  'ABY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  112,  'NAB',  'AKP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  113,  'AKP',  'NAB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  162,  'NDV',  'AOS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  163,  'AOS',  'NDV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  174,  'ANV',  'ALZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  175,  'ALZ',  'ANV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  178,  'ABQ',  'ALI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  179,  'ALI',  'ABQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  210,  'AXG',  'AQY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  211,  'AQY',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  250,  'AXX',  'AED');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  251,  'AED',  'AXX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  252,  'AXG',  'ANY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  253,  'ANY',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  302,  'CAK',  'AIV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  303,  'AIV',  'CAK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  346,  'ARB',  'OTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  347,  'OTS',  'ARB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  368,  'JLH',  'NAB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  369,  'NAB',  'JLH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  370,  'WKK',  'ADT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  371,  'ADT',  'WKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  372,  'ATE',  'MMI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  373,  'MMI',  'ATE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  400,  'TDW',  'ABR');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  401,  'ABR',  'TDW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  424,  'RFK',  'ALS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  425,  'ALS',  'RFK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  442,  'OTS',  'AXX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  443,  'AXX',  'OTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  478,  'APG',  'AEL');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  479,  'AEL',  'APG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  516,  'KKI',  'AKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  517,  'AKI',  'KKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  534,  'QAW',  'ABY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  535,  'ABY',  'QAW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  568,  'ASY',  'AMW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  569,  'AMW',  'ASY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  610,  'ANP',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  611,  'AXG',  'ANP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  620,  'AST',  'OTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  621,  'OTS',  'AST');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  658,  'ALM',  'CVO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  659,  'CVO',  'ALM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  670,  'AYZ',  'HMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  671,  'HMN',  'AYZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  704,  'KKI',  'WKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  705,  'WKK',  'KKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  708,  'ANB',  'ALI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  709,  'ALI',  'ANB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  716,  'AKP',  'AHF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  717,  'AHF',  'AKP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  740,  'HMN',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  741,  'AXG',  'HMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  754,  'AAF',  'ARX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  755,  'ARX',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  762,  'AMW',  'ATS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  763,  'ATS',  'AMW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  810,  'AHD',  'DYS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  811,  'DYS',  'AHD');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  812,  'ARB',  'CAK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  813,  'CAK',  'ARB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  814,  'ANB',  'NGZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  815,  'NGZ',  'ANB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  862,  'ANQ',  'AXX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  863,  'AXX',  'ANQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  906,  'ARC',  'RFK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  907,  'RFK',  'ARC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  932,  'NDV',  'ASY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  933,  'ASY',  'NDV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  950,  'ALE',  'AIB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  951,  'AIB',  'ALE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  970,  'ASE',  'AOS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  971,  'AOS',  'ASE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  1012,  'AXS',  'VJI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  1013,  'VJI',  'AXS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  1020,  'MRI',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  1021,  'AXG',  'MRI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  1070,  'ADK',  'ABR');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  1071,  'ABR',  'ADK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  1114,  'AEX',  'NDV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  1115,  'NDV',  'AEX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  1132,  'AOS',  'MRI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  1133,  'MRI',  'AOS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  1144,  'ALS',  'AEL');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  1145,  'AEL',  'ALS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  1154,  'AIK',  'AIB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  1155,  'AIB',  'AIK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  1194,  'AAF',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (6,  1195,  'AXG',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  44,  'AKI',  'ABR');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  45,  'ABR',  'AKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  58,  'ASX',  'AST');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  59,  'AST',  'ASX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  68,  'EDF',  'AFO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  69,  'AFO',  'EDF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  76,  'ARB',  'ABL');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  77,  'ABL',  'ARB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  114,  'ARB',  'ADK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  115,  'ADK',  'ARB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  118,  'AKK',  'ANW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  119,  'ANW',  'AKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  120,  'AKI',  'ALX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  121,  'ALX',  'AKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  122,  'KKI',  'ANN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  123,  'ANN',  'KKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  152,  'AXG',  'MRI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  153,  'MRI',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  188,  'AND',  'ALZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  189,  'ALZ',  'AND');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  230,  'NGZ',  'ABY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  231,  'ABY',  'NGZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  250,  'AXS',  'ATS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  251,  'ATS',  'AXS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  294,  'AET',  'AKP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  295,  'AKP',  'AET');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  312,  'AIV',  'ALE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  313,  'ALE',  'AIV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  316,  'AST',  'AKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  317,  'AKI',  'AST');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  336,  'AXG',  'AUK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  337,  'AUK',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  370,  'QAW',  'ATW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  371,  'ATW',  'QAW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  398,  'JLH',  'AET');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  399,  'AET',  'JLH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  408,  'AMN',  'ADG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  409,  'ADG',  'AMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  454,  'KQA',  'ADK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  455,  'ADK',  'KQA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  484,  'ALX',  'AKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  485,  'AKK',  'ALX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  492,  'OTS',  'NAB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  493,  'NAB',  'OTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  542,  'WKK',  'ANC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  543,  'ANC',  'WKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  560,  'ATW',  'ASE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  561,  'ASE',  'ATW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  570,  'OTS',  'ADG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  571,  'ADG',  'OTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  614,  'AIA',  'AMW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  615,  'AMW',  'AIA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  662,  'ATS',  'AKO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  663,  'AKO',  'ATS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  670,  'ANA',  'ADR');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  671,  'ADR',  'ANA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  714,  'ARC',  'ALM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  715,  'ALM',  'ARC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  720,  'AED',  'KQA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  721,  'KQA',  'AED');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  722,  'AST',  'CAK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  723,  'CAK',  'AST');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  736,  'ARX',  'ABY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  737,  'ABY',  'ARX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  754,  'ABR',  'MMI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  755,  'MMI',  'ABR');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  792,  'AIA',  'NGZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  793,  'NGZ',  'AIA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  812,  'AND',  'AXN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  813,  'AXN',  'AND');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  818,  'AXN',  'AEX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  819,  'AEX',  'AXN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  844,  'MMI',  'AOS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  845,  'AOS',  'MMI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  854,  'KQA',  'APN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  855,  'APN',  'KQA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  856,  'LTS',  'TDW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  857,  'TDW',  'LTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  898,  'AYZ',  'MRI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  899,  'MRI',  'AYZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  942,  'AKP',  'AIB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  943,  'AIB',  'AKP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  948,  'AKK',  'OTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  949,  'OTS',  'AKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  980,  'AUK',  'AIA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  981,  'AIA',  'AUK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  1030,  'AED',  'AXS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  1031,  'AXS',  'AED');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  1070,  'AET',  'ARB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  1071,  'ARB',  'AET');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  1080,  'AHF',  'AGN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  1081,  'AGN',  'AHF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  1096,  'ABI',  'EDF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  1097,  'EDF',  'ABI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  1118,  'MMI',  'AKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  1119,  'AKI',  'MMI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  1126,  'AKI',  'ESF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  1127,  'ESF',  'AKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  1138,  'VJI',  'ESF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (7,  1139,  'ESF',  'VJI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  42,  'ABY',  'ALM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  43,  'ALM',  'ABY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  88,  'KQA',  'AMW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  89,  'AMW',  'KQA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  132,  'AKK',  'AIK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  133,  'AIK',  'AKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  170,  'LTS',  'EDF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  171,  'EDF',  'LTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  174,  'DYS',  'ABQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  175,  'ABQ',  'DYS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  210,  'CAK',  'ANP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  211,  'ANP',  'CAK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  246,  'AIK',  'AST');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  247,  'AST',  'AIK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  292,  'QAW',  'DYS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  293,  'DYS',  'QAW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  336,  'KKI',  'ALE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  337,  'ALE',  'KKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  372,  'AHF',  'AKC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  373,  'AKC',  'AHF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  420,  'AKP',  'ADT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  421,  'ADT',  'AKP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  468,  'HMN',  'AGN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  469,  'AGN',  'HMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  512,  'ABQ',  'ADK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  513,  'ADK',  'ABQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  536,  'AKC',  'ANV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  537,  'ANV',  'AKC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  542,  'ABQ',  'NGZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  543,  'NGZ',  'ABQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  576,  'AIV',  'AMA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  577,  'AMA',  'AIV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  588,  'AEX',  'AXN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  589,  'AXN',  'AEX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  604,  'ASY',  'ASE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  605,  'ASE',  'ASY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  640,  'ABQ',  'AOS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  641,  'AOS',  'ABQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  652,  'AHF',  'AHD');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  653,  'AHD',  'AHF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  670,  'ASY',  'CVO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  671,  'CVO',  'ASY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  714,  'JLH',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  715,  'AAF',  'JLH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  726,  'ACV',  'ASY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  727,  'ASY',  'ACV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  736,  'ACV',  'ABQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  737,  'ABQ',  'ACV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  752,  'AEL',  'ATE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  753,  'ATE',  'AEL');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  792,  'ANY',  'ANP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  793,  'ANP',  'ANY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  832,  'AAF',  'MMI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  833,  'MMI',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  836,  'APN',  'ALB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  837,  'ALB',  'APN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  872,  'ABY',  'CAK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  873,  'CAK',  'ABY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  908,  'MMI',  'ABR');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  909,  'ABR',  'MMI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  956,  'ADK',  'AQY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  957,  'AQY',  'ADK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  994,  'ABY',  'AXB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  995,  'AXB',  'ABY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1038,  'EDF',  'ARX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1039,  'ARX',  'EDF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1050,  'RFK',  'CVO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1051,  'CVO',  'RFK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1086,  'EDF',  'AFO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1087,  'AFO',  'EDF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1096,  'ANP',  'NAB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1097,  'NAB',  'ANP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1138,  'DYS',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1139,  'AAF',  'DYS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1182,  'AKI',  'ARC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1183,  'ARC',  'AKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1232,  'NDV',  'AKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1233,  'AKI',  'NDV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1278,  'ANB',  'ANP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1279,  'ANP',  'ANB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1280,  'ATO',  'AET');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1281,  'AET',  'ATO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1308,  'ADG',  'ALS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1309,  'ALS',  'ADG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1346,  'AND',  'ESF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1347,  'ESF',  'AND');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1348,  'ANI',  'AHF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1349,  'AHF',  'ANI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1376,  'WKK',  'ASE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1377,  'ASE',  'WKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1418,  'AEL',  'ATS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1419,  'ATS',  'AEL');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1420,  'ALM',  'ANV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1421,  'ANV',  'ALM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1468,  'AID',  'JLH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1469,  'JLH',  'AID');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1490,  'ANB',  'JLH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1491,  'JLH',  'ANB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1534,  'AMN',  'CAK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (8,  1535,  'CAK',  'AMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  12,  'ACV',  'ATW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  13,  'ATW',  'ACV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  62,  'AYZ',  'ANI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  63,  'ANI',  'AYZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  78,  'ASE',  'JLH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  79,  'JLH',  'ASE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  84,  'ACV',  'AKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  85,  'AKI',  'ACV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  120,  'ABI',  'AMA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  121,  'AMA',  'ABI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  158,  'AKO',  'AQY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  159,  'AQY',  'AKO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  178,  'QAW',  'VJI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  179,  'VJI',  'QAW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  224,  'ASY',  'AHF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  225,  'AHF',  'ASY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  230,  'ANY',  'ABQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  231,  'ABQ',  'ANY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  270,  'ARC',  'VJI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  271,  'VJI',  'ARC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  278,  'AHH',  'AST');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  279,  'AST',  'AHH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  312,  'AXG',  'ALN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  313,  'ALN',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  342,  'ALB',  'ANC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  343,  'ANC',  'ALB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  384,  'ANV',  'ANQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  385,  'ANQ',  'ANV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  390,  'DYS',  'AIV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  391,  'AIV',  'DYS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  422,  'AIA',  'VJI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  423,  'VJI',  'AIA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  468,  'HMN',  'AHD');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  469,  'AHD',  'HMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  486,  'AET',  'AMA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  487,  'AMA',  'AET');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  536,  'CAK',  'AMA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  537,  'AMA',  'CAK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  580,  'ADM',  'ANI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  581,  'ANI',  'ADM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  616,  'HMN',  'AND');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  617,  'AND',  'HMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  622,  'AED',  'KKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  623,  'KKI',  'AED');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  628,  'ANI',  'ADT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  629,  'ADT',  'ANI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  634,  'AKI',  'ATW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  635,  'ATW',  'AKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  646,  'ARX',  'AHF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  647,  'AHF',  'ARX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  654,  'ATS',  'DYS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  655,  'DYS',  'ATS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  680,  'ABY',  'AGN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  681,  'AGN',  'ABY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  692,  'AIK',  'CVO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  693,  'CVO',  'AIK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  722,  'ANP',  'ANB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  723,  'ANB',  'ANP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  746,  'WKK',  'ESF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  747,  'ESF',  'WKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  748,  'ATS',  'RLI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  749,  'RLI',  'ATS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  780,  'JLH',  'ANV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  781,  'ANV',  'JLH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  828,  'ADG',  'HMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  829,  'HMN',  'ADG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  876,  'ALM',  'AIV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  877,  'AIV',  'ALM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  882,  'ADT',  'ALZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  883,  'ALZ',  'ADT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  892,  'WKK',  'ANV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  893,  'ANV',  'WKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  894,  'AAF',  'AHT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  895,  'AHT',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  942,  'ABI',  'MMI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  943,  'MMI',  'ABI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  968,  'CAK',  'ALN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  969,  'ALN',  'CAK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1006,  'AET',  'ANV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1007,  'ANV',  'AET');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1026,  'AEL',  'MRI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1027,  'MRI',  'AEL');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1044,  'AQY',  'NGZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1045,  'NGZ',  'AQY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1060,  'AST',  'ADK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1061,  'ADK',  'AST');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1090,  'CVO',  'HMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1091,  'HMN',  'CVO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1114,  'LTS',  'ABI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1115,  'ABI',  'LTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1150,  'ASE',  'VJI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1151,  'VJI',  'ASE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1188,  'AHF',  'OTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1189,  'OTS',  'AHF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1228,  'ALN',  'ALZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1229,  'ALZ',  'ALN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1260,  'AEX',  'ARC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1261,  'ARC',  'AEX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1286,  'ALE',  'JLH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (9,  1287,  'JLH',  'ALE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  6,  'TDW',  'AXN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  7,  'AXN',  'TDW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  54,  'KQA',  'AHF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  55,  'AHF',  'KQA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  66,  'DYS',  'ADT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  67,  'ADT',  'DYS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  98,  'MRI',  'ANA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  99,  'ANA',  'MRI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  144,  'AXN',  'RFK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  145,  'RFK',  'AXN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  174,  'AED',  'AMA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  175,  'AMA',  'AED');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  218,  'AKO',  'ANN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  219,  'ANN',  'AKO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  224,  'ANI',  'AIV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  225,  'AIV',  'ANI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  264,  'AIA',  'ABI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  265,  'ABI',  'AIA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  310,  'QAW',  'ANP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  311,  'ANP',  'QAW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  336,  'ARC',  'ADR');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  337,  'ADR',  'ARC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  352,  'AYZ',  'QAW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  353,  'QAW',  'AYZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  382,  'APG',  'ALE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  383,  'ALE',  'APG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  408,  'ANQ',  'AUK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  409,  'AUK',  'ANQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  430,  'ADR',  'CAK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  431,  'CAK',  'ADR');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  468,  'AAF',  'APV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  469,  'APV',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  512,  'CVO',  'ESF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  513,  'ESF',  'CVO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  562,  'ANW',  'ATE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  563,  'ATE',  'ANW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  600,  'ABQ',  'AKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  601,  'AKI',  'ABQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  602,  'AKK',  'ADK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  603,  'ADK',  'AKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  646,  'ARB',  'ASE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  647,  'ASE',  'ARB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  650,  'ANQ',  'AEX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  651,  'AEX',  'ANQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  700,  'ANC',  'AKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  701,  'AKI',  'ANC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  736,  'QAW',  'AMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  737,  'AMN',  'QAW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  784,  'NGZ',  'NAB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  785,  'NAB',  'NGZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  820,  'AHN',  'ACV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  821,  'ACV',  'AHN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  826,  'AHH',  'ARB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  827,  'ARB',  'AHH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  858,  'VJI',  'ALB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  859,  'ALB',  'VJI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  890,  'AYZ',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  891,  'AXG',  'AYZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  928,  'ANB',  'AHD');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  929,  'AHD',  'ANB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  934,  'ABI',  'AKP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  935,  'AKP',  'ABI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  982,  'ANP',  'ATE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  983,  'ATE',  'ANP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1000,  'AHN',  'ANN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1001,  'ANN',  'AHN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1040,  'AIB',  'MRI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1041,  'MRI',  'AIB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1070,  'ANN',  'ARC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1071,  'ARC',  'ANN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1116,  'ANI',  'AFO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1117,  'AFO',  'ANI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1128,  'ABI',  'AMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1129,  'AMN',  'ABI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1136,  'ABL',  'ABI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1137,  'ABI',  'ABL');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1144,  'AKK',  'CAK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1145,  'CAK',  'AKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1172,  'APG',  'AKC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1173,  'AKC',  'APG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1182,  'ATW',  'ALZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1183,  'ALZ',  'ATW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1210,  'ANY',  'ALB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1211,  'ALB',  'ANY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1256,  'AED',  'ADM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1257,  'ADM',  'AED');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1298,  'ATS',  'ALS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1299,  'ALS',  'ATS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1314,  'AIV',  'AHF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1315,  'AHF',  'AIV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1330,  'ALM',  'NGZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1331,  'NGZ',  'ALM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1356,  'AMA',  'ATW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1357,  'ATW',  'AMA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1390,  'ADG',  'ABL');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1391,  'ABL',  'ADG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1426,  'JLH',  'ABL');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1427,  'ABL',  'JLH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1476,  'AIV',  'ALE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (10,  1477,  'ALE',  'AIV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  14,  'AGN',  'ANP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  15,  'ANP',  'AGN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  58,  'AKK',  'TDW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  59,  'TDW',  'AKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  80,  'AET',  'AXB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  81,  'AXB',  'AET');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  88,  'ANY',  'AQY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  89,  'AQY',  'ANY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  110,  'AXS',  'AMW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  111,  'AMW',  'AXS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  134,  'NDV',  'ADG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  135,  'ADG',  'NDV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  142,  'AXS',  'APG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  143,  'APG',  'AXS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  158,  'AHT',  'ANV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  159,  'ANV',  'AHT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  200,  'ANC',  'AIK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  201,  'AIK',  'ANC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  204,  'AIK',  'AXN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  205,  'AXN',  'AIK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  240,  'ARC',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  241,  'AXG',  'ARC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  284,  'ABQ',  'WKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  285,  'WKK',  'ABQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  296,  'AGN',  'AIV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  297,  'AIV',  'AGN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  302,  'ANY',  'TDW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  303,  'TDW',  'ANY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  330,  'AXG',  'LTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  331,  'LTS',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  378,  'RFK',  'ASY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  379,  'ASY',  'RFK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  400,  'ANA',  'AEL');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  401,  'AEL',  'ANA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  436,  'ABQ',  'AND');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  437,  'AND',  'ABQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  470,  'CAK',  'AHT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  471,  'AHT',  'CAK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  504,  'AAF',  'AKO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  505,  'AKO',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  512,  'ASY',  'ABR');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  513,  'ABR',  'ASY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  524,  'ADK',  'ALM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  525,  'ALM',  'ADK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  566,  'LTS',  'AET');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  567,  'AET',  'LTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  570,  'ANA',  'RLI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  571,  'RLI',  'ANA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  574,  'ADK',  'LTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  575,  'LTS',  'ADK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  590,  'ANY',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  591,  'AAF',  'ANY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  594,  'ANN',  'ANY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  595,  'ANY',  'ANN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  636,  'ALX',  'RLI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  637,  'RLI',  'ALX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  640,  'AND',  'AIA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  641,  'AIA',  'AND');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  666,  'AYZ',  'ANC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  667,  'ANC',  'AYZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  704,  'ADR',  'AKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  705,  'AKI',  'ADR');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  730,  'AUK',  'ALS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  731,  'ALS',  'AUK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  740,  'AXG',  'OTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  741,  'OTS',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  772,  'JLH',  'ADM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  773,  'ADM',  'JLH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  774,  'ALN',  'AKP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  775,  'AKP',  'ALN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  824,  'ABI',  'ANW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  825,  'ANW',  'ABI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  834,  'ATS',  'AXN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  835,  'AXN',  'ATS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  842,  'ABR',  'AXN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  843,  'AXN',  'ABR');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  876,  'KQA',  'AXX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  877,  'AXX',  'KQA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  904,  'AKO',  'DYS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  905,  'DYS',  'AKO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  908,  'ANQ',  'ATO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  909,  'ATO',  'ANQ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  954,  'AHH',  'AQY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  955,  'AQY',  'AHH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  986,  'MMI',  'AIB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  987,  'AIB',  'MMI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  1012,  'ABI',  'ALZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  1013,  'ALZ',  'ABI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  1022,  'CVO',  'NDV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  1023,  'NDV',  'CVO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  1060,  'WKK',  'NAB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  1061,  'NAB',  'WKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  1078,  'ALZ',  'ADG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  1079,  'ADG',  'ALZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  1112,  'ARB',  'CVO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  1113,  'CVO',  'ARB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  1136,  'AEX',  'AHF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  1137,  'AHF',  'AEX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  1178,  'KQA',  'AFO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (11,  1179,  'AFO',  'KQA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  42,  'AID',  'ADK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  43,  'ADK',  'AID');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  80,  'AKK',  'APV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  81,  'APV',  'AKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  120,  'ASY',  'ADK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  121,  'ADK',  'ASY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  156,  'ABY',  'ESF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  157,  'ESF',  'ABY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  206,  'ARB',  'AIV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  207,  'AIV',  'ARB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  208,  'AHN',  'AHD');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  209,  'AHD',  'AHN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  234,  'EDF',  'AKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  235,  'AKK',  'EDF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  264,  'AMW',  'AKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  265,  'AKI',  'AMW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  284,  'ADM',  'RLI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  285,  'RLI',  'ADM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  312,  'TDW',  'ANC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  313,  'ANC',  'TDW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  326,  'ATO',  'AOS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  327,  'AOS',  'ATO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  368,  'LTS',  'ANB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  369,  'ANB',  'LTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  402,  'ATW',  'ANP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  403,  'ANP',  'ATW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  424,  'RLI',  'ABY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  425,  'ABY',  'RLI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  450,  'ALB',  'HMN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  451,  'HMN',  'ALB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  490,  'AIA',  'NAB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  491,  'NAB',  'AIA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  540,  'AHT',  'AMW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  541,  'AMW',  'AHT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  584,  'ALZ',  'ASE');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  585,  'ASE',  'ALZ');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  614,  'QAW',  'ADT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  615,  'ADT',  'QAW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  650,  'CAK',  'AXN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  651,  'AXN',  'CAK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  690,  'AEX',  'ANI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  691,  'ANI',  'AEX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  728,  'ADM',  'KKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  729,  'KKI',  'ADM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  748,  'AAF',  'ALS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  749,  'ALS',  'AAF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  766,  'RLI',  'AND');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  767,  'AND',  'RLI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  778,  'ABY',  'AQY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  779,  'AQY',  'ABY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  820,  'ALN',  'ANW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  821,  'ANW',  'ALN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  834,  'ABI',  'AIV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  835,  'AIV',  'ABI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  850,  'ARC',  'AET');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  851,  'AET',  'ARC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  890,  'ATO',  'ALS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  891,  'ALS',  'ATO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  924,  'ANB',  'KKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  925,  'KKI',  'ANB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  946,  'AXG',  'AKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  947,  'AKK',  'AXG');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  956,  'AKO',  'ABL');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  957,  'ABL',  'AKO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  970,  'AST',  'ADM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  971,  'ADM',  'AST');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1004,  'CAK',  'LTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1005,  'LTS',  'CAK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1022,  'AKI',  'AHN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1023,  'AHN',  'AKI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1056,  'ALN',  'ADR');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1057,  'ADR',  'ALN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1106,  'RLI',  'AIB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1107,  'AIB',  'RLI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1120,  'JLH',  'AHF');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1121,  'AHF',  'JLH');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1126,  'RLI',  'ABY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1127,  'ABY',  'RLI');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1172,  'AMA',  'ARX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1173,  'ARX',  'AMA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1204,  'ARB',  'ADM');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1205,  'ADM',  'ARB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1230,  'ANC',  'CVO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1231,  'CVO',  'ANC');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1244,  'ANP',  'ANY');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1245,  'ANY',  'ANP');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1252,  'WKK',  'ANN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1253,  'ANN',  'WKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1254,  'AIB',  'ANV');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1255,  'ANV',  'AIB');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1280,  'AEX',  'ARX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1281,  'ARX',  'AEX');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1300,  'AMA',  'AFO');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1301,  'AFO',  'AMA');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1334,  'ADT',  'AKK');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1335,  'AKK',  'ADT');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1364,  'AMW',  'ANN');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1365,  'ANN',  'AMW');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1376,  'ALE',  'LTS');
INSERT INTO 3nf_FLIGHTS (Airline,  FlightNo,  SourceAirport,  DestAirport) 
    VALUES (12,  1377,  'LTS',  'ALE');



-- BAKERY-1
UPDATE GOODS 
    SET Price = Price - 2 WHERE Food='Cake' and (Flavor='Lemon' or Flavor='Napoleon');
-- BAKERY-2
UPDATE GOODS 
    SET Price = Price*1.15 
    WHERE (Flavor='Apricot' or Flavor='Chocolate') and (Price < 5.95);
-- BAKERY-3
ALTER TABLE RECEIPTS 
    CHANGE `Date` `SaleDateTime` DATETIME;
-- INN-1
DROP TABLE ROOMS, RESERVATIONS, ROOMSERVICE;
source INN-setup.sql;
source INN-populate.sql;
CREATE TABLE ROOMSERVICE(
    RoomCode INTEGER,
    `Order` DATETIME,
    `Deliver` DATETIME,
    Bill FLOAT,
    Gratuity FLOAT,
    FirstName VARCHAR (50),
    PRIMARY KEY (`Order`),
    FOREIGN KEY (RoomCode) REFERENCES RESERVATIONS (Code)
);
INSERT INTO ROOMSERVICE (RoomCode, `Order`, `Deliver`, Bill, Gratuity, FirstName)
    VALUES (98805, STR_TO_DATE('2008-11-11 13:23:44', '%Y-%m-%d %T'), STR_TO_DATE('2008-11-11 18:23:44', '%Y-%m-%d %T'), 250.70, 44.40, 'Jeff');
INSERT INTO ROOMSERVICE (RoomCode, `Order`, `Deliver`, Bill, Gratuity, FirstName)
    VALUES (98805, STR_TO_DATE('2008-11-11 14:23:44', '%Y-%m-%d %T'), STR_TO_DATE('2008-11-11 19:23:44', '%Y-%m-%d %T'), 300.70, 64.40, 'Jeff');
INSERT INTO ROOMSERVICE (RoomCode, `Order`, `Deliver`, Bill, Gratuity, FirstName)
    VALUES (98805, STR_TO_DATE('2008-11-11 15:23:44', '%Y-%m-%d %T'), STR_TO_DATE('2008-11-11 20:23:44', '%Y-%m-%d %T'), 330.70, 77.40, 'Jeff');
INSERT INTO ROOMSERVICE (RoomCode, `Order`, `Deliver`, Bill, Gratuity, FirstName)
    VALUES (47496, STR_TO_DATE('2020-11-11 12:23:13', '%Y-%m-%d %T'), STR_TO_DATE('2020-11-11 14:23:22', '%Y-%m-%d %T'), 100.70, 20.40, 'ENA');
INSERT INTO ROOMSERVICE (RoomCode, `Order`, `Deliver`, Bill, Gratuity, FirstName)
    VALUES (76809, STR_TO_DATE('2019-11-11 4:23:44', '%Y-%m-%d %T'), STR_TO_DATE('2008-11-11 6:23:44', '%Y-%m-%d %T'), 420.70, 62.40, 'Shelly');
-- INN-2
DELETE FROM RESERVATIONS 
    WHERE (CheckOut < (CURDATE() - 180)) AND (FirstName='ENA' AND LastName='KOLB');
DELETE FROM ROOMSERVICE 
    WHERE (Deliver < (CURRENT_TIMESTAMP - 180)) AND (FirstName='ENA');
-- INN-3
delimiter **
CREATE TRIGGER overlap BEFORE INSERT ON RESERVATIONS 
FOR EACH ROW 
    BEGIN 
    if exists (SELECT * FROM RESERVATIONS WHERE (Room=New.Room) AND (CheckOut > NEW.CheckIn)) then 
        signal SQLSTATE '45000'
        set MESSAGE_TEXT = 'Overlap';
    end if;
end;**
delimiter ;