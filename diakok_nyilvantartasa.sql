-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1:3307
-- Létrehozás ideje: 2026. Okt 01. 11:14
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `diakok_nyilvantartasa`
--

CREATE DATABASE diakok_nyilvantartasa
DEFAULT CHARACTER SET utf8
COLLATE utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `diakok`
--

CREATE TABLE `diakok` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `osztaly_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `diakok`
--

INSERT INTO `diakok` (`id`, `nev`, `email`, `osztaly_id`) VALUES
(1, 'Kovács Bence', 'kovacs.bence@gmail.com', 1),
(2, 'Nagy Anna', 'nagy.anna@gmail.com', 1),
(3, 'Tóth Dávid', 'toth.david@gmail.com', 2),
(4, 'Szabó Lili', 'szabo.lili@gmail.com', 2),
(5, 'Horváth Máté', 'horvath.mate@gmail.com', 3),
(6, 'Varga Emma', 'varga.emma@gmail.com', 3),
(7, 'Kiss Ádám', 'kiss.adam@gmail.com', 4),
(8, 'Molnár Réka', 'molnar.reka@gmail.com', 4),
(9, 'Németh Levente', 'nemeth.levente@gmail.com', 5),
(10, 'Farkas Zsófia', 'farkas.zsofia@gmail.com', 5),
(11, 'Balogh Gergő', 'balogh.gergo@gmail.com', 6),
(12, 'Lakatos Dóra', 'lakatos.dora@gmail.com', 6),
(13, 'Takács Márk', 'takacs.mark@gmail.com', 7),
(14, 'Juhász Petra', 'juhasz.petra@gmail.com', 7),
(15, 'Mészáros Tamás', 'meszaros.tamas@gmail.com', 8),
(16, 'Oláh Eszter', 'olah.eszter@gmail.com', 8),
(17, 'Papp Zoltán', 'papp.zoltan@gmail.com', 9),
(18, 'Rácz Laura', 'racz.laura@gmail.com', 9),
(19, 'Simon András', 'simon.andras@gmail.com', 10),
(20, 'Kelemen Nóra', 'kelemen.nora@gmail.com', 10);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `osztalyok`
--

CREATE TABLE `osztalyok` (
  `id` int(11) NOT NULL,
  `nev` varchar(50) NOT NULL,
  `szak` varchar(100) NOT NULL,
  `evfolyam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `osztalyok`
--

INSERT INTO `osztalyok` (`id`, `nev`, `szak`, `evfolyam`) VALUES
(1, '9.A', 'Informatika', 9),
(2, '9.B', 'Gépészet', 9),
(3, '9.C', 'Kereskedelem', 9),
(4, '10.A', 'Informatika', 10),
(5, '10.B', 'Gépészet', 10),
(6, '10.C', 'Kereskedelem', 10),
(7, '11.A', 'Informatika', 11),
(8, '11.B', 'Gépészet', 11),
(9, '12.A', 'Informatika', 12),
(10, '12.B', 'Kereskedelem', 12);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `diakok`
--
ALTER TABLE `diakok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_diakok_osztalyok` (`osztaly_id`);

--
-- A tábla indexei `osztalyok`
--
ALTER TABLE `osztalyok`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `diakok`
--
ALTER TABLE `diakok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `osztalyok`
--
ALTER TABLE `osztalyok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `diakok`
--
ALTER TABLE `diakok`
  ADD CONSTRAINT `fk_diakok_osztalyok` FOREIGN KEY (`osztaly_id`) REFERENCES `osztalyok` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
