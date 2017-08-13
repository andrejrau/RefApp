-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 13. Aug 2017 um 21:17
-- Server-Version: 10.1.23-MariaDB-9+deb9u1
-- PHP-Version: 7.0.19-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `projekte_ref_app`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `arbeitsmaterialien`
--

CREATE TABLE `arbeitsmaterialien` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `link` varchar(250) NOT NULL,
  `klasse_fach_id` int(11) NOT NULL,
  `schule_id` int(11) NOT NULL,
  `lehrer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fach`
--

CREATE TABLE `fach` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `beschreibung` varchar(250) NOT NULL,
  `schule_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `klasse`
--

CREATE TABLE `klasse` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `klassennummer` varchar(10) NOT NULL,
  `schule_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `klassenarbeit`
--

CREATE TABLE `klassenarbeit` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `thema` varchar(250) NOT NULL,
  `datum` date NOT NULL,
  `klasse_fach_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `klasse_fach`
--

CREATE TABLE `klasse_fach` (
  `id` int(11) NOT NULL,
  `klasse_id` int(11) NOT NULL,
  `fach_id` int(11) NOT NULL,
  `lehrer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lehrer`
--

CREATE TABLE `lehrer` (
  `id` int(11) NOT NULL,
  `vorname` varchar(50) NOT NULL,
  `nachname` varchar(50) NOT NULL,
  `telefonnummer` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `passwort` varchar(255) NOT NULL,
  `mentor` tinyint(1) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `lehrer`
--

INSERT INTO `lehrer` (`id`, `vorname`, `nachname`, `telefonnummer`, `email`, `passwort`, `mentor`, `created`, `modified`) VALUES
(1, 'Andrej', 'Rau', '0000000000', 'rau.andrej@web.de', '', 1, '2017-08-12 22:36:28', '2017-08-12 22:36:28'),
(2, 'Andrej', 'Rau', '0000000000', 'rau.andrej2@web.de', '$2y$10$7TWDaB/LBAeCFrM0H1/cf.hetFd7nUdS7ZSy/JFQRaJHTCzraCw82', 1, '2017-08-13 00:05:40', '2017-08-13 00:05:40'),
(3, 'Andrej', 'Rau', '0000000000', 'rau.andrej3@web.de', '$2y$10$ntf9YYRxXHczRB5OaF2tPuhv3wN1.zf4yxSbp.Wgr2ng.5VnimtW6', 0, '2017-08-13 00:07:24', '2017-08-13 00:07:24');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `muendliche_note`
--

CREATE TABLE `muendliche_note` (
  `id` int(11) NOT NULL,
  `note` varchar(50) NOT NULL,
  `schueler_id` int(11) NOT NULL,
  `klasse_fach_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `note`
--

