
CREATE DATABASE `delilah_resto`;

CREATE TABLE `order` (
  `quantity` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `productId` int(11) NOT NULL,
  `requestId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `order` (`quantity`, `createdAt`, `updatedAt`, `productId`, `requestId`) VALUES
(3, '2020-10-28 03:19:03', '2020-10-28 03:19:03', 1, 1),
(5, '2020-10-28 03:19:03', '2020-10-28 03:19:03', 1, 5),
(1, '2020-10-28 03:19:03', '2020-10-28 03:19:03', 2, 4),
(3, '2020-10-28 03:19:03', '2020-10-28 03:19:03', 3, 2),
(2, '2020-10-28 03:19:03', '2020-10-28 03:19:03', 5, 3);

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `price` varchar(20) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `type`, `price`, `image`) VALUES
(1, 'Pizza', 'Margarita', '1', '30', 'no disponible'),
(2, 'Pizza', 'Hawaina', '2', '20', 'no disponible'),
(3, 'Pizza', 'Napolitana', '3', '30', 'no disponible'),
(4, 'Pizza', 'Cuatro Quesos', '4', '35', 'no disponible'),
(5, 'Pizza', 'Romana', '5', '30', 'no disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `Payment_method` varchar(30) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `requests`
--

INSERT INTO `requests` (`id`, `status`, `Payment_method`, `createdAt`, `updatedAt`, `userId`) VALUES
(1, 'nuevo', 'Efectivo', '2020-10-28 00:50:48', '2020-10-28 01:38:03', 1),
(2, 'nuevo', 'Tarjeta de Credito', '2020-10-28 00:50:48', '2020-10-28 01:38:03', 1),
(3, 'nuevo', 'Efectivo', '2020-10-28 00:50:48', '2020-10-28 01:38:03', 1),
(4, 'nuevo', 'Tarjeta de Debito', '2020-10-28 00:50:48', '2020-10-28 01:38:03', 1),
(5, 'nuevo', 'Efectivo', '2020-10-28 00:50:48', '2020-10-28 01:38:03', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `phone`, `address`, `email`, `password`, `profile`) VALUES
(1, 'Fulano', 'Zutano', '3002552505', 'Cl 1 # 2 - 3, Medellin', 'fulano@correo.com', '$2a$10$CAaRPazBdzqwJ1fcXHnse.hgVbwVvrqvZrcZ.7lmWnFXg33vMerSG', 'Administrator'),
(3, 'Perencejo', 'Zutano', '3002552505', 'Cl 1 # 2 - 3, Medellin', 'perencejo@correo.com', '$2a$10$3T/c1T14qZoPMtXj7atp0u.86ylw9qNT4PSN49Bhx4h/CNtMfJlsC', 'User');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`productId`,`requestId`),
  ADD KEY `requestId` (`requestId`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--

ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`requestId`) REFERENCES `requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

