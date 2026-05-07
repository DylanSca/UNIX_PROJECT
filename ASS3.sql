-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               12.2.2-MariaDB - MariaDB Server
-- Server OS:                    Win64
-- HeidiSQL Version:             12.16.0.7229
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table ass3.players
CREATE TABLE IF NOT EXISTS `players` (
  `PlayerID` int(2) NOT NULL,
  `PlayerName` varchar(50) NOT NULL,
  `TeamName` varchar(50) NOT NULL,
  `Position` char(2) NOT NULL,
  `PPG` int(11) NOT NULL,
  `ASG` int(11) NOT NULL,
  `RPG` int(11) NOT NULL,
  PRIMARY KEY (`PlayerID`),
  KEY `F1` (`TeamName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci COMMENT='This table holds all the top ';

-- Dumping data for table ass3.players: ~50 rows (approximately)
INSERT INTO `players` (`PlayerID`, `PlayerName`, `TeamName`, `Position`, `PPG`, `ASG`, `RPG`) VALUES
	(1, 'Ethan Cole', 'Titans', 'PG', 28, 9, 5),
	(2, 'Marcus Reed', 'Titans', 'SG', 24, 5, 4),
	(3, 'Tyler Nash', 'Titans', 'SF', 18, 4, 7),
	(4, 'Jordan Miles', 'Titans', 'PF', 15, 3, 9),
	(5, 'Liam Brooks', 'Titans', 'C', 12, 2, 11),
	(6, 'Ryan Holt', 'Wolves', 'PG', 26, 10, 4),
	(7, 'Chris Dean', 'Wolves', 'SG', 22, 4, 3),
	(8, 'Aiden Ross', 'Wolves', 'SF', 17, 3, 6),
	(9, 'Logan Price', 'Wolves', 'PF', 14, 2, 8),
	(10, 'Nathan King', 'Wolves', 'C', 11, 1, 10),
	(11, 'Mason Clarke', 'Blizzard', 'PG', 31, 11, 5),
	(12, 'Isaac Bell', 'Blizzard', 'SG', 27, 6, 4),
	(13, 'Hunter Gray', 'Blizzard', 'SF', 21, 5, 8),
	(14, 'Caleb Stone', 'Blizzard', 'PF', 16, 2, 10),
	(15, 'Connor White', 'Blizzard', 'C', 13, 1, 12),
	(16, 'Brandon Scott', 'Falcons', 'PG', 20, 7, 3),
	(17, 'Jason Ward', 'Falcons', 'SG', 19, 4, 3),
	(18, 'Kevin Hill', 'Falcons', 'SF', 15, 3, 5),
	(19, 'Dylan Cox', 'Falcons', 'PF', 11, 2, 7),
	(20, 'Aaron Long', 'Falcons', 'C', 9, 1, 9),
	(21, 'Zach Perry', 'Lynx', 'PG', 23, 8, 4),
	(22, 'Owen Hughes', 'Lynx', 'SG', 20, 4, 2),
	(23, 'Blake Russell', 'Lynx', 'SF', 16, 3, 6),
	(24, 'Trevor Cook', 'Lynx', 'PF', 13, 2, 8),
	(25, 'Adam Murphy', 'Lynx', 'C', 10, 1, 10),
	(26, 'Evan Fisher', 'Storm', 'PG', 17, 6, 3),
	(27, 'Justin Powell', 'Storm', 'SG', 15, 3, 2),
	(28, 'Cameron Barnes', 'Storm', 'SF', 14, 2, 5),
	(29, 'Eric Simmons', 'Storm', 'PF', 12, 2, 7),
	(30, 'Patrick Bryant', 'Storm', 'C', 8, 1, 9),
	(31, 'Gavin Peterson', 'Warriors', 'PG', 29, 10, 5),
	(32, 'Austin Kelly', 'Warriors', 'SG', 25, 5, 4),
	(33, 'Chase Sanders', 'Warriors', 'SF', 19, 4, 7),
	(34, 'Ian Richardson', 'Warriors', 'PF', 16, 3, 9),
	(35, 'Colin Cooper', 'Warriors', 'C', 12, 1, 11),
	(36, 'Bentley Flores', 'Mariners', 'PG', 13, 5, 2),
	(37, 'Victor Coleman', 'Mariners', 'SG', 11, 2, 2),
	(38, 'Ryder Butler', 'Mariners', 'SF', 10, 2, 4),
	(39, 'Spencer Henderson', 'Mariners', 'PF', 9, 1, 6),
	(40, 'Joel Griffin', 'Mariners', 'C', 7, 1, 8),
	(41, 'Dominic Myers', 'Royals', 'PG', 24, 9, 4),
	(42, 'Max Powell', 'Royals', 'SG', 21, 5, 3),
	(43, 'Tanner Rivera', 'Royals', 'SF', 18, 4, 6),
	(44, 'Grant Peterson', 'Royals', 'PF', 15, 2, 8),
	(45, 'Brody Jenkins', 'Royals', 'C', 11, 1, 10),
	(46, 'Xavier Brooks', 'Hawks', 'PG', 19, 7, 3),
	(47, 'Diego Sanders', 'Hawks', 'SG', 17, 3, 2),
	(48, 'Tristan Perry', 'Hawks', 'SF', 14, 2, 5),
	(49, 'Hayden Ross', 'Hawks', 'PF', 12, 2, 7),
	(50, 'Micah Ward', 'Hawks', 'C', 9, 1, 9);

-- Dumping structure for table ass3.teams
CREATE TABLE IF NOT EXISTS `teams` (
  `TeamID` smallint(2) NOT NULL,
  `TeamName` varchar(50) NOT NULL DEFAULT '',
  `City` varchar(50) NOT NULL DEFAULT '',
  `Coach` varchar(50) NOT NULL DEFAULT '',
  `TeamSponsor` varchar(50) DEFAULT '',
  `Wins` smallint(2) NOT NULL DEFAULT 0,
  `Losses` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`TeamName`,`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci COMMENT='This table holds the names of all teams in the league';

-- Dumping data for table ass3.teams: ~10 rows (approximately)
INSERT INTO `teams` (`TeamID`, `TeamName`, `City`, `Coach`, `TeamSponsor`, `Wins`, `Losses`) VALUES
	(3, 'Blizzard', 'Montreal', 'Alex Tremblay', 'Polar Tech', 61, '21'),
	(4, 'Falcons', 'Calgary', 'Chris Bennett', NULL, 39, '43'),
	(10, 'Hawks', 'Saskatoon', 'Tyler King', NULL, 41, '41'),
	(5, 'Lynx', 'Ottawa', 'Daniel Moore', 'Capital Bank', 44, '38'),
	(8, 'Mariners', 'Halifax', 'Liam Foster', NULL, 28, '54'),
	(9, 'Royals', 'Quebec City', 'Marc Gagnon', 'Royal Foods', 49, '33'),
	(6, 'Storm', 'Edmonton', 'Nathan Reed', NULL, 33, '49'),
	(1, 'Titans', 'Toronto', 'James Carter', 'Maple Sports', 52, '30'),
	(7, 'Warriors', 'Winnipeg', 'Ethan Scott', 'Northern Steel', 56, '26'),
	(2, 'Wolves', 'Vancouver', 'Ryan Brooks', NULL, 47, '35');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