CREATE TABLE `note` (
  `id` int(11) NOT NULL,
  `schueler_id` int(11) NOT NULL,
  `klassenarbeit_id` int(11) NOT NULL,
  `note` tinyint(2) NOT NULL,
  `abwesend` tinyint(1) NOT NULL,
  `bemerkung` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ort`
--

CREATE TABLE `ort` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schueler`
--

CREATE TABLE `schueler` (
  `id` int(11) NOT NULL,
  `klasse_id` int(11) NOT NULL,
  `vorname` varchar(50) NOT NULL,
  `nachname` varchar(50) NOT NULL,
  `telefonnummer` int(11) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schule`
--

CREATE TABLE `schule` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schulform`
--

CREATE TABLE `schulform` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `schule_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `termin`
--

CREATE TABLE `termin` (
  `id` int(11) NOT NULL,
  `datum` date NOT NULL,
  `beschreibung` varchar(250) NOT NULL,
  `ort_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `arbeitsmaterialien`
--
ALTER TABLE `arbeitsmaterialien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fach_id` (`klasse_fach_id`),
  ADD KEY `schule_id` (`schule_id`),
  ADD KEY `lehrer_id` (`lehrer_id`);

--
-- Indizes für die Tabelle `fach`
--
ALTER TABLE `fach`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schule_id` (`schule_id`);

--
-- Indizes für die Tabelle `klasse`
--
ALTER TABLE `klasse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schule_id` (`schule_id`);

--
-- Indizes für die Tabelle `klassenarbeit`
--
ALTER TABLE `klassenarbeit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `klasse_fach_id` (`klasse_fach_id`);

--
-- Indizes für die Tabelle `klasse_fach`
--
ALTER TABLE `klasse_fach`
  ADD PRIMARY KEY (`id`),
  ADD KEY `klasse_id` (`klasse_id`),
  ADD KEY `fach_id` (`fach_id`),
  ADD KEY `lehrer_id` (`lehrer_id`);

--
-- Indizes für die Tabelle `lehrer`
--
ALTER TABLE `lehrer`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `muendliche_note`
--
ALTER TABLE `muendliche_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schueler_id` (`schueler_id`),
  ADD KEY `klasse_fach_id` (`klasse_fach_id`),
  ADD KEY `klasse_fach_id_2` (`klasse_fach_id`);

--
-- Indizes für die Tabelle `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schueler_id` (`schueler_id`),
  ADD KEY `klassenarbeit_id` (`klassenarbeit_id`);

--
-- Indizes für die Tabelle `ort`
--
ALTER TABLE `ort`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `schueler`
--
ALTER TABLE `schueler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `klasse_id` (`klasse_id`);

--
-- Indizes für die Tabelle `schule`
--
ALTER TABLE `schule`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `schulform`
--
ALTER TABLE `schulform`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schule_id` (`schule_id`);

--
-- Indizes für die Tabelle `termin`
--
ALTER TABLE `termin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ort_id` (`ort_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `arbeitsmaterialien`
--
ALTER TABLE `arbeitsmaterialien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `fach`
--
ALTER TABLE `fach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `klasse`
--
ALTER TABLE `klasse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `klassenarbeit`
--
ALTER TABLE `klassenarbeit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `klasse_fach`
--
ALTER TABLE `klasse_fach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `lehrer`
--
ALTER TABLE `lehrer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `muendliche_note`
--
ALTER TABLE `muendliche_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `note`
--
ALTER TABLE `note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `ort`
--
ALTER TABLE `ort`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `schueler`
--
ALTER TABLE `schueler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `schule`
--
ALTER TABLE `schule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `schulform`
--
ALTER TABLE `schulform`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `termin`
--
ALTER TABLE `termin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `arbeitsmaterialien`
--
ALTER TABLE `arbeitsmaterialien`
  ADD CONSTRAINT `arbeitsmaterialien_ibfk_1` FOREIGN KEY (`klasse_fach_id`) REFERENCES `klasse_fach` (`id`),
  ADD CONSTRAINT `arbeitsmaterialien_ibfk_3` FOREIGN KEY (`lehrer_id`) REFERENCES `lehrer` (`id`),
  ADD CONSTRAINT `arbeitsmaterialien_ibfk_4` FOREIGN KEY (`schule_id`) REFERENCES `schule` (`id`);

--
-- Constraints der Tabelle `fach`
--
ALTER TABLE `fach`
  ADD CONSTRAINT `fach_ibfk_1` FOREIGN KEY (`schule_id`) REFERENCES `schule` (`id`);

--
-- Constraints der Tabelle `klasse`
--
ALTER TABLE `klasse`
  ADD CONSTRAINT `klasse_ibfk_1` FOREIGN KEY (`schule_id`) REFERENCES `schule` (`id`);

--
-- Constraints der Tabelle `klassenarbeit`
--
ALTER TABLE `klassenarbeit`
  ADD CONSTRAINT `klassenarbeit_ibfk_1` FOREIGN KEY (`klasse_fach_id`) REFERENCES `klasse_fach` (`id`);

--
-- Constraints der Tabelle `klasse_fach`
--
ALTER TABLE `klasse_fach`
  ADD CONSTRAINT `klasse_fach_ibfk_1` FOREIGN KEY (`klasse_id`) REFERENCES `klasse` (`id`),
  ADD CONSTRAINT `klasse_fach_ibfk_2` FOREIGN KEY (`fach_id`) REFERENCES `fach` (`id`),
  ADD CONSTRAINT `klasse_fach_ibfk_3` FOREIGN KEY (`lehrer_id`) REFERENCES `lehrer` (`id`);

--
-- Constraints der Tabelle `muendliche_note`
--
ALTER TABLE `muendliche_note`
  ADD CONSTRAINT `muendliche_note_ibfk_1` FOREIGN KEY (`schueler_id`) REFERENCES `schueler` (`id`),
  ADD CONSTRAINT `muendliche_note_ibfk_2` FOREIGN KEY (`klasse_fach_id`) REFERENCES `klasse_fach` (`id`);

--
-- Constraints der Tabelle `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`schueler_id`) REFERENCES `schueler` (`id`),
  ADD CONSTRAINT `note_ibfk_2` FOREIGN KEY (`klassenarbeit_id`) REFERENCES `klassenarbeit` (`id`);

--
-- Constraints der Tabelle `schueler`
--
ALTER TABLE `schueler`
  ADD CONSTRAINT `schueler_ibfk_1` FOREIGN KEY (`klasse_id`) REFERENCES `klasse` (`id`);

--
-- Constraints der Tabelle `schulform`
--
ALTER TABLE `schulform`
  ADD CONSTRAINT `schulform_ibfk_1` FOREIGN KEY (`schule_id`) REFERENCES `schule` (`id`);

--
-- Constraints der Tabelle `termin`
--
ALTER TABLE `termin`
  ADD CONSTRAINT `termin_ibfk_1` FOREIGN KEY (`ort_id`) REFERENCES `termin` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
