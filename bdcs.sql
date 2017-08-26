-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-07-2017 a las 03:38:32
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdcs`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `idAlmacen` int(11) NOT NULL,
  `IdEmpleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`idAlmacen`, `IdEmpleado`) VALUES
(1, 3),
(2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenequipo`
--

CREATE TABLE `almacenequipo` (
  `IdAlmacen` int(11) NOT NULL,
  `IdEquipo` int(11) NOT NULL,
  `IdItem` int(11) NOT NULL,
  `Serie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `almacenequipo`
--

INSERT INTO `almacenequipo` (`IdAlmacen`, `IdEquipo`, `IdItem`, `Serie`) VALUES
(1, 2, 1, 1829304783),
(1, 2, 2, 1827405283),
(1, 3, 1, 1898324927),
(2, 3, 1, 1897398297);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `idPersona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `direccion`, `idPersona`) VALUES
(1, 'Calle  29 Barrio II Mz. V', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `cargo` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `estado` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `fechaIngreso` date DEFAULT NULL,
  `idPersona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `cargo`, `estado`, `fechaIngreso`, `idPersona`) VALUES
(1, 'Jefe de Logistica', 'O', NULL, 1),
(2, 'Supervisor', 'O', NULL, 2),
(3, 'Tecnico', 'D', NULL, 3),
(4, 'Tecnico', 'D', NULL, 4),
(5, 'Supervisor', 'D', NULL, 17),
(6, 'Supervisor', 'D', NULL, 18),
(7, 'Tecnico', 'D', NULL, 39);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id` int(11) NOT NULL,
  `codigoSap` char(11) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `unidadMedida` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Serializable` bit(1) DEFAULT b'1',
  `estado` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `fechaRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id`, `codigoSap`, `descripcion`, `stock`, `unidadMedida`, `Serializable`, `estado`, `fechaRegistro`) VALUES
