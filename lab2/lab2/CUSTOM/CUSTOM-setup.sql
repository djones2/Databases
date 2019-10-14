drop table TEAMS, GAMES, PLAYERS;

CREATE TABLE TEAMS(
    team_name VARCHAR(50),
    prefix_1 VARCHAR(10),
    prefix_2 VARCHAR(10),
    PRIMARY KEY (team_name)
);

CREATE TABLE GAMES(
    id INTEGER,
    `date` DATE,
    home_team VARCHAR(50),
    home_team_score INTEGER,
    visit_team VARCHAR(50),
    visit_team_score INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (home_team) REFERENCES TEAMS (team_name),
    FOREIGN KEY (visit_team) REFERENCES TEAMS (team_name)
);

CREATE TABLE PLAYERS(
    id INTEGER,
    team VARCHAR(50),
    player VARCHAR(50),
    PRIMARY KEY (player),
    FOREIGN KEY (team) REFERENCES TEAMS (team_name)
);
