
CREATE TABLE Teams(
    TeamID INT AUTO_INCREMENT PRIMARY KEY,
    TeamsName VARCHAR(100) NOT NULL UNIQUE,
    City VARCHAR(100) NOT NULL,
    CoachName VARCHAR(100),
    FoundedYear YEAR NOT NULL,

    CONSTRAINT chk_founded_year 
    CHECK (FoundedYear >= 2000)
);

CREATE TABLE Players(
    PlayerID INT AUTO_INCREMENT PRIMARY KEY,

    PlayerName VARCHAR(100) NOT NULL,
    PlayerPosition VARCHAR(50) NOT NULL,

    JerseyNumber INT NOT NULL UNIQUE,

    PointsPerGame DECIMAL(5,2) DEFAULT 0,
    AssistsPerGame DECIMAL(5,2) DEFAULT 0,
    ReboundsPerGame DECIMAL(5,2) DEFAULT 0,

    TeamID INT NOT NULL,

    CONSTRAINT chk_jersey 
    CHECK (JerseyNumber BETWEEN 0 AND 99),

    CONSTRAINT chk_points 
    CHECK (PointsPerGame >= 0),

    CONSTRAINT chk_assists 
    CHECK (AssistsPerGame >= 0),

    CONSTRAINT chk_rebounds 
    CHECK (ReboundsPerGame >= 0),

    CONSTRAINT fk_players_team 
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Matches(
    MatchID INT AUTO_INCREMENT PRIMARY KEY,

    HomeTeamID INT NOT NULL,
    AwayTeamID INT NOT NULL,

    HomeScore INT DEFAULT 0,
    AwayScore INT DEFAULT 0,

    MatchDate DATE NOT NULL,

    CONSTRAINT chk_scores 
    CHECK (HomeScore >= 0 AND AwayScore >= 0),

    CONSTRAINT chk_different_teams 
    CHECK (HomeTeamID <> AwayTeamID),

    CONSTRAINT fk_home_team 
    FOREIGN KEY (HomeTeamID) REFERENCES Teams(TeamID)
    ON DELETE CASCADE,

    CONSTRAINT fk_away_team 
    FOREIGN KEY (AwayTeamID) REFERENCES Teams(TeamID)
    ON DELETE CASCADE
);

INSERT INTO Teams(TeamsName, City, CoachName, FoundedYear) VALUES
('Thunder City Hawks', 'Thunder City', 'James Carter', 2012),
('Riverfront Raptors', 'Riverfront', 'Michael Brown', 2010),
('Northshore Titans', 'Northshore', 'David Wilson', 2014),
('Metro Blaze', 'Metro City', 'Chris Johnson', 2011),
('Iron Valley Wolves', 'Iron Valley', 'Robert Smith', 2013),
('Skyline Comets', 'Skyline City', 'Daniel Moore', 2015),
('Harbor City Knights', 'Harbor City', 'Kevin White', 2008),
('Crimson Peak Bears', 'Crimson Peak', 'Brian Taylor', 2016),
('Solar Ridge Spartans', 'Solar Ridge', 'Jason Anderson', 2017),
('Emerald Bay Storm', 'Emerald Bay', 'Anthony Lewis', 2018);


INSERT INTO Players (PlayerName, PlayerPosition, JerseyNumber, PointsPerGame, AssistsPerGame, ReboundsPerGame, TeamID) VALUES
-- Team 1
('Isaac Morgan', 'Power Forward', 16, 15.2, 2.8, 8.1, 1),
('Evan Parker', 'Center', 28, 13.4, 1.5, 10.3, 1),
('Logan Phillips', 'Small Forward', 19, 16.7, 4.1, 6.2, 1),
('Cole Bennett', 'Shooting Guard', 23, 18.1, 5.3, 3.8, 1),
('Owen Simmons', 'Point Guard', 30, 14.9, 6.4, 2.9, 1),

-- Team 2
('Hunter Kelly', 'Power Forward', 17, 14.8, 2.7, 8.5, 2),
('Gavin Foster', 'Center', 29, 12.9, 1.4, 10.7, 2),
('Eli Price', 'Small Forward', 20, 17.2, 4.3, 6.4, 2),
('Austin Rivera', 'Shooting Guard', 26, 19.0, 5.1, 3.5, 2),
('Cameron Barnes', 'Point Guard', 31, 15.6, 6.8, 3.0, 2),

-- Team 3
('Landon Ross', 'Power Forward', 32, 15.0, 2.9, 8.0, 3),
('Tyson Gray', 'Center', 36, 13.1, 1.2, 11.0, 3),
('Blake Bell', 'Small Forward', 37, 16.4, 4.0, 6.6, 3),
('Jace Murphy', 'Shooting Guard', 38, 18.7, 5.2, 3.6, 3),
('Miles Cook', 'Point Guard', 39, 14.5, 6.7, 2.8, 3),

-- Team 4
('Dylan Bailey', 'Power Forward', 41, 15.7, 2.6, 8.7, 4),
('Nathan Cooper', 'Center', 42, 12.7, 1.3, 10.9, 4),
('Lucas Reed', 'Small Forward', 43, 17.0, 4.4, 6.0, 4),
('Ethan Howard', 'Shooting Guard', 46, 19.3, 5.0, 3.9, 4),
('Jack Peterson', 'Point Guard', 47, 15.8, 6.9, 3.1, 4),

-- Team 5
('Mason Brooks', 'Power Forward', 48, 14.9, 2.5, 8.8, 5),
('Connor Sanders', 'Center', 49, 13.0, 1.1, 11.3, 5),
('Aiden Jenkins', 'Small Forward', 51, 16.9, 4.1, 6.5, 5),
('Wyatt Perry', 'Shooting Guard', 52, 18.4, 5.4, 3.7, 5),
('Jason Watson', 'Point Guard', 53, 15.1, 6.3, 2.7, 5),

-- Team 6
('Brayden Flores', 'Power Forward', 54, 15.4, 2.7, 8.4, 6),
('Carson Hughes', 'Center', 56, 12.5, 1.0, 11.1, 6),
('Dominic Bryant', 'Small Forward', 57, 17.3, 4.2, 6.3, 6),
('Xavier Russell', 'Shooting Guard', 58, 18.8, 5.5, 3.4, 6),
('Adrian Griffin', 'Point Guard', 59, 15.9, 6.6, 2.9, 6),

-- Team 7
('Parker Diaz', 'Power Forward', 60, 14.7, 2.8, 8.2, 7),
('Brody Hayes', 'Center', 61, 13.2, 1.2, 10.8, 7),
('Colton Myers', 'Small Forward', 62, 16.6, 4.5, 6.7, 7),
('Preston Ford', 'Shooting Guard', 63, 18.2, 5.3, 3.5, 7),
('Roman Hamilton', 'Point Guard', 64, 15.3, 6.5, 3.0, 7),

-- Team 8
('Jaxon Graham', 'Power Forward', 65, 15.6, 2.9, 8.6, 8),
('Sawyer Sullivan', 'Center', 66, 12.8, 1.3, 11.4, 8),
('Finn Wallace', 'Small Forward', 67, 17.1, 4.1, 6.1, 8),
('Ryder Woods', 'Shooting Guard', 68, 19.1, 5.2, 3.8, 8),
('Dean Cole', 'Point Guard', 69, 15.7, 6.7, 2.8, 8),

-- Team 9
('Kai West', 'Power Forward', 70, 14.6, 2.4, 8.3, 9),
('Zane Freeman', 'Center', 71, 13.3, 1.1, 11.2, 9),
('Maddox Hart', 'Small Forward', 72, 16.8, 4.0, 6.4, 9),
('Asher Stone', 'Shooting Guard', 73, 18.6, 5.6, 3.6, 9),
('Silas Knight', 'Point Guard', 74, 15.2, 6.8, 3.1, 9),

-- Team 10
('Jude Spencer', 'Power Forward', 75, 15.5, 2.6, 8.5, 10),
('Beckett Warren', 'Center', 76, 12.6, 1.0, 11.5, 10),
('Kingston Porter', 'Small Forward', 77, 17.4, 4.3, 6.2, 10),
('Atlas Fisher', 'Shooting Guard', 78, 18.9, 5.1, 3.9, 10),
('Nolan Gardner', 'Point Guard', 79, 15.4, 6.4, 2.7, 10);

INSERT INTO Matches (HomeTeamID, AwayTeamID, HomeScore, AwayScore, MatchDate) VALUES
(1, 2, 102, 95, '2026-05-01'),
(3, 4, 98, 101, '2026-05-02'),
(5, 6, 110, 108, '2026-05-03'),
(7, 8, 96, 90, '2026-05-04'),
(9, 10, 105, 99, '2026-05-05'),

(2, 3, 112, 107, '2026-05-06'),
(4, 5, 94, 97, '2026-05-07'),
(6, 7, 101, 100, '2026-05-08'),
(8, 9, 89, 92, '2026-05-09'),
(10, 1, 103, 110, '2026-05-10'),

(1, 3, 108, 104, '2026-05-11'),
(2, 4, 99, 101, '2026-05-12'),
(5, 7, 111, 105, '2026-05-13'),
(6, 8, 95, 88, '2026-05-14'),
(9, 1, 102, 107, '2026-05-15'),

(3, 5, 97, 94, '2026-05-16'),
(4, 6, 106, 100, '2026-05-17'),
(7, 9, 91, 89, '2026-05-18'),
(8, 10, 104, 98, '2026-05-19'),
(2, 10, 109, 103, '2026-05-20');

