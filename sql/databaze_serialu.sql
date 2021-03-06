-- Adminer 4.7.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `adresa`;
CREATE TABLE `adresa` (
  `idAdresa` int(11) NOT NULL AUTO_INCREMENT,
  `zeme` varchar(100) DEFAULT NULL,
  `mesto` varchar(100) DEFAULT NULL,
  `ulice` varchar(100) DEFAULT NULL,
  `cisloPopisne` varchar(25) DEFAULT NULL,
  `psc` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idAdresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `adresa` (`idAdresa`, `zeme`, `mesto`, `ulice`, `cisloPopisne`, `psc`) VALUES
(1,	'Ireland',	'Cork',	'Bandon Rd',	'179/301',	'81370'),
(2,	'Czech Republic',	'Praha',	'Prokopakova',	'12/128',	'13000'),
(3,	'Czech Republic',	'Praha',	'Barandovská',	'13/1009',	'18000'),
(4,	'Czech Republic',	'Praha',	'Národní',	'1/1',	'10000'),
(5,	'Czech Republic',	'Brno',	'Vesnická',	'9/11',	'10580'),
(6,	'Czech Republic',	'Brno',	'U Orloje',	'11/9',	'10581'),
(7,	'Austria',	'Wien',	'Landstraße',	'881/22',	'20001'),
(8,	'Austria',	'Wien',	'Marxsergasse',	'91/63',	'20501'),
(9,	'Austria',	'Wien',	'Kolonitzgasse',	'12b/4',	'20041'),
(10,	'Germany',	'Berlin',	'Zimmerstraße',	'11c/203',	'30010'),
(11,	'Germany',	'Berlin',	'Mittelstraße',	'101/202',	'30110'),
(12,	'Germany',	'Berlin',	'Mittelstraße',	'101/202',	'30110'),
(13,	'Germany',	'Dresden',	'Carusufer',	'103/113',	'30110'),
(14,	'Germany',	'Dresden',	'Ostra-Allee',	'13/1005',	'30115'),
(15,	'Germany',	'Hamburk',	'Laufgraben',	'639/53',	'32115'),
(16,	'Spain',	'Madrid',	'Calle de Almagro',	'25/2',	'50215'),
(17,	'Spain',	'Madrid',	'Calle Sta. Feliciana',	'22/330',	'50215'),
(18,	'Spain',	'Madrid',	'Av del Santuario de Valverde',	'23/978',	'50250'),
(19,	'Luxembourg',	'Luxembourg',	'Boulevard Franklin Delano Roosevelt',	'25/473',	'60250'),
(20,	'United Kingdom',	'London',	'Tilney Gardens',	'1b/230',	'70250'),
(21,	'United Kingdom',	'London',	'Holloway Rd',	'191/302',	'70350'),
(22,	'United Kingdom',	'London',	'London Wall',	'11/637',	'70360'),
(23,	'Ireland',	'Dublin',	'Grand Canal Street Upper',	'66/777',	'80360'),
(24,	'Ireland',	'Dublin',	'Stephen\'s Ln',	'6c/11',	'80370');

DROP TABLE IF EXISTS `epizoda`;
CREATE TABLE `epizoda` (
  `idEpizoda` int(11) NOT NULL AUTO_INCREMENT,
  `cisloEpizody` int(11) DEFAULT NULL,
  `datumVysilani` date DEFAULT NULL,
  `nazev` varchar(100) DEFAULT NULL,
  `hodnoceni` double DEFAULT NULL,
  `popis` varchar(100) DEFAULT NULL,
  `dobaTrvani` time DEFAULT NULL,
  `serie_idSerie` int(11) NOT NULL,
  `reziser_idReziser` int(11) NOT NULL,
  PRIMARY KEY (`idEpizoda`) USING BTREE,
  KEY `reziser_idReziser` (`reziser_idReziser`),
  KEY `serie_idSerie` (`serie_idSerie`),
  CONSTRAINT `epizoda_reziser_idReziser_fk` FOREIGN KEY (`reziser_idReziser`) REFERENCES `reziser` (`idReziser`) ON UPDATE CASCADE,
  CONSTRAINT `epizoda_serie_idSerie_fk` FOREIGN KEY (`serie_idSerie`) REFERENCES `serie` (`idSerie`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `epizoda` (`idEpizoda`, `cisloEpizody`, `datumVysilani`, `nazev`, `hodnoceni`, `popis`, `dobaTrvani`, `serie_idSerie`, `reziser_idReziser`) VALUES
(1,	1,	'2016-06-01',	'V prach se obrátíš',	6,	NULL,	'00:45:09',	3,	1),
(2,	2,	'2016-06-08',	'My všichni',	7,	'',	'00:57:05',	3,	2),
(3,	3,	'2016-06-15',	'Nikdo nepřežil',	1,	'',	'01:04:47',	3,	3),
(4,	1,	'2015-08-26',	'Znovuzrození',	1,	'',	'01:03:02',	2,	4),
(5,	2,	'2015-09-02',	'Probuzení',	9,	'',	'00:53:18',	2,	5),
(6,	3,	'2015-09-09',	'Návrat Jediho',	9,	'',	'01:05:14',	2,	6),
(7,	1,	'2013-07-27',	'Přistání',	1,	'',	'00:47:15',	1,	7),
(8,	2,	'2013-08-03',	'Útočiště',	5,	'',	'00:59:11',	1,	6),
(9,	3,	'2013-08-10',	'Nepřítel je uvnitř',	0,	'',	'00:57:13',	1,	8),
(10,	1,	'2016-03-27',	'Konec roku',	0,	'',	'00:58:19',	6,	9),
(11,	2,	'2016-04-03',	'Spálený',	5,	'',	'00:56:21',	6,	1),
(12,	3,	'2016-04-10',	'Důvěřuj ale prověřuj',	1,	'',	'01:04:03',	6,	9),
(13,	4,	'2016-04-17',	'Vertigo',	7,	'',	'00:57:52',	6,	3),
(14,	1,	'2013-06-23',	'Šrámy',	4,	'',	'01:03:49',	5,	10),
(15,	2,	'2013-06-30',	'Odkaz',	9,	'',	'00:47:58',	5,	1),
(16,	3,	'2013-07-07',	'Ohnivá múza',	0,	'',	'00:50:14',	5,	11),
(17,	4,	'2013-07-14',	'Vendeta',	8,	'',	'01:05:42',	5,	12),
(18,	1,	'2010-05-17',	'Nový začátek',	5,	'',	'00:57:46',	4,	13),
(19,	2,	'2010-05-24',	'Cti otce svého',	6,	'',	'01:05:28',	4,	7),
(20,	3,	'2010-05-31',	'Osamělý střelec',	2,	'',	'00:49:37',	4,	1),
(21,	4,	'2010-06-07',	'Nevinný muž',	8,	'',	'00:47:39',	4,	1),
(22,	1,	'2015-07-22',	'Garden of Bones',	7,	'',	'00:49:40',	10,	6),
(23,	2,	'2015-07-29',	'The Ghost of Harrenhal',	5,	'',	'01:05:09',	10,	8),
(24,	3,	'2015-08-05',	'The Old Gods and the New',	1,	'',	'00:47:38',	10,	11),
(25,	4,	'2015-08-12',	'A Man Without Honor',	2,	'',	'00:53:27',	10,	1),
(26,	5,	'2015-08-19',	'The Prince of Winterfell',	9,	'',	'00:51:29',	10,	3),
(27,	1,	'2013-04-27',	'Fire and Blood',	3,	'',	'01:00:41',	9,	8),
(28,	2,	'2013-05-04',	'You Win or You Die Again',	3,	'',	'01:04:50',	9,	4),
(29,	3,	'2013-05-11',	'The North Remembers',	8,	'',	'01:05:13',	9,	6),
(30,	4,	'2013-05-18',	'The Night Lands',	9,	'',	'00:59:01',	9,	7),
(31,	5,	'2013-05-25',	'What Is Dead May Never Die',	1,	'',	'00:52:50',	9,	11),
(32,	1,	'2011-06-29',	'The Wolf and the Lion',	1,	'',	'00:46:29',	8,	1),
(33,	2,	'2011-07-06',	'A Golden Crown',	0,	'',	'01:02:38',	8,	8),
(34,	3,	'2011-07-13',	'You Win or You Die',	4,	'',	'00:46:47',	8,	4),
(35,	4,	'2011-07-20',	'The Pointy End',	5,	'',	'00:58:43',	8,	1),
(36,	5,	'2011-07-27',	'Baelor',	7,	'',	'01:04:32',	8,	7),
(37,	1,	'2009-06-02',	'Inside Game of Thrones',	6,	'',	'00:53:57',	7,	3),
(38,	2,	'2009-06-09',	'Winter is Coming',	3,	'',	'00:47:45',	7,	3),
(39,	3,	'2009-06-16',	'The Kingsroad',	9,	'',	'00:50:01',	7,	8),
(40,	4,	'2009-06-23',	'Lord Snow',	0,	'',	'00:48:04',	7,	9),
(41,	5,	'2009-06-30',	'Cripples, Bastards, and Broken Things',	0,	'',	'01:03:32',	7,	12);

DELIMITER ;;

CREATE TRIGGER `before_insert_on_epizoda` BEFORE INSERT ON `epizoda` FOR EACH ROW
BEGIN
  IF NEW.hodnoceni > 10 OR NEW.hodnoceni < 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Hodnoceni musi byt cislo od 0 do 10';
  END IF;
END;;

DELIMITER ;

DROP TABLE IF EXISTS `epizoda_has_lokalita`;
CREATE TABLE `epizoda_has_lokalita` (
  `epizoda_idEpizoda` int(11) NOT NULL,
  `lokalita_idLokalita` int(11) NOT NULL,
  KEY `epizoda_has_lokalita_epizoda_idEpizoda_fk` (`epizoda_idEpizoda`),
  KEY `epizoda_has_lokalita_lokalita_idLokalita_fk` (`lokalita_idLokalita`),
  CONSTRAINT `epizoda_has_lokalita_epizoda_idEpizoda_fk` FOREIGN KEY (`epizoda_idEpizoda`) REFERENCES `epizoda` (`idEpizoda`) ON UPDATE CASCADE,
  CONSTRAINT `epizoda_has_lokalita_lokalita_idLokalita_fk` FOREIGN KEY (`lokalita_idLokalita`) REFERENCES `lokalita` (`idLokalita`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `epizoda_has_lokalita` (`epizoda_idEpizoda`, `lokalita_idLokalita`) VALUES
(28,	78),
(13,	21),
(8,	53),
(29,	43),
(11,	55),
(16,	18),
(16,	68),
(33,	22),
(6,	53),
(38,	37),
(35,	23),
(17,	70),
(34,	74),
(5,	70),
(4,	34),
(35,	67),
(29,	72),
(19,	59),
(8,	38),
(18,	24),
(25,	29),
(7,	43),
(20,	27),
(10,	57),
(22,	3),
(28,	6),
(1,	63),
(11,	52),
(36,	81),
(7,	59),
(10,	67),
(26,	64),
(34,	18),
(33,	48),
(17,	66),
(41,	2),
(2,	74),
(2,	67),
(8,	59),
(8,	47),
(2,	77),
(40,	80),
(26,	27),
(9,	11),
(7,	49),
(13,	43),
(2,	41),
(32,	43),
(29,	77),
(7,	55),
(20,	24),
(36,	21),
(25,	36),
(12,	27),
(16,	49),
(36,	37),
(31,	69),
(32,	35),
(40,	53),
(25,	15),
(20,	36),
(8,	49),
(23,	20),
(17,	80),
(12,	7),
(36,	14),
(40,	38),
(5,	32),
(38,	12),
(16,	60),
(35,	61),
(1,	30),
(33,	69),
(38,	51),
(21,	46),
(32,	15),
(22,	43),
(15,	49),
(15,	21),
(9,	10),
(36,	14),
(4,	9),
(31,	44),
(20,	75),
(12,	29),
(10,	23),
(32,	62),
(21,	33),
(10,	65),
(41,	30),
(17,	58),
(28,	20),
(25,	23),
(1,	19),
(40,	57),
(4,	28),
(13,	78),
(40,	39),
(22,	15),
(2,	59);

DROP TABLE IF EXISTS `epizoda_has_postava`;
CREATE TABLE `epizoda_has_postava` (
  `epizoda_idEpizoda` int(11) NOT NULL,
  `postava_idPostava` int(11) NOT NULL,
  KEY `epizoda_idEpizoda` (`epizoda_idEpizoda`),
  KEY `postava_idPostava` (`postava_idPostava`),
  CONSTRAINT `epizoda_has_postava_epizoda_idEpizoda_fk` FOREIGN KEY (`epizoda_idEpizoda`) REFERENCES `epizoda` (`idEpizoda`) ON UPDATE CASCADE,
  CONSTRAINT `epizoda_has_postava_postava_idPostava_fk` FOREIGN KEY (`postava_idPostava`) REFERENCES `postava` (`idPostava`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `epizoda_has_postava` (`epizoda_idEpizoda`, `postava_idPostava`) VALUES
(28,	16),
(17,	58),
(21,	80),
(26,	49),
(18,	10),
(17,	6),
(26,	67),
(26,	36),
(22,	32),
(30,	2),
(21,	3),
(13,	48),
(33,	93),
(33,	3),
(13,	93),
(27,	97),
(39,	45),
(32,	35),
(33,	55),
(32,	52),
(11,	70),
(8,	87),
(31,	39),
(8,	39),
(1,	13),
(41,	93),
(35,	1),
(7,	66),
(6,	44),
(39,	46),
(14,	99),
(8,	32),
(5,	22),
(25,	88),
(17,	94),
(28,	85),
(26,	39),
(6,	50),
(9,	89),
(36,	51),
(6,	39),
(14,	94),
(12,	81),
(35,	95),
(5,	65),
(7,	60),
(34,	19),
(15,	60),
(11,	68),
(18,	49),
(27,	16),
(19,	30),
(14,	35),
(18,	38),
(39,	58),
(39,	76),
(29,	83),
(37,	43),
(34,	67),
(11,	23),
(31,	84),
(4,	68),
(17,	100),
(38,	79),
(15,	19),
(34,	44),
(32,	34),
(26,	96),
(32,	8),
(17,	36),
(1,	85),
(8,	15),
(38,	77),
(29,	40),
(26,	51),
(17,	49),
(10,	60),
(39,	31),
(28,	10),
(23,	83),
(17,	67),
(14,	77),
(12,	57),
(20,	71),
(2,	1),
(30,	87),
(8,	31),
(13,	16),
(3,	38),
(21,	15),
(1,	64),
(29,	36),
(38,	31),
(9,	22),
(7,	90),
(10,	71),
(9,	68),
(35,	85),
(36,	89),
(1,	81);

DROP TABLE IF EXISTS `epizoda_has_scenarista`;
CREATE TABLE `epizoda_has_scenarista` (
  `epizoda_idEpizoda` int(11) NOT NULL,
  `scenarista_idScenarista` int(11) NOT NULL,
  PRIMARY KEY (`epizoda_idEpizoda`,`scenarista_idScenarista`),
  KEY `fk_Epizoda_has_Scenarista_Scenarista1_idx` (`scenarista_idScenarista`),
  KEY `fk_Epizoda_has_Scenarista_Epizoda1_idx` (`epizoda_idEpizoda`),
  CONSTRAINT `fk_Epizoda_has_Scenarista_Epizoda1` FOREIGN KEY (`Epizoda_idEpizoda`) REFERENCES `epizoda` (`idEpizoda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Epizoda_has_Scenarista_Scenarista1` FOREIGN KEY (`Scenarista_idScenarista`) REFERENCES `scenarista` (`idScenarista`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `epizoda_has_scenarista` (`epizoda_idEpizoda`, `scenarista_idScenarista`) VALUES
(1,	16),
(1,	17),
(2,	15),
(3,	13),
(3,	14),
(4,	11),
(4,	12),
(5,	8),
(5,	10),
(6,	7),
(7,	5),
(7,	6),
(8,	3),
(8,	4),
(9,	1),
(9,	2),
(10,	6),
(10,	14),
(11,	8),
(12,	21),
(13,	5),
(13,	10),
(14,	2),
(14,	8),
(15,	19),
(15,	20),
(16,	17),
(17,	3),
(17,	6),
(18,	18),
(19,	5),
(19,	6),
(20,	3),
(21,	6),
(22,	2),
(23,	2),
(24,	5),
(24,	8),
(25,	1),
(25,	20),
(26,	22),
(27,	6),
(28,	8),
(28,	19),
(29,	20),
(30,	1),
(31,	2),
(31,	20),
(32,	2),
(32,	5),
(33,	5),
(33,	14),
(34,	2),
(35,	8),
(35,	19),
(36,	2),
(36,	14),
(37,	4),
(38,	2),
(38,	20),
(39,	6),
(39,	17),
(40,	20),
(41,	6);

DROP TABLE IF EXISTS `herec`;
CREATE TABLE `herec` (
  `idHerec` int(11) NOT NULL AUTO_INCREMENT,
  `osoba_idOsoba` int(11) NOT NULL,
  PRIMARY KEY (`idHerec`,`osoba_idOsoba`),
  KEY `fk_Herec_Osoba1_idx` (`osoba_idOsoba`),
  CONSTRAINT `fk_Herec_Osoba1` FOREIGN KEY (`osoba_idOsoba`) REFERENCES `osoba` (`idOsoba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `herec` (`idHerec`, `osoba_idOsoba`) VALUES
(1,	5),
(2,	15),
(3,	2),
(4,	6),
(5,	13),
(6,	13),
(7,	5),
(8,	3),
(9,	2),
(10,	7),
(11,	10),
(12,	5),
(13,	4),
(14,	1),
(15,	8),
(16,	12),
(17,	11),
(18,	2),
(19,	4),
(20,	12),
(21,	11),
(22,	5),
(23,	11),
(24,	2),
(25,	15),
(26,	3),
(27,	7),
(28,	10),
(29,	8),
(30,	2),
(31,	13),
(32,	13),
(33,	11),
(34,	2),
(35,	1),
(36,	3),
(37,	8),
(38,	10),
(39,	11),
(40,	9),
(41,	9),
(42,	11),
(43,	9),
(44,	2),
(45,	13),
(46,	13),
(47,	1),
(48,	10),
(49,	6),
(50,	15),
(51,	2),
(52,	3),
(53,	13),
(54,	9),
(55,	2),
(56,	3),
(57,	6),
(58,	11),
(59,	5),
(60,	11),
(61,	11),
(62,	10),
(63,	10),
(64,	2),
(65,	5),
(66,	7),
(67,	5),
(68,	13),
(69,	5),
(70,	2),
(71,	5),
(72,	2),
(73,	13),
(74,	2),
(75,	11),
(76,	13),
(77,	11),
(78,	8),
(79,	10),
(80,	8),
(81,	1),
(82,	11),
(83,	11),
(84,	13),
(85,	7),
(86,	7),
(87,	11),
(88,	12),
(89,	11),
(90,	6),
(91,	13),
(92,	7),
(93,	13),
(94,	10),
(95,	5),
(96,	6),
(97,	10),
(98,	5),
(99,	2),
(100,	7),
(101,	13),
(102,	11),
(103,	5),
(104,	9),
(105,	8),
(106,	5),
(107,	4),
(108,	13),
(109,	8),
(110,	4),
(111,	3),
(112,	12),
(113,	12),
(114,	1),
(115,	2),
(116,	11),
(117,	10),
(118,	12),
(119,	2),
(120,	6),
(121,	8),
(122,	1),
(123,	3),
(124,	7),
(125,	8),
(126,	13),
(127,	5),
(128,	2),
(129,	9),
(130,	6),
(131,	13),
(132,	9),
(133,	5),
(134,	13),
(135,	11),
(136,	5),
(137,	10),
(138,	8),
(139,	11),
(140,	9),
(141,	13),
(142,	1),
(143,	2),
(144,	11),
(145,	11),
(146,	13),
(147,	11),
(148,	13),
(149,	5),
(150,	9),
(151,	9),
(152,	10),
(153,	15),
(154,	5),
(155,	2),
(156,	13),
(157,	8),
(158,	11),
(159,	5),
(160,	5),
(161,	6),
(162,	12),
(163,	13),
(164,	13),
(165,	8),
(166,	8);

DROP TABLE IF EXISTS `lokalita`;
CREATE TABLE `lokalita` (
  `idLokalita` int(11) NOT NULL AUTO_INCREMENT,
  `pocasi` varchar(45) DEFAULT NULL,
  `cenaKc` int(11) DEFAULT NULL,
  `adresa_idAdresa` int(11) NOT NULL,
  PRIMARY KEY (`idLokalita`) USING BTREE,
  KEY `adresa_idAdresa` (`adresa_idAdresa`),
  CONSTRAINT `lokalita_adresa_idAdresa_fk` FOREIGN KEY (`adresa_idAdresa`) REFERENCES `adresa` (`idAdresa`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `lokalita` (`idLokalita`, `pocasi`, `cenaKc`, `adresa_idAdresa`) VALUES
(2,	'Zataženo',	1540227,	3),
(3,	'Polojasno',	1544962,	12),
(4,	'Polojasno',	3507414,	13),
(5,	'Mrholené',	4862590,	11),
(6,	'Slunečno',	5164894,	12),
(7,	'Slunečno',	1669412,	11),
(8,	'Zataženo',	1294758,	23),
(9,	'Slunečno',	2072631,	23),
(10,	'Mrholené',	3725066,	24),
(11,	'Mrholené',	2529490,	6),
(12,	'Polojasno',	3600771,	22),
(13,	'Mrholené',	4002832,	10),
(14,	'Slunečno',	3899472,	14),
(15,	'Slunečno',	4205027,	3),
(16,	'Mrholené',	1056534,	11),
(17,	'Zataženo',	5479536,	19),
(18,	'Slunečno',	4196346,	21),
(19,	'Polojasno',	1475443,	5),
(20,	'Mrholené',	5072784,	16),
(21,	'Mrholené',	2829229,	16),
(22,	'Mrholené',	4083454,	14),
(23,	'Polojasno',	5865543,	5),
(24,	'Mrholené',	4903381,	17),
(25,	'Polojasno',	3272455,	4),
(26,	'Polojasno',	5780323,	19),
(27,	'Slunečno',	1083343,	13),
(28,	'Zataženo',	3748264,	22),
(29,	'Slunečno',	2347726,	10),
(30,	'Zataženo',	4360133,	13),
(31,	'Mrholené',	2474368,	13),
(32,	'Slunečno',	1150418,	2),
(33,	'Zataženo',	3912319,	9),
(34,	'Mrholené',	5182955,	10),
(35,	'Polojasno',	1584942,	11),
(36,	'Slunečno',	4350949,	12),
(37,	'Slunečno',	5329988,	17),
(38,	'Zataženo',	3929293,	11),
(39,	'Polojasno',	3022475,	7),
(40,	'Polojasno',	2765652,	21),
(41,	'Zataženo',	4030286,	18),
(42,	'Polojasno',	4219412,	18),
(43,	'Mrholené',	1909913,	6),
(44,	'Zataženo',	5053153,	22),
(45,	'Mrholené',	1945158,	24),
(46,	'Mrholené',	4856791,	2),
(47,	'Polojasno',	3224788,	16),
(48,	'Slunečno',	5780823,	18),
(49,	'Polojasno',	1076669,	15),
(50,	'Slunečno',	4808282,	9),
(51,	'Mrholené',	3734546,	4),
(52,	'Zataženo',	5550803,	13),
(53,	'Zataženo',	2673442,	2),
(54,	'Zataženo',	3923784,	20),
(55,	'Zataženo',	3724611,	9),
(56,	'Polojasno',	5896706,	14),
(57,	'Mrholené',	4772418,	3),
(58,	'Polojasno',	3157834,	11),
(59,	'Slunečno',	1559640,	24),
(60,	'Zataženo',	3009103,	24),
(61,	'Slunečno',	4116495,	13),
(62,	'Slunečno',	1034765,	5),
(63,	'Mrholené',	5941473,	4),
(64,	'Mrholené',	4999530,	16),
(65,	'Slunečno',	5477162,	16),
(66,	'Slunečno',	4244282,	16),
(67,	'Polojasno',	1165711,	11),
(68,	'Zataženo',	3667058,	12),
(69,	'Mrholené',	1157328,	11),
(70,	'Slunečno',	4849670,	3),
(71,	'Slunečno',	3067694,	11),
(72,	'Zataženo',	4442381,	24),
(73,	'Mrholené',	4532360,	12),
(74,	'Zataženo',	3032979,	9),
(75,	'Zataženo',	3026478,	4),
(76,	'Mrholené',	1944942,	6),
(77,	'Zataženo',	4611059,	12),
(78,	'Polojasno',	5323460,	11),
(79,	'Polojasno',	2002422,	20),
(80,	'Zataženo',	2639473,	22),
(81,	'Mrholené',	1289423,	23),
(82,	'Polojasno',	5075156,	7);

DROP TABLE IF EXISTS `oceneni`;
CREATE TABLE `oceneni` (
  `idOceneni` int(11) NOT NULL AUTO_INCREMENT,
  `nazev` varchar(45) DEFAULT NULL,
  `popis` varchar(45) DEFAULT NULL,
  `rok` int(11) DEFAULT NULL,
  PRIMARY KEY (`idOceneni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `osoba`;
CREATE TABLE `osoba` (
  `idOsoba` int(11) NOT NULL AUTO_INCREMENT,
  `jmeno` varchar(45) DEFAULT NULL,
  `prijmeni` varchar(45) DEFAULT NULL,
  `narodnost` varchar(45) DEFAULT NULL,
  `datumNarozeni` datetime NOT NULL,
  PRIMARY KEY (`idOsoba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `osoba` (`idOsoba`, `jmeno`, `prijmeni`, `narodnost`, `datumNarozeni`) VALUES
(1,	'Reina',	'Spencer',	'Turks & Caicos',	'1991-10-26 00:00:00'),
(2,	'Hitomi',	'Perez',	'Croatia',	'1994-08-06 00:00:00'),
(3,	'Ernesto',	'Brooks',	'Saint Pierre &amp; Miquelon',	'1951-02-21 00:00:00'),
(4,	'Sandy',	'Vaughn',	'Iraq',	'1981-11-12 00:00:00'),
(5,	'Felix',	'Bradford',	'Saudi Arabia',	'1951-02-21 00:00:00'),
(6,	'Richard',	'Rutledge',	'Iran',	'1978-09-12 00:00:00'),
(7,	'Isaac',	'Robinson',	'Turks &amp; Caicos',	'1960-09-26 00:00:00'),
(8,	'Lee',	'Guerrero',	'Trinidad Tobago',	'1967-05-25 00:00:00'),
(9,	'Iris',	'Hooper',	'Morocco',	'1959-05-17 00:00:00'),
(10,	'Sally',	'Knowles',	'Uganda',	'1979-06-26 00:00:00'),
(11,	'Fabian',	'Nelson',	'Panama',	'1952-08-19 00:00:00'),
(12,	'Hitomi',	'Patel',	'Uruguay',	'1994-08-27 00:00:00'),
(13,	'Kirk',	'Whitaker',	'Sri Lanka',	'1965-11-23 00:00:00'),
(14,	'William',	'Murray',	'Brazil',	'1988-08-04 00:00:00'),
(15,	'Bret',	'Mcintosh',	'Nigeria',	'1943-07-19 00:00:00');

DELIMITER ;;

CREATE TRIGGER `before_insert_on_osoba` BEFORE INSERT ON `osoba` FOR EACH ROW
BEGIN
  IF NEW.datumNarozeni < '1900-01-01' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Minimalni povoleny datum narozeni je 1-1-1900';
  END IF;
END;;

DELIMITER ;

DROP TABLE IF EXISTS `osoba_has_oceneni`;
CREATE TABLE `osoba_has_oceneni` (
  `osoba_idOsoba` int(11) NOT NULL,
  `oceneni_idOceneni` int(11) NOT NULL,
  PRIMARY KEY (`osoba_idOsoba`,`oceneni_idOceneni`),
  KEY `fk_Osoba_has_Oceneni_Oceneni1_idx` (`oceneni_idOceneni`),
  KEY `fk_Osoba_has_Oceneni_Osoba1_idx` (`osoba_idOsoba`),
  CONSTRAINT `fk_Osoba_has_Oceneni_Oceneni1` FOREIGN KEY (`Oceneni_idOceneni`) REFERENCES `oceneni` (`idOceneni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Osoba_has_Oceneni_Osoba1` FOREIGN KEY (`Osoba_idOsoba`) REFERENCES `osoba` (`idOsoba`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `postava`;
CREATE TABLE `postava` (
  `idPostava` int(11) NOT NULL AUTO_INCREMENT,
  `jmeno` varchar(100) DEFAULT NULL,
  `prijmeni` varchar(100) DEFAULT NULL,
  `herec_idHerec` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPostava`),
  KEY `postava_herec_idHerec_fk` (`herec_idHerec`),
  CONSTRAINT `postava_herec_idHerec_fk` FOREIGN KEY (`herec_idHerec`) REFERENCES `herec` (`idHerec`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `postava` (`idPostava`, `jmeno`, `prijmeni`, `herec_idHerec`) VALUES
(1,	'Herman',	'Cooke',	90),
(2,	'Lavinia',	'Henry',	53),
(3,	'Warren',	'Carroll',	13),
(4,	'Zeph',	'Robertson',	15),
(5,	'Anne',	'Romero',	70),
(6,	'Hope',	'Langley',	15),
(7,	'Megan',	'Sims',	131),
(8,	'Uriel',	'Russo',	156),
(9,	'Cole',	'Chase',	78),
(10,	'Desiree',	'Moore',	27),
(11,	'Lesley',	'Mccarty',	136),
(12,	'Halee',	'Schneider',	41),
(13,	'Ashely',	'Mason',	128),
(14,	'Delilah',	'Mcmillan',	76),
(15,	'Nigel',	'Matthews',	159),
(16,	'Whoopi',	'Davis',	139),
(17,	'Eugenia',	'Burch',	150),
(18,	'Steel',	'Floyd',	41),
(19,	'Myles',	'Ross',	73),
(20,	'George',	'Pena',	3),
(21,	'Galena',	'Richardson',	3),
(22,	'Kermit',	'Ross',	116),
(23,	'Barrett',	'Gonzales',	118),
(24,	'Celeste',	'Holman',	111),
(25,	'Zorita',	'Hull',	100),
(26,	'Wynne',	'West',	149),
(27,	'Iola',	'Blair',	1),
(28,	'Pamela',	'Long',	149),
(29,	'Xanthus',	'Collier',	10),
(30,	'Aidan',	'Maxwell',	82),
(31,	'Blaine',	'Caldwell',	108),
(32,	'Nero',	'Mcgee',	29),
(33,	'Rose',	'Fulton',	38),
(34,	'Daquan',	'Boyd',	54),
(35,	'Isabelle',	'Franks',	97),
(36,	'Wendy',	'Lott',	18),
(37,	'Bryar',	'Baird',	104),
(38,	'Minerva',	'Brown',	156),
(39,	'Mercedes',	'Stewart',	104),
(40,	'Casey',	'Reeves',	141),
(41,	'Michael',	'Koch',	107),
(42,	'Nichole',	'Ball',	11),
(43,	'Dominic',	'Higgins',	30),
(44,	'Kelsie',	'Daugherty',	42),
(45,	'Yvonne',	'Kaufman',	13),
(46,	'Fredericka',	'Hodges',	138),
(47,	'Charlotte',	'Willis',	159),
(48,	'Melodie',	'Galloway',	144),
(49,	'Orson',	'Stevenson',	57),
(50,	'Rafael',	'Montoya',	131),
(51,	'Jade',	'Mclean',	61),
(52,	'Louis',	'Oneil',	21),
(53,	'Catherine',	'Harmon',	157),
(54,	'Lysandra',	'Mclaughlin',	141),
(55,	'Jesse',	'Glover',	75),
(56,	'Maia',	'Fletcher',	50),
(57,	'Regina',	'Harrington',	3),
(58,	'Winter',	'Hardy',	116),
(59,	'Fay',	'Knowles',	109),
(60,	'Glenna',	'Hensley',	133),
(61,	'Jamalia',	'Christensen',	2),
(62,	'Robin',	'Mckinney',	21),
(63,	'Jemima',	'William',	51),
(64,	'Libby',	'Talley',	82),
(65,	'Inga',	'Diaz',	99),
(66,	'Henry',	'Dodson',	18),
(67,	'Theodore',	'Macdonald',	89),
(68,	'Aline',	'Santana',	50),
(69,	'Darryl',	'Joseph',	122),
(70,	'Randall',	'Underwood',	27),
(71,	'Arthur',	'Faulkner',	105),
(72,	'Nina',	'Morrison',	46),
(73,	'Keely',	'Hinton',	158),
(74,	'Paloma',	'Spears',	46),
(75,	'Jasper',	'Carney',	16),
(76,	'Hamilton',	'Trujillo',	30),
(77,	'Kendall',	'Bridges',	96),
(78,	'Nichole',	'Small',	27),
(79,	'Harper',	'Lawson',	107),
(80,	'Carly',	'Bowman',	71),
(81,	'Baker',	'Cook',	99),
(82,	'Porter',	'English',	139),
(83,	'Jerry',	'Ryan',	17),
(84,	'Wing',	'Conrad',	119),
(85,	'Yolanda',	'Roman',	33),
(86,	'Caesar',	'Barry',	58),
(87,	'Tamara',	'Henderson',	5),
(88,	'Elton',	'Velazquez',	150),
(89,	'Hadley',	'Alford',	162),
(90,	'Lester',	'Guerrero',	22),
(91,	'Frances',	'Monroe',	138),
(92,	'Quamar',	'Lowe',	157),
(93,	'Adrian',	'Hinton',	27),
(94,	'Lance',	'Deleon',	51),
(95,	'Emma',	'Mayer',	22),
(96,	'Blake',	'Beard',	94),
(97,	'Madeson',	'Austin',	94),
(98,	'Arden',	'Pugh',	131),
(99,	'Teegan',	'Donovan',	109),
(100,	'Paul',	'Chase',	86);

DROP TABLE IF EXISTS `reziser`;
CREATE TABLE `reziser` (
  `idReziser` int(11) NOT NULL AUTO_INCREMENT,
  `osoba_idOsoba` int(11) NOT NULL,
  PRIMARY KEY (`idReziser`) USING BTREE,
  KEY `reziser_osoba_idOsoba_fk` (`osoba_idOsoba`),
  CONSTRAINT `reziser_osoba_idOsoba_fk` FOREIGN KEY (`Osoba_idOsoba`) REFERENCES `osoba` (`idOsoba`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `reziser` (`idReziser`, `osoba_idOsoba`) VALUES
(3,	1),
(7,	2),
(2,	3),
(11,	4),
(9,	5),
(5,	6),
(4,	7),
(12,	8),
(8,	9),
(13,	10),
(1,	11),
(10,	12),
(6,	13);

DROP TABLE IF EXISTS `scenarista`;
CREATE TABLE `scenarista` (
  `idScenarista` int(11) NOT NULL AUTO_INCREMENT,
  `prumPocetStran` int(11) DEFAULT NULL,
  `osoba_idOsoba` int(11) NOT NULL,
  PRIMARY KEY (`idScenarista`,`osoba_idOsoba`),
  KEY `fk_Scenarista_Osoba1_idx` (`osoba_idOsoba`),
  CONSTRAINT `fk_Scenarista_Osoba1` FOREIGN KEY (`Osoba_idOsoba`) REFERENCES `osoba` (`idOsoba`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `scenarista` (`idScenarista`, `prumPocetStran`, `osoba_idOsoba`) VALUES
(1,	27,	9),
(2,	15,	6),
(3,	13,	7),
(4,	36,	5),
(5,	42,	4),
(6,	26,	10),
(7,	14,	4),
(8,	42,	2),
(10,	20,	14),
(11,	40,	9),
(12,	8,	10),
(13,	30,	7),
(14,	49,	3),
(15,	23,	14),
(16,	48,	9),
(17,	35,	13),
(18,	8,	15),
(19,	46,	1),
(20,	28,	11),
(21,	23,	11),
(22,	22,	8);

DROP TABLE IF EXISTS `serial`;
CREATE TABLE `serial` (
  `idSerial` int(11) NOT NULL AUTO_INCREMENT,
  `nazev` varchar(45) DEFAULT NULL,
  `datumZahajeni` datetime DEFAULT NULL,
  `popis` varchar(250) DEFAULT NULL,
  `spolecnost_idSpolecnost` int(11) NOT NULL,
  PRIMARY KEY (`idSerial`,`spolecnost_idSpolecnost`),
  KEY `fk_Serial_Spolecnost1_idx` (`spolecnost_idSpolecnost`),
  CONSTRAINT `fk_Serial_Spolecnost1` FOREIGN KEY (`Spolecnost_idSpolecnost`) REFERENCES `spolecnost` (`idSpolecnost`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `serial` (`idSerial`, `nazev`, `datumZahajeni`, `popis`, `spolecnost_idSpolecnost`) VALUES
(1,	'The 100',	'2013-07-20 20:00:00',	'Lidstvo bylo zničeno nukleární válkou, která vyhubila téměř vše živé na planetě. Nyní skoro po sto letech je vyslána expedice čítající stovku mladistvých delikventů, aby zjistili jestli je Země znovu obyvatelná.',	1),
(2,	'Arrow',	'2010-05-10 20:00:00',	'Spravedlnost nikdy nemine svůj cíl! V adaptaci komiksové předlohy z dílny DC Comics.',	1),
(3,	'Game of Thrones',	'2009-05-26 22:00:00',	'Kontinent, kde léta trvají desítky roků a zimy se mohou protáhnout na celý lidský život, začínají sužovat nepokoje.',	2);

DROP TABLE IF EXISTS `serial_has_oceneni`;
CREATE TABLE `serial_has_oceneni` (
  `serial_idSerial` int(11) NOT NULL,
  `oceneni_idOceneni` int(11) NOT NULL,
  PRIMARY KEY (`serial_idSerial`,`oceneni_idOceneni`),
  KEY `fk_Serial_has_Oceneni_Oceneni1_idx` (`oceneni_idOceneni`),
  KEY `fk_Serial_has_Oceneni_Serial1_idx` (`serial_idSerial`),
  CONSTRAINT `fk_Serial_has_Oceneni_Oceneni1` FOREIGN KEY (`Oceneni_idOceneni`) REFERENCES `oceneni` (`idOceneni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Serial_has_Oceneni_Serial1` FOREIGN KEY (`Serial_idSerial`) REFERENCES `serial` (`idSerial`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `serial_has_zanr`;
CREATE TABLE `serial_has_zanr` (
  `serial_idSerial` int(11) NOT NULL,
  `zanr_idZanr` int(11) NOT NULL,
  KEY `serial_has_zanr_serial_idSerial_fk` (`serial_idSerial`),
  KEY `serial_has_zanr_zanr_idZanr_fk` (`zanr_idZanr`),
  CONSTRAINT `serial_has_zanr_serial_idSerial_fk` FOREIGN KEY (`serial_idSerial`) REFERENCES `serial` (`idSerial`) ON UPDATE CASCADE,
  CONSTRAINT `serial_has_zanr_zanr_idZanr_fk` FOREIGN KEY (`zanr_idZanr`) REFERENCES `zanr` (`idZanr`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `serial_has_zanr` (`serial_idSerial`, `zanr_idZanr`) VALUES
(1,	1),
(1,	2),
(2,	4),
(3,	1),
(3,	2),
(3,	3),
(3,	4);

DROP TABLE IF EXISTS `serie`;
CREATE TABLE `serie` (
  `idSerie` int(11) NOT NULL AUTO_INCREMENT,
  `cisloSerie` int(11) DEFAULT NULL,
  `datumZahajeni` datetime DEFAULT NULL,
  `serial_idSerial` int(11) NOT NULL,
  PRIMARY KEY (`idSerie`) USING BTREE,
  KEY `Serial_idSerial` (`serial_idSerial`),
  CONSTRAINT `serie_serial_idSerial_fk` FOREIGN KEY (`serial_idSerial`) REFERENCES `serial` (`idSerial`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `serie` (`idSerie`, `cisloSerie`, `datumZahajeni`, `serial_idSerial`) VALUES
(1,	1,	'2013-07-20 20:00:00',	1),
(2,	2,	'2015-08-19 21:30:00',	1),
(3,	3,	'2016-05-25 17:00:00',	1),
(4,	1,	'2010-05-10 20:00:00',	2),
(5,	2,	'2013-06-16 19:00:00',	2),
(6,	3,	'2016-03-20 20:00:00',	2),
(7,	1,	'2009-05-26 22:00:00',	3),
(8,	2,	'2011-06-22 21:30:00',	3),
(9,	3,	'2013-04-20 20:00:00',	3),
(10,	4,	'2015-07-15 19:00:00',	3);

DROP TABLE IF EXISTS `spolecnost`;
CREATE TABLE `spolecnost` (
  `idSpolecnost` int(11) NOT NULL AUTO_INCREMENT,
  `nazev` varchar(45) DEFAULT NULL,
  `adresa_idAdresa` int(11) NOT NULL,
  PRIMARY KEY (`idSpolecnost`,`adresa_idAdresa`),
  KEY `fk_Spolecnost_Adresa1_idx` (`adresa_idAdresa`),
  CONSTRAINT `fk_Spolecnost_Adresa1` FOREIGN KEY (`Adresa_idAdresa`) REFERENCES `adresa` (`idAdresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `spolecnost` (`idSpolecnost`, `nazev`, `adresa_idAdresa`) VALUES
(1,	'HPO',	2),
(2,	'Qwert',	15);

DROP TABLE IF EXISTS `zanr`;
CREATE TABLE `zanr` (
  `idZanr` int(11) NOT NULL AUTO_INCREMENT,
  `nazev` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idZanr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `zanr` (`idZanr`, `nazev`) VALUES
(1,	'Drama'),
(2,	'Komedie'),
(3,	'Western'),
(4,	'Historický'),
(6,	'Válečný'),
(7,	'Sci-fi');

-- 2020-04-25 16:43:51
