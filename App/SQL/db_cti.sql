-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-03-2022 a las 05:54:32
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_cti`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_computersonsale`
--

CREATE TABLE `tbl_computersonsale` (
  `id` int(11) NOT NULL,
  `trademark` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `id_processor` int(11) DEFAULT NULL,
  `ram` varchar(15) DEFAULT NULL,
  `graphics` varchar(25) DEFAULT NULL,
  `id_disk` int(11) DEFAULT NULL,
  `capacity_disk` int(11) DEFAULT NULL,
  `time_battery` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_computerstechnicalservice`
--

CREATE TABLE `tbl_computerstechnicalservice` (
  `id` int(11) NOT NULL,
  `trademark` varchar(25) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `entry_date` date DEFAULT NULL,
  `out_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_computerstechnicalservice`
--

INSERT INTO `tbl_computerstechnicalservice` (`id`, `trademark`, `model`, `description`, `entry_date`, `out_date`) VALUES
(1, 'HP', '14-abc', 'Problemas de pantalla', '2022-01-14', NULL),
(2, 'DELL', 'Inspiron 7500', 'Se apaga, se traba, esta lenta, necesita mantenimiento', '2022-01-14', NULL),
(3, 'ACER', 'Aspire 3 15-50la', 'No sirve la bocina, no funciona el click derecho', '2022-01-14', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `issue` varchar(150) NOT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_customers`
--

INSERT INTO `tbl_customers` (`id`, `name`, `lastname`, `issue`, `phone_number`, `status`, `create_date`, `update_date`) VALUES
(12, 'Mauricio', '', 'Laptop ASUS 12', 30415345, 1, '2022-02-09 16:52:41', '2022-02-09 16:52:41'),
(13, 'Pablo', 'Paau', 'Reunion', 47293226, 1, '2022-02-12 03:14:01', '2022-02-12 05:04:03'),
(14, 'oso', 'fuentes', 'toshiba', 56451203, 1, '2022-02-13 04:09:09', '2022-03-13 06:15:26'),
(15, 'Antony', 'Velasquez', 'Servidor ', 47056421, 1, '2022-02-22 23:51:00', '2022-02-22 23:51:00'),
(16, 'Oscar', 'Wiro', 'Reunion por zoom', 45127896, 1, '2022-03-13 06:14:02', '2022-03-13 06:14:55');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_computersonsale`
--
ALTER TABLE `tbl_computersonsale`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_computerstechnicalservice`
--
ALTER TABLE `tbl_computerstechnicalservice`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_computersonsale`
--
ALTER TABLE `tbl_computersonsale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_computerstechnicalservice`
--
ALTER TABLE `tbl_computerstechnicalservice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;
--
--Estructura para la tabla de computerLog
--
CREATE TABLE `tbl_computerLog` (
  `id` int(11) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `processor` varchar(150) NOT NULL,
  `ram` varchar(150) NOT NULL,
  `disk` varchar(150) NOT NULL,
  `sizeDisk` int(11) DEFAULT NULL,
  `state` varchar(150) NOT NULL,
  `status` int(11) DEFAULT 1,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
--
-- 20220319 Comandos a efectuar en sql:
drop table tbl_computerLog
-- luego
CREATE TABLE `tbl_computerLog` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `marca` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `processor` varchar(150) NOT NULL,
  `ram` varchar(150) NOT NULL,
  `disk` varchar(150) NOT NULL,
  `sizeDisk` int(11) DEFAULT NULL,
  `state` varchar(150) NOT NULL,
  `status` int(11) DEFAULT 1,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
)
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
