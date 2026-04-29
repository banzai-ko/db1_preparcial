-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Apr 29, 2026 at 11:50 PM
-- Server version: 8.0.45
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CompumundohipermegaredSA`
--

-- --------------------------------------------------------

--
-- Table structure for table `Clientes`
--

CREATE TABLE `Clientes` (
  `cliente_id` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Clientes`
--

INSERT INTO `Clientes` (`cliente_id`, `nombre`, `direccion`, `email`, `telefono`) VALUES
(1, 'Juan Pérez', 'Avenida del Sol 789, Ciudad', 'juan.perez@nuevoemail.com', '555-111'),
(2, 'Ana Gómez', 'Avenida Siempre Viva 456, Springfield', 'ana.gomez@example.com', '555-5678'),
(3, 'Carlos Fernández', 'Plaza Central 789, Shelbyville', 'carlos.fernandez@example.com', '555-8765'),
(4, 'María López', 'Calle Real 321, Shelbyville', 'maria.lopez@example.com', '555-4321'),
(5, 'Pedro Martínez', 'Boulevard de los Sueños 654, Springfield', 'pedro.martinez@example.com', '555-9876'),
(6, 'Homero', '742 Evergreen Terrace', 'homero@mailfalso.com', '555-0001'),
(7, 'Homerote', 'Av siempre Viva 123', 'homero@plantaenergianuclearspringfield.com', '555-6666');

--
-- Triggers `Clientes`
--
DELIMITER $$
CREATE TRIGGER `trg_homero` BEFORE INSERT ON `Clientes` FOR EACH ROW BEGIN
    IF NEW.nombre = 'Homero' AND
       (SELECT COUNT(*) FROM Clientes WHERE nombre = 'Homero') >= 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Solo se permite un cliente llamado Homero';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `DetalleVenta`
--

CREATE TABLE `DetalleVenta` (
  `detalle_id` int NOT NULL,
  `venta_id` int DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `DetalleVenta`
--

INSERT INTO `DetalleVenta` (`detalle_id`, `venta_id`, `producto_id`, `cantidad`, `subtotal`) VALUES
(1, 1, 1, 1, 1500.00),
(2, 1, 2, 1, 200.00),
(3, 2, 2, 1, 200.00),
(4, NULL, 3, 1, 80.00),
(5, 4, 4, 1, 50.00),
(6, 5, 5, 1, 120.00);

-- --------------------------------------------------------

--
-- Table structure for table `Productos`
--

CREATE TABLE `Productos` (
  `producto_id` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Productos`
--

INSERT INTO `Productos` (`producto_id`, `nombre`, `descripcion`, `precio`, `stock`) VALUES
(1, 'Laptop Gamer', 'Laptop con procesador i7, 16GB RAM, 512GB SSD', 1500.00, 10),
(2, 'Monitor 24\" Full HD', 'Monitor LED 24 pulgadas, resolución Full HD', 200.00, 20),
(3, 'Teclado Mecánico', 'Teclado mecánico retroiluminado RGB', 80.00, 15),
(4, 'Ratón Ergonómico', 'Ratón ergonómico con ajuste de DPI', 50.00, 25),
(5, 'Auriculares Gaming', 'Auriculares con micrófono y sonido envolvente', 120.00, 30);

-- --------------------------------------------------------

--
-- Table structure for table `Ventas`
--

CREATE TABLE `Ventas` (
  `venta_id` int NOT NULL,
  `cliente_id` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ;

--
-- Dumping data for table `Ventas`
--

INSERT INTO `Ventas` (`venta_id`, `cliente_id`, `fecha`, `total`) VALUES
(1, 1, '2024-08-01', 1680.00),
(2, 2, '2024-08-02', 280.00),
(4, 4, '2024-08-04', 50.00),
(5, 5, '2024-08-05', 120.00),
(7, 2, '2026-05-01', 150.00);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vista_contar_punto_com`
-- (See below for the actual view)
--
CREATE TABLE `vista_contar_punto_com` (
`total_clientes_com` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vista_detalle_ventas`
-- (See below for the actual view)
--
CREATE TABLE `vista_detalle_ventas` (
`cantidad` int
,`cliente` varchar(100)
,`fecha` date
,`producto` varchar(100)
,`subtotal` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vista_total_ventas`
-- (See below for the actual view)
--
CREATE TABLE `vista_total_ventas` (
`total_ventas` decimal(32,2)
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`cliente_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `DetalleVenta`
--
ALTER TABLE `DetalleVenta`
  ADD PRIMARY KEY (`detalle_id`),
  ADD KEY `venta_id` (`venta_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indexes for table `Productos`
--
ALTER TABLE `Productos`
  ADD PRIMARY KEY (`producto_id`);

--
-- Indexes for table `Ventas`
--
ALTER TABLE `Ventas`
  ADD PRIMARY KEY (`venta_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `idx_ventas_fecha` (`fecha`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `cliente_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `DetalleVenta`
--
ALTER TABLE `DetalleVenta`
  MODIFY `detalle_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Productos`
--
ALTER TABLE `Productos`
  MODIFY `producto_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Ventas`
--
ALTER TABLE `Ventas`
  MODIFY `venta_id` int NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Structure for view `vista_contar_punto_com`
--
DROP TABLE IF EXISTS `vista_contar_punto_com`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`172.%` SQL SECURITY DEFINER VIEW `vista_contar_punto_com`  AS SELECT count(0) AS `total_clientes_com` FROM `Clientes` WHERE (`Clientes`.`email` like '%.com') ;

-- --------------------------------------------------------

--
-- Structure for view `vista_detalle_ventas`
--
DROP TABLE IF EXISTS `vista_detalle_ventas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`172.%` SQL SECURITY DEFINER VIEW `vista_detalle_ventas`  AS SELECT `v`.`fecha` AS `fecha`, `c`.`nombre` AS `cliente`, `p`.`nombre` AS `producto`, `dv`.`cantidad` AS `cantidad`, `dv`.`subtotal` AS `subtotal` FROM (((`DetalleVenta` `dv` join `Ventas` `v` on((`dv`.`venta_id` = `v`.`venta_id`))) join `Clientes` `c` on((`v`.`cliente_id` = `c`.`cliente_id`))) join `Productos` `p` on((`dv`.`producto_id` = `p`.`producto_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vista_total_ventas`
--
DROP TABLE IF EXISTS `vista_total_ventas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`172.%` SQL SECURITY DEFINER VIEW `vista_total_ventas`  AS SELECT sum(`Ventas`.`total`) AS `total_ventas` FROM `Ventas` WHERE (`Ventas`.`fecha` between (curdate() - interval 12 month) and curdate()) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `DetalleVenta`
--
ALTER TABLE `DetalleVenta`
  ADD CONSTRAINT `DetalleVenta_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `Ventas` (`venta_id`),
  ADD CONSTRAINT `DetalleVenta_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `Productos` (`producto_id`);

--
-- Constraints for table `Ventas`
--
ALTER TABLE `Ventas`
  ADD CONSTRAINT `Ventas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