(2, '10097648425', 'Telefono', 5, 'unidad', b'1', 'Habilitado', '2017-06-27 05:00:00'),
(3, '10975286743', 'Modem', 2, 'unidad', b'1', 'Habilitado', '2017-06-26 05:00:00'),
(4, '85991200691', 'Reloj', 1, 'Unidades', b'1', 'Habilitado', '0000-00-00 00:00:00'),
(7, '235', 'Reloj con mouse', 1, 'Unidad', b'1', 'Habilitado', '2017-07-01 23:25:18'),
(11, '1234', 'Mouse', 25, 'Unidad', b'1', 'Habilitado', '2017-07-01 23:31:45'),
(12, '5123465', 'Cable', 2, 'Unidad', b'1', 'Habilitado', '2017-07-01 23:34:26'),
(13, '666', 'Tablet', 2, 'Unidad', b'1', 'Habilitado', '2017-07-01 23:34:27'),
(14, '457878', 'Usb', 1, 'Unidad', b'1', 'Habilitado', '2017-07-01 23:39:02'),
(32, '1053300413', 'Jordan', 2, 'U', b'1', 'H', '2017-07-02 00:32:50'),
(34, '85991200691', 'Caja reloj', 1, 'Unidad', b'1', 'Habilitado', '2017-07-04 22:07:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE `lote` (
  `idLote` int(11) NOT NULL,
  `codigo` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `fechaRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `lote`
--

INSERT INTO `lote` (`idLote`, `codigo`, `fechaRegistro`) VALUES
(1, 'AGRDY23JUA', '2017-06-27 05:00:00'),
(2, '89123', '0000-00-00 00:00:00'),
(3, '190012', '2017-06-28 05:33:33'),
(4, '563412', '2017-06-28 05:59:08'),
(5, '3121', '2017-06-28 06:02:23'),
(6, '3215846', '2017-06-28 06:03:09'),
(7, '563249', '2017-06-30 02:54:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loteequipo`
--

CREATE TABLE `loteequipo` (
  `IdLote` int(11) NOT NULL,
  `IdEquipo` int(11) NOT NULL,
  `IdItem` int(11) NOT NULL,
  `Serie` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `loteequipo`
--

INSERT INTO `loteequipo` (`IdLote`, `IdEquipo`, `IdItem`, `Serie`) VALUES
(1, 2, 1, '1234'),
(1, 2, 2, '123a'),
(1, 3, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientoalmacen`
--

CREATE TABLE `movimientoalmacen` (
  `IdMovimiento` int(11) NOT NULL,
  `TipoMovimiento` int(11) NOT NULL,
  `IdEquipo` int(11) NOT NULL,
  `Serie` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IdItem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idPersona` int(11) NOT NULL,
  `nombres` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `dni` varchar(8) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(9) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idPersona`, `nombres`, `apellidos`, `dni`, `email`, `telefono`) VALUES
(1, 'Jordan', 'Rojas Alarcon', '42182930', 'jordanrojas@gmail.com', '948920375'),
(2, 'Cristhian', 'Delgado Chau', '76281976', 'chiquidc@hotmail.com', '938748274'),
(3, 'Pamela', 'Lizarraga Alvarez', '23456789', 'pamelaliza@gmail.com', '938517284'),
(4, 'Jordyn', 'Toribio', '47281746', 'toribio12@gmail.com', '927848264'),
(5, 'Elisabeth', 'Ruiz Mendoza', '48205352', 'elisabethrm@gmail.com', '948960285'),
(6, 'Pamela', 'Lizarraga', '7030852', 'asd@bbhv.com', '140746988'),
(7, 'Pamela', 'Lizarraga', '7030852', 'asd@bbhv.com', '140746988'),
(8, 'Pamela', 'Lizarraga', '7030852', 'asd@bbhv.com', '140746988'),
(17, 'Pamela', 'Lizarraga', '70204050', 'asd@bbhv.com.', '948796338'),
(18, 'Monica', 'Lizarraga', '70405080', 'monica@ho.com', '974512356'),
(19, 'Monicaa', 'Alvarez', '40404040', 'pabdbd@.com', '187546329'),
(20, 'Monicaa', 'Alvarez', '40404040', 'pabdbd@.com', '963258741'),
(21, 'Monicaa', 'Alvarez', '40508060', 'pabdbd@.com', '963258741'),
(22, 'Monicaa', 'Alvarez', '40508060', 'monica@hotmail.com', '963258741'),
(23, 'Monicaa', 'Alvarez', '40508060', 'monica@hotmail.com', '963258741'),
(24, 'Monicaa', 'Alvarez', '40508060', 'monica@hotmail.com', '963258741'),
(25, 'Monicaa', 'Alvarez', '40508060', 'monica@hotmail.com', '963258741'),
(26, 'Monicaa', 'Alvarez', '40508060', 'monica@hotmail.com', '963258741'),
(27, 'Monicaa', 'Alvarez', '40508060', 'monica@hotmail.com', '963258741'),
(28, 'Monicaa', 'Alvarez', '40508060', 'monica@hotmail.com', '96325874'),
(29, 'Monicaa', 'Alvarez', '40508060', 'monica@hotmail.com', '963258743'),
(30, 'Monicaa', 'Alvarez', '40508060', 'monica@hotmail.com', '963258743'),
(31, 'Monicaa', 'Alvarez', '40508060', 'monica@hotmail.com', '963258740'),
(32, 'Monicaa', 'Alvarez', '40508060', 'monica@hotmail.com', '963258740'),
(33, 'Monicaa', 'Alvarez', '40508060', 'monica@hotmail.com', '963258740'),
(34, 'Monicaa', 'Alvarez', '40508060', 'monica@hotmail.com', '963258740'),
(35, 'Monicaa', 'Alvarez', '40508060', 'monica@hotmail.com', '963258740'),
(36, 'Monicaa', 'Alvarez', '40508060', 'monica@hotmail.com', '963258740'),
(37, 'Monicaa', 'Alvarez', '40508060', 'monica@hotmail.com', '963258740'),
(38, 'Monicaa', 'Alvarez', '40508060', 'monica@hotmail.com', '963258740'),
(39, 'Monicaa', 'Alvarez', '40508060', 'monica@hotmail.com', '963258740');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `idServicio` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `idTipo` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  `idCliente` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `fechaAtencion` date DEFAULT NULL,
  `fechaVerificacion` date DEFAULT NULL,
  `fechaSolicitud` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`idServicio`, `descripcion`, `idTipo`, `estado`, `idCliente`, `idEmpleado`, `fechaAtencion`, `fechaVerificacion`, `fechaSolicitud`) VALUES
(4, 'Instalacion de internet', 3, 1, 1, 4, NULL, NULL, '2017-06-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicioequipo`
--

CREATE TABLE `servicioequipo` (
  `IdServicio` int(11) NOT NULL,
  `IdEquipo` int(11) NOT NULL,
  `IdItem` int(11) NOT NULL,
  `Serie` char(10) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `servicioequipo`
--

INSERT INTO `servicioequipo` (`IdServicio`, `IdEquipo`, `IdItem`, `Serie`) VALUES
(4, 2, 1, '9821371230');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudequipo`
--

CREATE TABLE `solicitudequipo` (
  `IdSolicitud` int(11) NOT NULL,
  `IdEquipo` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `solicitudequipo`
--

INSERT INTO `solicitudequipo` (`IdSolicitud`, `IdEquipo`, `Cantidad`) VALUES
(1, 2, 2),
(1, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudprestamo`
--

CREATE TABLE `solicitudprestamo` (
  `IdSoilictud` int(11) NOT NULL,
  `FechaSolicitud` date NOT NULL,
  `Estado` int(11) DEFAULT '1',
  `IdEmpleadoA` int(11) DEFAULT NULL,
  `IdEmpleadoS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `solicitudprestamo`
--

INSERT INTO `solicitudprestamo` (`IdSoilictud`, `FechaSolicitud`, `Estado`, `IdEmpleadoA`, `IdEmpleadoS`) VALUES
(1, '2017-06-27', 1, NULL, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposervicio`
--

CREATE TABLE `tiposervicio` (
  `IdTipoServicio` int(11) NOT NULL,
  `descripcion` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tiposervicio`
--

INSERT INTO `tiposervicio` (`IdTipoServicio`, `descripcion`) VALUES
(1, 'Cable'),
(2, 'Telefono'),
(3, 'Internet');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `IdTipoUsuario` int(11) NOT NULL,
  `Descripcion` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`IdTipoUsuario`, `Descripcion`) VALUES
(1, 'Jefe de Logistica'),
(2, 'Supervisor'),
(3, 'Tecnico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `IdUbicacion` int(11) NOT NULL,
  `Latitud` decimal(9,5) NOT NULL,
  `Longitud` decimal(9,5) NOT NULL,
  `FechaRegistro` date NOT NULL,
  `IdEmpleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`IdUbicacion`, `Latitud`, `Longitud`, `FechaRegistro`, `IdEmpleado`) VALUES
(1, '-8.10622', '-79.06511', '2017-06-27', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `usuario` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` int(11) NOT NULL,
  `token` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `idEmpleado`, `usuario`, `password`, `tipo`, `token`) VALUES
(1, 1, 'jrojasa', 'jordan', 1, 'dxsL70FR8O0:APA91bGOHHRX5JRFGIp6CQka9lUHdcy04C0xWH8-LKOtKyB4JV0A7Xw75fSKCVpFkJbRCF9NQa6Uzk6eiwm7YVfektWfJM0XkgYpsBLcZezocvlh6Gpyg4As9cZ6SGO_aKp5BR86r5Fz'),
(2, 2, 'cdelgadoc', 'cristhian', 2, 'dggK-5c8Eic:APA91bGu7wT1qAEuUJ39uhqb6OrhpGJ9IffsvgtDyF9jBcHUZbUff0R2rgvRqqgiGGbXadMV339raoCzC1zyxdCWd2BgrEvY8q6VH2mMSzCh1ML28sQ3uCN9Ql6eiMjiX2No1RuHlVot'),
(3, 3, 'plizarragaa', 'pamela', 3, NULL),
(4, 4, 'jtoribioe', 'jordyn', 3, NULL),
(5, 7, 'monicasa', 'monica', 3, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`idAlmacen`),
  ADD KEY `FK_almacen_empleado` (`IdEmpleado`);

--
-- Indices de la tabla `almacenequipo`
--
ALTER TABLE `almacenequipo`
  ADD PRIMARY KEY (`IdAlmacen`,`IdEquipo`,`IdItem`),
  ADD KEY `FK_AlmacenEquipo_equipo` (`IdEquipo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `FK_cliente_persona` (`idPersona`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `persona_empleado` (`idPersona`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`idLote`);

--
-- Indices de la tabla `loteequipo`
--
ALTER TABLE `loteequipo`
  ADD PRIMARY KEY (`IdLote`,`IdEquipo`,`IdItem`),
  ADD KEY `FK_LoteEquipo_equipo` (`IdEquipo`);

--
-- Indices de la tabla `movimientoalmacen`
--
ALTER TABLE `movimientoalmacen`
  ADD PRIMARY KEY (`IdMovimiento`),
  ADD KEY `FK_MovimientoAlmacen_equipo` (`IdEquipo`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idPersona`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`idServicio`),
  ADD KEY `cliente_servicio` (`idCliente`),
  ADD KEY `FK_servicio_empleado` (`idEmpleado`),
  ADD KEY `FK_servicio_TipoServicio` (`idTipo`);

--
-- Indices de la tabla `servicioequipo`
--
ALTER TABLE `servicioequipo`
  ADD PRIMARY KEY (`IdServicio`,`IdEquipo`,`IdItem`),
  ADD KEY `FK_ServicioEquipo_equipo` (`IdEquipo`);

--
-- Indices de la tabla `solicitudequipo`
--
ALTER TABLE `solicitudequipo`
  ADD PRIMARY KEY (`IdSolicitud`,`IdEquipo`),
  ADD KEY `FK_SolicitudEquipo_equipo` (`IdEquipo`);

--
-- Indices de la tabla `solicitudprestamo`
--
ALTER TABLE `solicitudprestamo`
  ADD PRIMARY KEY (`IdSoilictud`),
  ADD KEY `FK_SolicitudPrestamo_empleado` (`IdEmpleadoS`);

--
-- Indices de la tabla `tiposervicio`
--
ALTER TABLE `tiposervicio`
  ADD PRIMARY KEY (`IdTipoServicio`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`IdTipoUsuario`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`IdUbicacion`),
  ADD KEY `FK_Ubicacion_empleado` (`IdEmpleado`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `empleado_usuario` (`idEmpleado`),
  ADD KEY `FK_usuario_TipoUsuario` (`tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `idAlmacen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT de la tabla `lote`
--
ALTER TABLE `lote`
  MODIFY `idLote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `movimientoalmacen`
--
ALTER TABLE `movimientoalmacen`
  MODIFY `IdMovimiento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `solicitudprestamo`
--
ALTER TABLE `solicitudprestamo`
  MODIFY `IdSoilictud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tiposervicio`
--
ALTER TABLE `tiposervicio`
  MODIFY `IdTipoServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `IdTipoUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `IdUbicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD CONSTRAINT `FK_almacen_empleado` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `almacenequipo`
--
ALTER TABLE `almacenequipo`
  ADD CONSTRAINT `FK_AlmacenEquipo_almacen` FOREIGN KEY (`IdAlmacen`) REFERENCES `almacen` (`idAlmacen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AlmacenEquipo_equipo` FOREIGN KEY (`IdEquipo`) REFERENCES `equipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK_cliente_persona` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `persona_empleado` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `loteequipo`
--
ALTER TABLE `loteequipo`
  ADD CONSTRAINT `FK_LoteEquipo_equipo` FOREIGN KEY (`IdEquipo`) REFERENCES `equipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_LoteEquipo_lote` FOREIGN KEY (`IdLote`) REFERENCES `lote` (`idLote`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `movimientoalmacen`
--
ALTER TABLE `movimientoalmacen`
  ADD CONSTRAINT `FK_MovimientoAlmacen_equipo` FOREIGN KEY (`IdEquipo`) REFERENCES `equipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`idTipo`) REFERENCES `tiposervicio` (`IdTipoServicio`);

--
-- Filtros para la tabla `servicioequipo`
--
ALTER TABLE `servicioequipo`
  ADD CONSTRAINT `FK_ServicioEquipo_equipo` FOREIGN KEY (`IdEquipo`) REFERENCES `equipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ServicioEquipo_servicio` FOREIGN KEY (`IdServicio`) REFERENCES `servicio` (`idServicio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicitudequipo`
--
ALTER TABLE `solicitudequipo`
  ADD CONSTRAINT `FK_SolicitudEquipo_SolicitudPrestamo` FOREIGN KEY (`IdSolicitud`) REFERENCES `solicitudprestamo` (`IdSoilictud`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SolicitudEquipo_equipo` FOREIGN KEY (`IdEquipo`) REFERENCES `equipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicitudprestamo`
--
ALTER TABLE `solicitudprestamo`
  ADD CONSTRAINT `FK_SolicitudPrestamo_empleado` FOREIGN KEY (`IdEmpleadoS`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD CONSTRAINT `FK_Ubicacion_empleado` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_usuario_TipoUsuario` FOREIGN KEY (`tipo`) REFERENCES `tipousuario` (`IdTipoUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleado_usuario` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
