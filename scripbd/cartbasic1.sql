-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-03-2021 a las 05:11:50
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cartbasic1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comcategorias`
--

CREATE TABLE `comcategorias` (
  `CatId` int(11) NOT NULL,
  `CatNombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comcategorias`
--

INSERT INTO `comcategorias` (`CatId`, `CatNombre`) VALUES
(1, 'Computadoras'),
(2, 'Audiculares'),
(3, 'Tarjetas Madres'),
(4, 'Tarjetas De Video'),
(5, 'Discos Duros'),
(6, 'Procesadores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comcontactanos`
--

CREATE TABLE `comcontactanos` (
  `Contid` int(11) NOT NULL,
  `ContNombre` varchar(80) NOT NULL,
  `ContCorreo` varchar(80) NOT NULL,
  `ContMotivo` varchar(200) NOT NULL,
  `ContMensaje` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comdetvent`
--

CREATE TABLE `comdetvent` (
  `VenID` int(11) DEFAULT NULL,
  `DetVenIdProd` int(11) NOT NULL,
  `DetVentCat` int(11) NOT NULL,
  `DetVentPrecio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comdetvent`
--

INSERT INTO `comdetvent` (`VenID`, `DetVenIdProd`, `DetVentCat`, `DetVentPrecio`) VALUES
(1, 1, 5, 60),
(1, 2, 6, 80);

--
-- Disparadores `comdetvent`
--
DELIMITER $$
CREATE TRIGGER `stock` AFTER INSERT ON `comdetvent` FOR EACH ROW UPDATE ComProductos SET ProdCantidad=ProdCantidad-NEW.DetVentCat WHERE id = New.DetVenIdProd
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comproductos`
--

CREATE TABLE `comproductos` (
  `id` int(11) NOT NULL,
  `ProdNombre` varchar(50) NOT NULL,
  `ProdPrecio` float NOT NULL,
  `ProdImagen` varchar(20) DEFAULT NULL,
  `ProdCantidad` int(11) NOT NULL,
  `ProdDescontinuado` char(1) DEFAULT NULL,
  `ProdProveedor` int(11) DEFAULT NULL,
  `ProdModelo` varchar(50) NOT NULL,
  `ProdCategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comproductos`
--

INSERT INTO `comproductos` (`id`, `ProdNombre`, `ProdPrecio`, `ProdImagen`, `ProdCantidad`, `ProdDescontinuado`, `ProdProveedor`, `ProdModelo`, `ProdCategoria`) VALUES
(1, 'Headset Gamer', 60, 'he1.jpg', 995, 'C', 1, 'ONIKUMA', 2),
(2, 'Gaming Headset', 80, 'he2.jpg', 994, 'C', 2, 'G233 Prodigy', 2),
(3, 'Turtle Headset', 120, 'he3.jpg', 1000, 'C', 3, 'Stealth 300', 2),
(4, 'KOTION Headset', 60, 'he4.jpg', 1000, 'C', 4, 'Each g9000', 2),
(5, 'Headset Sentey', 70, 'he5.jpg', 1000, 'C', 5, 'Sentey Huntex', 2),
(6, 'Pc Gamer Orion', 30000, 'co1.jpg', 1000, 'C', 6, 'OrionX', 1),
(7, 'Barracuda', 700, 'co2.jpg', 1000, 'C', 7, 'Barracuda Xtreme', 1),
(8, 'Elite Gaming PC Desktop', 950, 'co3.jpg', 1000, 'C', 8, 'Computer Slate2 080i', 1),
(9, 'Enthusiast Gaming Computer', 1200, 'co4.jpg', 1000, 'C', 8, 'AM010A AMD FX-6300', 1),
(10, 'PC GAMING VIBOX', 550, 'co5.jpg', 1000, 'C', 9, 'Warrior 7', 1),
(11, 'Godlike Gaming', 550, 'ta1.jpg', 1000, 'C', 10, 'x99a', 3),
(12, 'Tarjeta Madre Gamer Gigabyte', 250, 'ta2.jpg', 1000, 'C', 11, 'Z270x', 3),
(13, 'Motherboard Mining', 200, 'ta3.jpg', 1000, 'C', 12, 'b250-fintech', 3),
(14, 'ASUS Rog', 600, 'ta4.jpg', 1000, 'C', 13, 'zenith extreme x399', 3),
(15, 'ASUS Rog Strix', 200, 'ta5.jpg', 1000, 'C', 13, 'Z370-H', 3),
(16, 'Gigabyte Geforce', 250, 'tv1.jpg', 1000, 'C', 14, 'GTX 1050 Ti', 4),
(17, 'AORUS Geforce', 400, 'tv2.jpg', 1000, 'C', 14, 'RTX 1060', 4),
(18, 'Asus ROG Strix', 500, 'tv3.jpg', 1000, 'C', 13, 'GTX 1060', 4),
(19, 'Gigabyte Geforce', 200, 'tv4.jpg', 1000, 'C', 14, 'GTX 750 Ti ', 4),
(20, 'Gigabyte Geforce', 1300, 'tv5.jpg', 1000, 'C', 14, 'RTX 2080 ', 4),
(21, 'Seagate hard drive', 60, 'dd1.jpg', 1000, 'C', 15, 'Firecuda', 5),
(22, 'KINGSTON Hyper X', 40, 'dd2.jpg', 1000, 'C', 16, 'Fury', 5),
(23, 'KINGSTON Hyper X', 50, 'dd3.jpg', 1000, 'C', 16, 'Savage SSD', 5),
(24, 'SanDisk hard drive', 150, 'dd4.jpg', 1000, 'C', 17, 'SSD Plus', 5),
(25, 'Samsung hard drive', 150, 'dd5.jpg', 1000, 'C', 18, '860 evo', 5),
(26, 'Intel Core', 400, 'pr1.jpg', 1000, 'C', 19, 'i7-7700K', 6),
(27, 'Intel Core', 250, 'pr2.jpg', 1000, 'C', 19, 'i5-9600K', 6),
(28, 'Intel Core', 520, 'pr3.jpg', 1000, 'C', 19, 'i9-9900K', 6),
(29, 'Ryzen', 250, 'pr4.jpg', 1000, 'C', 20, 'Ryzen 7 2700 X', 6),
(30, 'Ryzen', 130, 'pr5.jpg', 1000, 'C', 20, 'Ryzen 5 2600 ', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comproveedores`
--

CREATE TABLE `comproveedores` (
  `ProvId` int(11) NOT NULL,
  `ProvNombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comproveedores`
--

INSERT INTO `comproveedores` (`ProvId`, `ProvNombre`) VALUES
(1, 'PlayStation'),
(2, 'Logitech'),
(3, 'Turtle beach'),
(4, 'KOTION'),
(5, 'Sentey'),
(6, '8Pack'),
(7, 'WePC'),
(8, 'iBUYPOWER'),
(9, 'VIBOX'),
(10, 'MSI'),
(11, 'AORUS'),
(12, 'Gigabyte'),
(13, 'ASUS'),
(14, 'NVIDIA'),
(15, 'Seagate'),
(16, 'Hyper X'),
(17, 'SanDisk'),
(18, 'SAMSUNG'),
(19, 'Intel'),
(20, 'AMD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comusuarios`
--

CREATE TABLE `comusuarios` (
  `Usid` int(11) NOT NULL,
  `UsNombre` varchar(50) NOT NULL,
  `UsApellidos` varchar(70) NOT NULL,
  `UsCorreo` varchar(100) NOT NULL,
  `UsContrasena` varchar(20) DEFAULT NULL,
  `UsContrasena2` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comusuarios`
--

INSERT INTO `comusuarios` (`Usid`, `UsNombre`, `UsApellidos`, `UsCorreo`, `UsContrasena`, `UsContrasena2`) VALUES
(1, 'Uziel Felipe', 'Estrada Marin', 'Uziel471@gmail.com', '6645472727A', '6645472727A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comventas`
--

CREATE TABLE `comventas` (
  `VenId` int(11) NOT NULL,
  `VenUsuario` int(11) NOT NULL,
  `VenFecha` date NOT NULL,
  `VenTotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comventas`
--

INSERT INTO `comventas` (`VenId`, `VenUsuario`, `VenFecha`, `VenTotal`) VALUES
(1, 1, '2021-03-28', 780);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comcategorias`
--
ALTER TABLE `comcategorias`
  ADD PRIMARY KEY (`CatId`);

--
-- Indices de la tabla `comcontactanos`
--
ALTER TABLE `comcontactanos`
  ADD PRIMARY KEY (`Contid`);

--
-- Indices de la tabla `comproductos`
--
ALTER TABLE `comproductos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comproveedores`
--
ALTER TABLE `comproveedores`
  ADD PRIMARY KEY (`ProvId`);

--
-- Indices de la tabla `comusuarios`
--
ALTER TABLE `comusuarios`
  ADD PRIMARY KEY (`Usid`);

--
-- Indices de la tabla `comventas`
--
ALTER TABLE `comventas`
  ADD PRIMARY KEY (`VenId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comcategorias`
--
ALTER TABLE `comcategorias`
  MODIFY `CatId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `comcontactanos`
--
ALTER TABLE `comcontactanos`
  MODIFY `Contid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comproductos`
--
ALTER TABLE `comproductos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `comproveedores`
--
ALTER TABLE `comproveedores`
  MODIFY `ProvId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `comusuarios`
--
ALTER TABLE `comusuarios`
  MODIFY `Usid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `comventas`
--
ALTER TABLE `comventas`
  MODIFY `VenId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
