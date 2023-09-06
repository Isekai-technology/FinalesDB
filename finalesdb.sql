-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-09-2023 a las 20:53:14
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `finalesdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`ID`, `Nombre`) VALUES
(1, 'Analista de Sistemas'),
(2, 'Tecnico Superior en Publicidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correlativas`
--

CREATE TABLE `correlativas` (
  `ID` int(11) NOT NULL,
  `ID_Materia` int(11) NOT NULL COMMENT 'Materia',
  `ID_Correlativa` int(11) NOT NULL COMMENT 'Materia requerida para cursar la materia(ID_Materia)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `correlativas`
--

INSERT INTO `correlativas` (`ID`, `ID_Materia`, `ID_Correlativa`) VALUES
(1, 10, 4),
(2, 12, 2),
(3, 13, 1),
(4, 20, 9),
(5, 21, 11),
(6, 22, 13),
(7, 23, 15),
(8, 16, 16),
(9, 29, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleestudiante`
--

CREATE TABLE `detalleestudiante` (
  `ID` int(11) NOT NULL,
  `ID_Estudiante` int(11) NOT NULL COMMENT 'Estudiante',
  `ID_Materia` int(11) NOT NULL COMMENT 'Materia que cursa el estudiante',
  `Estado` varchar(25) NOT NULL COMMENT 'Estado del estudiante en la materia (APROBADA,LIBRE,PENDIENTE)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido` varchar(30) NOT NULL,
  `DNI` varchar(25) NOT NULL,
  `Activo` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Estado del estudiante (1-Regular/0-Inactivo)',
  `ID_Usuario` int(11) NOT NULL COMMENT 'Referencia a cuenta de Usuario',
  `ID_Plan` int(11) NOT NULL COMMENT 'Plan de estudio asignado al estudiante'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscriptospormesa`
--

CREATE TABLE `inscriptospormesa` (
  `ID` int(11) NOT NULL,
  `ID_MesaDeExamen` int(11) NOT NULL COMMENT 'Mesa de examen a la que se inscribe el estudiante ',
  `ID_Estudiante` int(11) NOT NULL COMMENT 'Estudiante'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`ID`, `Nombre`) VALUES
(1, 'Marketing General'),
(2, 'Psicología General'),
(3, 'Fundamentos del Diseño Publicitario'),
(4, 'Computación I'),
(5, 'Introducción a la Publicidad'),
(6, 'Producción Gráfica'),
(7, 'Producción Radial'),
(8, 'Producción Audiovisual'),
(9, 'Espacio de definición Institucional (Creatividad/Comunicación Digital I/Grafica Asistida I)'),
(10, 'Computación II'),
(11, 'Inglés I'),
(12, 'Psicología Social'),
(13, 'Marketing Directo'),
(14, 'Arte, Cine, Literatura e Historia de la Publicidad'),
(15, 'Redacción Creativa I'),
(16, 'Dirección de Arte I'),
(17, 'Planificación Estratégica de Medios'),
(18, 'Semiología Publicitaria'),
(19, 'Técnica Promocional y POP'),
(20, 'Espacio de Definicion Institucional (Creatividad II/Grafica Asistida II)'),
(21, 'Ingles II'),
(22, 'Investigación de Mercado'),
(23, 'Redacción Creativa II'),
(24, 'Dirección de Arte II'),
(25, 'Seminario de Práctica Profesional'),
(26, 'Atención de Cuentas'),
(27, 'Organización y Administración de la Agencia'),
(28, 'Derecho y Legislación Publicitaria'),
(29, 'Espacio de Definición Institucional(Comunicación Digital II/Grafica Asistida III/Gestión de Proyectos)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiasporplan`
--

CREATE TABLE `materiasporplan` (
  `ID` int(11) NOT NULL,
  `ID_Materia` int(11) NOT NULL COMMENT 'Materia que pertenece al plan de estudio',
  `ID_PlanDeEstudio` int(11) NOT NULL COMMENT 'Plan de estudio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materiasporplan`
--

INSERT INTO `materiasporplan` (`ID`, `ID_Materia`, `ID_PlanDeEstudio`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21, 21, 1),
(22, 22, 1),
(23, 23, 1),
(24, 24, 1),
(25, 25, 1),
(26, 26, 1),
(27, 27, 1),
(28, 28, 1),
(29, 29, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesadeexamenes`
--

CREATE TABLE `mesadeexamenes` (
  `ID` int(11) NOT NULL,
  `Fecha` date NOT NULL COMMENT 'Dia y hora en que se realiza la mesa de examen',
  `ID_Materia` int(11) NOT NULL COMMENT 'Materia que se evalua',
  `ID_Profesor` int(11) NOT NULL COMMENT 'Profesor/Presidente de mesa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planesdeestudio`
--

CREATE TABLE `planesdeestudio` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `ID_Carrera` int(11) NOT NULL COMMENT 'Carrera a la que pertenece el plan de estudio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `planesdeestudio`
--

INSERT INTO `planesdeestudio` (`ID`, `Nombre`, `ID_Carrera`) VALUES
(1, 'RM 3805/06', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Apellido` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(25) NOT NULL COMMENT 'Administrador/Estudiante'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`ID`, `Nombre`) VALUES
(1, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Contraseña` varchar(25) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `ID_Rol` int(11) NOT NULL COMMENT 'Referencia la rol que puede tomar la cuenta'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `Nombre`, `Contraseña`, `Email`, `ID_Rol`) VALUES
(1, 'admin', 'admin', 'admin@hilet.com', 1),
(2, 'jorge', '1234', 'jorge1234@hilet.com', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `correlativas`
--
ALTER TABLE `correlativas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Correlativa` (`ID_Correlativa`),
  ADD KEY `ID_Materia` (`ID_Materia`);

--
-- Indices de la tabla `detalleestudiante`
--
ALTER TABLE `detalleestudiante`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Estudiante` (`ID_Estudiante`),
  ADD KEY `ID_Materia` (`ID_Materia`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Plan` (`ID_Plan`),
  ADD KEY `ID_Usuario` (`ID_Usuario`);

--
-- Indices de la tabla `inscriptospormesa`
--
ALTER TABLE `inscriptospormesa`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Estudiante` (`ID_Estudiante`),
  ADD KEY `ID_MesaDeExamen` (`ID_MesaDeExamen`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `materiasporplan`
--
ALTER TABLE `materiasporplan`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Materia` (`ID_Materia`),
  ADD KEY `ID_PlanDeEstudio` (`ID_PlanDeEstudio`);

--
-- Indices de la tabla `mesadeexamenes`
--
ALTER TABLE `mesadeexamenes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Materia` (`ID_Materia`),
  ADD KEY `ID_Profesor` (`ID_Profesor`);

--
-- Indices de la tabla `planesdeestudio`
--
ALTER TABLE `planesdeestudio`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Carrera` (`ID_Carrera`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Rol` (`ID_Rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `correlativas`
--
ALTER TABLE `correlativas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `detalleestudiante`
--
ALTER TABLE `detalleestudiante`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscriptospormesa`
--
ALTER TABLE `inscriptospormesa`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `materiasporplan`
--
ALTER TABLE `materiasporplan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `mesadeexamenes`
--
ALTER TABLE `mesadeexamenes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planesdeestudio`
--
ALTER TABLE `planesdeestudio`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `correlativas`
--
ALTER TABLE `correlativas`
  ADD CONSTRAINT `correlativas_ibfk_1` FOREIGN KEY (`ID_Correlativa`) REFERENCES `materias` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `correlativas_ibfk_2` FOREIGN KEY (`ID_Materia`) REFERENCES `materias` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalleestudiante`
--
ALTER TABLE `detalleestudiante`
  ADD CONSTRAINT `detalleestudiante_ibfk_1` FOREIGN KEY (`ID_Estudiante`) REFERENCES `estudiantes` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleestudiante_ibfk_2` FOREIGN KEY (`ID_Materia`) REFERENCES `materias` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`ID_Plan`) REFERENCES `planesdeestudio` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiantes_ibfk_2` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inscriptospormesa`
--
ALTER TABLE `inscriptospormesa`
  ADD CONSTRAINT `inscriptospormesa_ibfk_1` FOREIGN KEY (`ID_Estudiante`) REFERENCES `estudiantes` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inscriptospormesa_ibfk_2` FOREIGN KEY (`ID_MesaDeExamen`) REFERENCES `mesadeexamenes` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `materiasporplan`
--
ALTER TABLE `materiasporplan`
  ADD CONSTRAINT `materiasporplan_ibfk_1` FOREIGN KEY (`ID_Materia`) REFERENCES `materias` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `materiasporplan_ibfk_2` FOREIGN KEY (`ID_PlanDeEstudio`) REFERENCES `planesdeestudio` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mesadeexamenes`
--
ALTER TABLE `mesadeexamenes`
  ADD CONSTRAINT `mesadeexamenes_ibfk_1` FOREIGN KEY (`ID_Materia`) REFERENCES `materias` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mesadeexamenes_ibfk_2` FOREIGN KEY (`ID_Profesor`) REFERENCES `profesores` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `planesdeestudio`
--
ALTER TABLE `planesdeestudio`
  ADD CONSTRAINT `planesdeestudio_ibfk_1` FOREIGN KEY (`ID_Carrera`) REFERENCES `carreras` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_Rol`) REFERENCES `roles` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
