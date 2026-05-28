-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 28-Maio-2026 às 10:55
-- Versão do servidor: 8.0.45-0ubuntu0.22.04.1
-- versão do PHP: 8.1.2-1ubuntu2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `MyPC`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `Fontes`
--

CREATE TABLE `Fontes` (
  `id` int NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `foto` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `marca` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `portecia` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Gabinetes`
--

CREATE TABLE `Gabinetes` (
  `id` int NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `foto` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `descricao` text COLLATE utf8mb4_general_ci NOT NULL,
  `tipo` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `marca` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `GPU`
--

CREATE TABLE `GPU` (
  `id` int NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `marca` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `foto` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_general_ci NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `GPU`
--

INSERT INTO `GPU` (`id`, `nome`, `marca`, `foto`, `descricao`, `preco`) VALUES
(1, 'RTX 5060 ti', 'intel', 'img/gpu/Captura de tela de 2026-05-25 11-09-40.png', 'sim', '200.90');

-- --------------------------------------------------------

--
-- Estrutura da tabela `PlacaMae`
--

CREATE TABLE `PlacaMae` (
  `id` int NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `soquete` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `ddr` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `foto` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_general_ci NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `PlacaMae`
--

INSERT INTO `PlacaMae` (`id`, `nome`, `soquete`, `ddr`, `foto`, `descricao`, `preco`) VALUES
(1, 'ds', '32', '32', 'img/placamae/Captura de tela de 2026-05-25 11-09-40.png', '32', '32.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Processadores`
--

CREATE TABLE `Processadores` (
  `id` int NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `marca` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `soquete` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `foto` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `Processadores`
--

INSERT INTO `Processadores` (`id`, `nome`, `marca`, `soquete`, `preco`, `foto`, `descricao`) VALUES
(2, 'teste2', 'teste2', 'teste2', '13.43', '', 'texte'),
(3, 'teste67', 'teste3', 'teste3', '1323.43', '', 'texte');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Ram`
--

CREATE TABLE `Ram` (
  `id` int NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `ddr` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `foto` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_general_ci NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `capacidade` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Ssd`
--

CREATE TABLE `Ssd` (
  `id` int NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `foto` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_general_ci NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `capacidade` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tipo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `Fontes`
--
ALTER TABLE `Fontes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `Gabinetes`
--
ALTER TABLE `Gabinetes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `GPU`
--
ALTER TABLE `GPU`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `PlacaMae`
--
ALTER TABLE `PlacaMae`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `Processadores`
--
ALTER TABLE `Processadores`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `Ram`
--
ALTER TABLE `Ram`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `Ssd`
--
ALTER TABLE `Ssd`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Fontes`
--
ALTER TABLE `Fontes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Gabinetes`
--
ALTER TABLE `Gabinetes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `GPU`
--
ALTER TABLE `GPU`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `PlacaMae`
--
ALTER TABLE `PlacaMae`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `Processadores`
--
ALTER TABLE `Processadores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `Ram`
--
ALTER TABLE `Ram`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Ssd`
--
ALTER TABLE `Ssd`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
