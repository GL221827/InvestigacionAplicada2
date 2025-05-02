-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 02-05-2025 a las 20:03:46
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cuponera`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE IF NOT EXISTS `compras` (
  `id_Compra` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `oferta_id` int NOT NULL,
  `cantidad` int NOT NULL,
  `fecha_compra` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_Compra`),
  KEY `usuario_id` (`usuario_id`),
  KEY `oferta_id` (`oferta_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupones`
--

DROP TABLE IF EXISTS `cupones`;
CREATE TABLE IF NOT EXISTS `cupones` (
  `id_cupon` int NOT NULL AUTO_INCREMENT,
  `codigo_cupon` varchar(6) NOT NULL,
  `id_oferta` int NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha_generacion` datetime NOT NULL,
  `estado` enum('activo','canjeado','vencido') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'activo',
  PRIMARY KEY (`id_cupon`),
  UNIQUE KEY `codigo_cupon` (`codigo_cupon`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_oferta` (`id_oferta`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cupones`
--

INSERT INTO `cupones` (`id_cupon`, `codigo_cupon`, `id_oferta`, `id_usuario`, `fecha_generacion`, `estado`) VALUES
(1, 'AU741H', 3, 1, '2025-05-01 14:30:00', 'activo'),
(2, 'RTS10L', 5, 5, '2025-05-01 10:30:00', 'canjeado'),
(3, 'L4G41M', 2, 3, '2025-04-01 12:30:00', 'vencido'),
(4, 'DO147N', 4, 2, '2025-04-10 14:30:00', 'vencido'),
(5, '52A1DL', 5, 4, '2025-05-01 16:30:00', 'canjeado'),
(6, 'LO74G6', 9, 16, '2025-05-01 14:30:00', 'canjeado'),
(7, 'M014LH', 8, 19, '2025-05-01 10:30:00', 'activo'),
(8, '78MJ4F', 2, 20, '2025-04-01 12:30:00', 'vencido'),
(9, '96H1V2', 5, 60, '2025-04-10 14:30:00', 'vencido'),
(10, 'E4VH2', 7, 24, '2025-05-01 16:30:00', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

DROP TABLE IF EXISTS `empresas`;
CREATE TABLE IF NOT EXISTS `empresas` (
  `id_Empresa` int NOT NULL AUTO_INCREMENT,
  `codigo_empresa` varchar(6) NOT NULL,
  `nombre_empresa` varchar(255) NOT NULL,
  `direccion_empresa` varchar(200) NOT NULL,
  `nombre_contacto` varchar(255) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo_empresa` varchar(100) NOT NULL,
  `rubro` varchar(100) NOT NULL,
  `porcentaje_comision` decimal(5,2) NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id_Empresa`),
  UNIQUE KEY `codigo_empresa` (`codigo_empresa`),
  UNIQUE KEY `correo_empresa` (`correo_empresa`),
  KEY `usuario_id` (`usuario_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id_Empresa`, `codigo_empresa`, `nombre_empresa`, `direccion_empresa`, `nombre_contacto`, `telefono`, `correo_empresa`, `rubro`, `porcentaje_comision`, `usuario_id`) VALUES
(1, 'EMP001', 'Super Selectos', 'San Salvador, El Salvador', 'Julia Amaya', '2291-8542', 'superSel@gmail.com', 'Supermercado', 3.20, 1),
(2, 'EMP003', 'TacoBell', 'San Salvador, El Salvador', 'Luis Flores', '2225-9652', 'tacobell@gmail.com', 'Restaurante', 4.20, 10),
(3, 'EMP006', 'Walmart', 'San Salvador, El Salvador', 'Geissel Hernandez', '2278-5590', 'walmartsv@gmail.com', 'Supermercado', 5.23, 1),
(4, 'EMP007', 'Vidals', 'San Salvador, El Salvador', 'Valeria Leon', '2513-4501', 'vidals@gmail.com', 'Salon de Belleza', 2.60, 2),
(5, 'EMP008', 'Siman', 'La Libertad, El Salvador', 'Erick Chinchilla', '2233-8174', 'siman@gmail.com', 'Tienda de ropa', 3.80, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertas`
--

DROP TABLE IF EXISTS `ofertas`;
CREATE TABLE IF NOT EXISTS `ofertas` (
  `id_Ofertas` int NOT NULL AUTO_INCREMENT,
  `empresa_id` int NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `precio_regular` decimal(10,2) NOT NULL,
  `precio_oferta` decimal(10,2) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_limite_uso` date NOT NULL,
  `cantidad_limite` int DEFAULT NULL,
  `descripcion` text NOT NULL,
  `detalles` text,
  `estado` enum('En espera de aprobación','Oferta aprobada','Oferta rechazada','Oferta descartada') NOT NULL DEFAULT 'En espera de aprobación',
  `justificacion_rechazo` text,
  PRIMARY KEY (`id_Ofertas`),
  KEY `empresa_id` (`empresa_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ofertas`
--

INSERT INTO `ofertas` (`id_Ofertas`, `empresa_id`, `titulo`, `precio_regular`, `precio_oferta`, `fecha_inicio`, `fecha_fin`, `fecha_limite_uso`, `cantidad_limite`, `descripcion`, `detalles`, `estado`, `justificacion_rechazo`) VALUES
(1, 1, 'Vacaciones con tus mejores vinos', 15.50, 10.20, '2025-05-01', '2025-05-10', '2025-05-09', 85, 'Disfruta de tus vacaciones con nuestros mejores vinos en descuento, encontraras de todas las marcas y sabores.', 'Vinos selecionados, aplican restricciones', 'En espera de aprobación', NULL),
(3, 2, '2x1 en Burros', 9.99, 5.99, '2025-05-27', '2025-05-30', '2025-05-29', 200, 'Aprovecha esta oferta de 2x1 en burros de res, mixto, al pastor y de pollo.', 'Burros de tamaño regular, aplican restricciones', 'En espera de aprobación', NULL),
(4, 2, 'Tacomania', 5.99, 2.99, '2025-05-12', '2025-06-11', '2025-06-12', 200, 'Llego la Tacomania, aprovecha todos los tacos a 2.99.', 'Aplican en tacos de especialidad normal, aplican restricciones', 'En espera de aprobación', NULL),
(5, 3, 'Refrescante oferta', 3.50, 2.00, '2025-05-02', '2025-05-11', '2025-05-10', 200, 'Refrescate con nuestras bebidas PEPSI de 3L a un descuento.', 'PEPSI de 3L normal, aplican restricciones', 'En espera de aprobación', NULL),
(6, 3, 'Aceite Masola 3x2', 9.50, 4.00, '2025-05-10', '2025-05-20', '2025-05-19', 100, 'Aceite Masola de 500ml paga 2 y lleva 1 gratis.', 'Aplica al llevar 2 Aceites Masola de 500ml, aplican restricciones', 'En espera de aprobación', NULL),
(7, 4, 'Combo Completo', 24.99, 17.99, '2025-05-25', '2025-05-30', '2025-05-29', 400, 'Combo de Alisado + Uñas Gel + Pedicure + Depiladcion de Cejas.', 'Disponible por la compra de un tinte, aplican restricciones', 'En espera de aprobación', NULL),
(8, 5, 'Descuento en ropa de verano', 50.00, 25.00, '2025-05-01', '2025-05-31', '2025-05-30', 1000, 'Aprovecha el descuento del 50% en ropa de verano.', 'Aplican restricciones', 'En espera de aprobación', NULL),
(9, 5, 'Descuento en Accesorios de verano', 40.00, 20.00, '2025-05-01', '2025-05-31', '2025-05-30', 1000, 'Aprovecha el descuento del 50% en flotadores, lentes de sol y mas.', 'Aplican restricciones', 'En espera de aprobación', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

DROP TABLE IF EXISTS `pagos`;
CREATE TABLE IF NOT EXISTS `pagos` (
  `id_pagos_empresas` int NOT NULL AUTO_INCREMENT,
  `empresa_id` int NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_pago` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pagos_empresas`),
  KEY `empresa_id` (`empresa_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'api-token', 'eb651e834342ed5af1d5a929f8443422e7e7f8563ddb41f42390cd165f02c16b', '[\"*\"]', NULL, '2025-05-02 22:07:15', '2025-05-02 22:07:15'),
(2, 'App\\Models\\User', 1, 'api-token', 'c369bfe5572cfa9c81ae2055fbd76c777f76216f487bdf01755579b3df4aa93e', '[\"*\"]', '2025-05-02 22:12:41', '2025-05-02 22:08:10', '2025-05-02 22:12:41'),
(3, 'App\\Models\\User', 2, 'api-token', '04efa049d7fa827217e1418b9d69f9de1d6fe9b6d6a03b7f2b1ddf2fd8f0ee4c', '[\"*\"]', '2025-05-02 23:50:31', '2025-05-02 23:45:32', '2025-05-02 23:50:31'),
(4, 'App\\Models\\Usuario', 62, 'api-token', '9abab01808e8554c5e88f5a8838a566c41f4a19e1309c64831eda2f74a2a5100', '[\"*\"]', NULL, '2025-05-03 00:47:56', '2025-05-03 00:47:56'),
(5, 'App\\Models\\Usuario', 63, 'api-token', 'f5b7ca97c96fbc72f7392fde00afcb6531773846a624e954ff152b624dc6f0a5', '[\"*\"]', NULL, '2025-05-03 00:50:43', '2025-05-03 00:50:43'),
(6, 'App\\Models\\Usuario', 64, 'api-token', '5b11b968bb63f92828fba89a1727722e4719269d582aefb0468be37318583dc0', '[\"*\"]', NULL, '2025-05-03 00:56:09', '2025-05-03 00:56:09'),
(7, 'App\\Models\\Usuario', 64, 'api-token', 'c52c3c2e87f29c08949e0146ab9d4c6dad88d64327626a942fe8dfacee015890', '[\"*\"]', NULL, '2025-05-03 00:57:28', '2025-05-03 00:57:28'),
(9, 'App\\Models\\Usuario', 65, 'api-token', 'ce6fcd3cf9eb93a7115d0bfe76f8ac8da45cc9f04a14bab0e1c7099c0705f012', '[\"*\"]', NULL, '2025-05-03 01:55:04', '2025-05-03 01:55:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuarios`
--

DROP TABLE IF EXISTS `tipo_usuarios`;
CREATE TABLE IF NOT EXISTS `tipo_usuarios` (
  `id_tipo_usuario` int NOT NULL,
  `tipo_usuario` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tipo_usuarios`
--

INSERT INTO `tipo_usuarios` (`id_tipo_usuario`, `tipo_usuario`) VALUES
(1, 'ADMIN'),
(2, 'CLIENTE'),
(3, 'ADMIN_EMPRESA'),
(4, 'EMPLEADO_EMPRESA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Karen', 'karen12@gmail.com', NULL, '$2y$10$oM83xz1kYWe1gv0OiMnVbu3b1aaGf9JOOpgNt62xVFT7anXgXyKY.', NULL, '2025-05-02 21:56:55', '2025-05-02 21:56:55'),
(2, 'Valeria', 'valeria.gonzaleez1@gmail.com', NULL, '$2y$10$6G.u2YUOUF5jJkcOkL.1mOQ12WJwky69qRi1XOtj9od6pIbbwjJSO', NULL, '2025-05-02 23:44:38', '2025-05-02 23:44:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_Usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `DUI` varchar(15) NOT NULL,
  `contra` varchar(128) NOT NULL,
  `id_tipo_usuario` int NOT NULL,
  `codigo_verificacion` varchar(255) DEFAULT NULL,
  `verificado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_Usuario`),
  UNIQUE KEY `correo` (`correo`),
  KEY `id_tipo_usuario` (`id_tipo_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_Usuario`, `nombre`, `apellido`, `telefono`, `correo`, `direccion`, `DUI`, `contra`, `id_tipo_usuario`, `codigo_verificacion`, `verificado`) VALUES
(1, 'Juan', 'Pérez', '2291-5210', 'juan.perez@gmail.com', 'Santa Ana, El Salvador', '06648832-0', '349e4272dc8abd9757f8f4d688dea9f28f31ca086cc1c6eedb36da59a30ae16dac45de96026594ca882d087494719cb95bc9f013bf067e1ccf900f408ca84e35', 1, NULL, 0),
(2, 'Anna', 'Lopez', '7854-9632', 'annaL@gmail.com', 'San Jacinto, El Salvador', '78546632-5', '69fb3718a55199d6785d09304c0f8442552230f4e9d52b04e46cc62b6d6e877cdcff2f03a869e643b173839070511bc8b8ccabaec51631f27bebd8ba648dbd4f', 1, NULL, 0),
(3, 'Alfredo', 'Pacheco', '7047-9632', 'alfredPacheco@gmail.com', 'Soyapango, San Salvador', '52014496-0', '31bdf287baf1a0785194906f18877de3ef4c64c07ab6f08c592a6e4555e19ce7fc1457e514b50ed1ba4fc2e832d30c9985e54db2191fdcab5b9f4b69a2a7784d', 2, NULL, 0),
(4, 'Valentina', 'Gonzalez', '7558-4596', 'ValenG@email.com', 'Soyapango, San Salvador', '16649966-9', 'ValenSV', 3, NULL, 0),
(5, 'Karen', 'Menjivar', '7412-3584', 'karenMen@email.com', 'Ilopango, San Salvador', '78852149-3', 'karen000', 1, NULL, 0),
(16, 'Monica', 'Merino', '4596-3256', 'mmerino@email.com', 'Col.Escalon, San Salvador', '06689475-2', '3f4e3ad8ce3fb4ec02f37effc921e5f9a29c4cfce2f044d416ac36527340ff2262da76cb22f8492fd80264ebaecd5c3baf13827f10929f2a74348ec3e0c0860b', 4, NULL, 0),
(19, 'Camila', 'Bargas', '2291-5210', 'camiBargas@gmail.com', 'San Salvador, El Salvador', '0245879-3', 'f71bb2343b7c493d9c2bdb591db6134095647ad2c41f80c2987ec321237034272d932a0d7400bc9476a5088228a4a08e15b51b419f0004e27ba32c7d30b549ae', 1, NULL, 0),
(20, 'Brenda', 'Sarai', '4896-3260', 'brenGdz@gmail.com', 'San Salvador, El Salvador', '25410236-0', '167cc526eb86e4864bbbf5b6b6a11b52918d605c22118b33bdd3471e4c8f5f4a5b92f2835e2b04d3fa31b92a25242a1dd4782977fa7790ecfa95d97f247ee3c2', 1, NULL, 0),
(21, 'Antony', 'Lopez', '7896-5412', 'anntony.lopez1c@gmail.com', 'Santa Ana, El Salvador', '02589663-9', '85403db528ad3a6d2e265280d34200c614274268d667dc91e3feb5dd8025f54a86e0ded0cdca5f5d26389fc2bb65ccfb2c3fdb055b619615e68b8a44c1a55300', 1, NULL, 0),
(22, 'Alejandra', 'Rivas', '4875-6521', 'alejandraR@gmail.com', 'San Salvador, El Salvador', '58749963-5', 'efc6fa6cf620d5a88c384d45237bda5f569f564976cf6f728ebe92d532782eb2ad823c268b02fb55e0959e7fdc8cc86057cb6d853a9e48e88610edd090db9faa', 1, NULL, 0),
(23, 'Brandon', 'Menjivar', '5241-9685', 'brandon_menjivar@gmail.com', 'San Salvador, El Salvador', '85209630-9', 'f76da689f089113de3f88c91a75be343a1cfdb7e192a3d974b478e87412dd117c7edd3d5f356c6ed9110b5e3e3010755b75aaa8a8234a1a2a77ef3cd052a0871', 1, NULL, 0),
(24, 'Evangeline', 'Lara', '2291-5210', 'evangenlinelara@gmail.com', 'Santa Ana, El Salvador', '0245871149-3', '2c37b3f6c7075d435a4299f793c8a8c1c51183e4c5e759597fc621776bb319cb35e0ec67f54384273be6a633f64b374c17214304f770d57d265144b19f5ae016', 1, '743e3d77aabe7211e3785cb52a2e8072a970517dbac7e872805224f3c17770bb', 0),
(65, 'Valeria', 'Leon', '7589-6520', 'valerialeon@gmail.com', 'San Salvador', '06649966-2', '$2y$10$bbHOcZMdeDPiehJffOViyuluPLaTUVwpLmHPqJXfXlXE93VqwGhV6', 2, NULL, 0),
(62, 'Juan', 'Galdamez', '75841205', 'juan.galdamez@gmail.com', 'San Salvador', '06649966-5', '$2y$10$bDlP4Xg0Ae0ZJBc1Rpdy4.ILJ6a1/IYcOgdckSqBiT.F5NOgH5x2G', 2, NULL, 0),
(63, 'Estefany', 'Nunes', '7586-9632', 'steph@gmail.com', 'San Salvador', '02145962-5', '$2y$10$EHTAb1eePiGt2nQjf2QTeeTFkIYtbyt7yK3c2Oh7twbhxsCMk72Bq', 1, NULL, 0),
(64, 'Sofia', 'Alvarado', '2285-9652', 'sofalva@gmail.com', 'San Salvador', '06647788-3', '$2y$10$SC5TGvZJkZp7oz1bCwCvvuiKpb9NEjrG26gRbQ8m.SJjC5Kzz4zWW', 3, NULL, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
