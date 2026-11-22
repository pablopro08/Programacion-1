-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2025 a las 07:00:11
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ponchao`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `contraseña` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `nombre`, `contraseña`) VALUES
(1, 'Sebastian', 'papas18'),
(2, 'Sarahi', 'mranttenna15'),
(3, 'Valeria', 'taehyung26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `burros`
--

CREATE TABLE `burros` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `ingredientes` varchar(200) DEFAULT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `burros`
--

INSERT INTO `burros` (`id`, `nombre`, `ingredientes`, `precio`) VALUES
(1, 'El Relevo', 'Carne de puerco adobada, queso derretido, tomate, aguacate fresco y con mayonesa.', 170),
(2, 'El Hitazo', 'Extra carne, extra queso, aguacate fresco, chile verde, tocino, cebolla asada y frijoles.', 185),
(3, 'El Espino ', 'Carne de res, chile verde, extra queso, tomate , aguacate fresco y mayonesa.', 170),
(4, 'El Triplete', 'Carne de res, extra queso, frijoles refritos, tomate, aguacate fresco y mayonesa', 170),
(5, 'El Doble Play ', 'Carne de res, carne adobada, tomate, aguacate, queso, mayonesa.', 185),
(6, 'El picher', 'Pollo empanizada, jamón, tocino, queso, tomate,  aguacate y mayonesa.', 170);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `direccion`) VALUES
(1, 'Angel', 'Zacatecas #22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_burro` int(11) NOT NULL,
  `id_size` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promos`
--

CREATE TABLE `promos` (
  `id` int(11) NOT NULL,
  `id_burro` int(11) NOT NULL,
  `id_tamano` int(11) NOT NULL,
  `dias` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `size`
--

CREATE TABLE `size` (
  `id` int(11) NOT NULL,
  `tamaño` varchar(200) DEFAULT NULL,
  `multiplicador` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `size`
--

INSERT INTO `size` (`id`, `tamaño`, `multiplicador`) VALUES
(1, 'Pequeño', 1),
(2, 'Estándar', 1.3),
(3, 'Grande', 1.6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id` int(11) NOT NULL,
  `sucursal` varchar(200) DEFAULT NULL,
  `direccion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id`, `sucursal`, `direccion`) VALUES
(1, 'Quiroga', 'Blvd. Antonio Quiroga 86, El Llanito, 83174 Hermosillo, Son.'),
(2, 'Pueblitos', 'Blvrd Agustín F. Zamora, Zona Industrial, 83117 Hermosillo, Son.'),
(3, 'Reforma', 'C. de la Reforma 191A-S, Balderrama, 83180 Hermosillo, Son.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sugerencias`
--

CREATE TABLE `sugerencias` (
  `id` int(11) NOT NULL,
  `sugerencia` varchar(200) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `burros`
--
ALTER TABLE `burros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_burro` (`id_burro`),
  ADD KEY `id_size` (`id_size`),
  ADD KEY `id_sucursal` (`id_sucursal`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `promos`
--
ALTER TABLE `promos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_promos_burro` (`id_burro`),
  ADD KEY `fk_promos_tamano` (`id_tamano`);

--
-- Indices de la tabla `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sugerencias`
--
ALTER TABLE `sugerencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `burros`
--
ALTER TABLE `burros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `promos`
--
ALTER TABLE `promos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `size`
--
ALTER TABLE `size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sugerencias`
--
ALTER TABLE `sugerencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `id_burro` FOREIGN KEY (`id_burro`) REFERENCES `burros` (`id`),
  ADD CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `id_size` FOREIGN KEY (`id_size`) REFERENCES `size` (`id`),
  ADD CONSTRAINT `id_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id`);

--
-- Filtros para la tabla `promos`
--
ALTER TABLE `promos`
  ADD CONSTRAINT `fk_promos_burro` FOREIGN KEY (`id_burro`) REFERENCES `burros` (`id`),
  ADD CONSTRAINT `fk_promos_tamano` FOREIGN KEY (`id_tamano`) REFERENCES `size` (`id`);

--
-- Filtros para la tabla `sugerencias`
--
ALTER TABLE `sugerencias`
  ADD CONSTRAINT `sugerencias_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `sugerencias_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
