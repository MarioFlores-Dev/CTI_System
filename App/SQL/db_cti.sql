-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-01-2022 a las 05:58:52
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
  `phone_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_customers`
--

INSERT INTO `tbl_customers` (`id`, `name`, `lastname`, `phone_number`) VALUES
(1, 'Paco', 'Alonzo', 56487216),
(2, 'Vivi', 'Flores', 42568974);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_technicalservice`
--

CREATE TABLE `tbl_technicalservice` (
  `id` int(11) NOT NULL,
  `id_customers` int(11) DEFAULT NULL,
  `id_computertechnicalservice` int(11) DEFAULT NULL,
  `description_fix` varchar(50) DEFAULT NULL,
  `out_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_technicalservice`
--

INSERT INTO `tbl_technicalservice` (`id`, `id_customers`, `id_computertechnicalservice`, `description_fix`, `out_date`) VALUES
(1, 1, 1, 'Cambio de pantalla', '2022-01-14'),
(2, 2, 2, 'Revision completa y arreglo de problemas', '2022-01-18'),
(3, 2, 3, 'Se compuso el boton', '2022-01-17');

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
-- Indices de la tabla `tbl_technicalservice`
--
ALTER TABLE `tbl_technicalservice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customers` (`id_customers`),
  ADD KEY `id_computertechnicalservice` (`id_computertechnicalservice`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_technicalservice`
--
ALTER TABLE `tbl_technicalservice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_technicalservice`
--
ALTER TABLE `tbl_technicalservice`
  ADD CONSTRAINT `tbl_technicalservice_ibfk_1` FOREIGN KEY (`id_customers`) REFERENCES `tbl_customers` (`id`),
  ADD CONSTRAINT `tbl_technicalservice_ibfk_2` FOREIGN KEY (`id_computertechnicalservice`) REFERENCES `tbl_computerstechnicalservice` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
