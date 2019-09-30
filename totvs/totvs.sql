-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 30-Set-2019 às 15:29
-- Versão do servidor: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `totvs`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `uf` varchar(100) NOT NULL,
  `address` varchar(250) NOT NULL,
  `cep` int(11) NOT NULL,
  `country` varchar(100) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `client`
--

INSERT INTO `client` (`id`, `name`, `cnpj`, `uf`, `address`, `cep`, `country`, `comment`) VALUES
(1, 'Cliente teste', '28433934000217', 'Bahia', 'rua waldemar falção', 40285885, 'Brazil', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `price` float NOT NULL,
  `qtd` int(11) NOT NULL,
  `id_kit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `items`
--

INSERT INTO `items` (`id`, `name`, `price`, `qtd`, `id_kit`) VALUES
(1, 'Licença de Software Bemacash', 63, 1, 1),
(2, 'TABLET SAMSUNG GALAXY TAB E 9.6 SM-T560 199 100070', 63, 1, 1),
(3, 'SUPORTE METÁLICO TABLET BEMACASH 9.6 POLEGADAS 499 100720', 63, 1, 1),
(4, 'MP-4200 TH ETHERNET BR 10 1000680', 63, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `kit`
--

CREATE TABLE `kit` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `qtd` int(11) NOT NULL,
  `total_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `kit`
--

INSERT INTO `kit` (`id`, `name`, `qtd`, `total_price`) VALUES
(1, 'BEMACASH BAR E RESTAURANTE NFC-e + IMPRESSORA', 100, 251);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `date_sale` date NOT NULL,
  `total_price` float NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `reccreatedby` varchar(250) NOT NULL,
  `reccreatedon` date NOT NULL,
  `recmodifiedby` varchar(250) NOT NULL,
  `recmodifiedon` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sales`
--

INSERT INTO `sales` (`id`, `date_sale`, `total_price`, `id_user`, `id_client`, `status`, `reccreatedby`, `reccreatedon`, `recmodifiedby`, `recmodifiedon`) VALUES
(1, '2019-09-29', 251, 1, 1, 1, 'Vendedor 1', '2019-09-29', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sale_items`
--

CREATE TABLE `sale_items` (
  `id` int(11) NOT NULL,
  `id_sale` int(11) NOT NULL,
  `id_kit` int(11) NOT NULL,
  `qtd` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sale_items`
--

INSERT INTO `sale_items` (`id`, `id_sale`, `id_kit`, `qtd`, `sale_price`) VALUES
(1, 1, 1, 1, 251);

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_history`
--

CREATE TABLE `status_history` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `id_sale` int(11) NOT NULL,
  `data_set` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `status_history`
--

INSERT INTO `status_history` (`id`, `id_user`, `status`, `id_sale`, `data_set`) VALUES
(1, 1, 0, 1, '2019-09-29 13:00:00'),
(2, 1, 1, 1, '2019-09-30 13:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `name`) VALUES
(1, 'Vendedor 1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kit`
--
ALTER TABLE `kit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_history`
--
ALTER TABLE `status_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kit`
--
ALTER TABLE `kit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `status_history`
--
ALTER TABLE `status_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
