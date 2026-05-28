-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/05/2026 às 01:07
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mypc`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `fontes`
--

CREATE TABLE `fontes` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `potencia` int(11) NOT NULL,
  `descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fontes`
--

INSERT INTO `fontes` (`id`, `nome`, `foto`, `preco`, `marca`, `potencia`, `descricao`) VALUES
(1, 'Mancer Thunder 400W', 'img/fonte/Mancer Thunder 400W.webp', 180.00, 'Mancer', 400, 'Fonte básica com selo 80 Plus Bronze.'),
(2, 'Pichau Nidus 500W', 'img/fonte/Pichau Nidus 500W.webp', 250.00, 'Pichau', 500, 'Muito recomendada para setups de entrada.'),
(3, 'Corsair CV550 550W', 'img/fonte/Corsair CV550 550W.webp', 320.00, 'Corsair', 550, 'Confiabilidade e cabos pretos achatados.'),
(4, 'XPG Pylon 650W', 'img/fonte/XPG Pylon 650W.webp', 380.00, 'XPG', 650, 'Componentes internos de alta qualidade.'),
(5, 'MSI MAG A650BN 650W', 'img/fonte/MSI MAG A650BN 650W.webp', 350.00, 'MSI', 650, 'Ótima opção com circuito de proteção completo.'),
(6, 'Gamemax 600W', 'img/fonte/Gamemax 600W.webp', 280.00, 'Gamemax', 600, 'Fonte de baixo custo com PFC Ativo.'),
(7, 'Corsair CX650F RGB 650W', 'img/fonte/Corsair CX650F RGB 650W.webp', 550.00, 'Corsair', 650, 'Fonte totalmente modular e com iluminação RGB.'),
(8, 'XPG Core Reactor 750W', 'img/fonte/XPG Core Reactor 750W.webp', 650.00, 'XPG', 750, 'Certificação 80 Plus Gold e design modular.'),
(9, 'Super Flower LEADEX 750W', 'img/fonte/Super Flower LEADEX 750W.webp', 700.00, 'Super Flower', 750, 'Renomada em durabilidade de fontes.'),
(10, 'Corsair RM850x 850W', 'img/fonte/Corsair RM850x 850W.webp', 950.00, 'Corsair', 850, 'Operação silenciosa e alta eficiência Gold.'),
(11, 'XPG Core Reactor 850W', 'img/fonte/XPG Core Reactor 850W.webp', 750.00, 'XPG', 850, 'Perfeita para segurar RTX 4070 Ti e RX 7900.'),
(12, 'EVGA 600 W1 600W', 'img/fonte/EVGA 600 W1 600W.webp', 340.00, 'EVGA', 600, 'Fonte padrão 80 Plus White, robusta e simples.'),
(13, 'Cooler Master MWE 750W', 'img/fonte/Cooler Master MWE 750W.webp', 580.00, 'Cooler Master', 750, 'Bronze V2, cabos pretos e fan silenciosa.'),
(14, 'Asus ROG Thor 1000W', 'img/fonte/Asus ROG Thor 1000W.webp', 1800.00, 'Asus', 1000, 'Titanium com tela OLED mostrando consumo real.'),
(15, 'Corsair HX1200 1200W', 'img/fonte/Corsair HX1200 1200W.webp', 1600.00, 'Corsair', 1200, 'Força bruta para múltiplas GPUs ou overclocks.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `gabinetes`
--

CREATE TABLE `gabinetes` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `descricao` text NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `marca` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `gabinetes`
--

INSERT INTO `gabinetes` (`id`, `nome`, `foto`, `preco`, `descricao`, `tipo`, `marca`) VALUES
(2, 'Mancer Goblin', 'img/gabinete/Mancer Goblin.webp', 160.00, 'Gabinete compacto com lateral em vidro temperado.', 'Mid Tower', 'Mancer'),
(3, 'Pichau Apus', 'img/gabinete/Pichau Apus.webp', 180.00, 'Frente em mesh para excelente fluxo de ar.', 'Mid Tower', 'Pichau'),
(4, 'Montech X3 MESH', 'img/gabinete/Montech X3 MESH.webp', 250.00, 'Já vem com 6 fans RGB pré-instaladas de fábrica.', 'Mid Tower', 'Montech'),
(5, 'Galax Nebulosa', 'img/gabinete/Galax Nebulosa.webp', 220.00, 'Gabinete branco, elegante e muito compacto.', 'Mini ITX', 'Galax'),
(6, 'Corsair 4000D Airflow', 'img/gabinete/Corsair 4000D Airflow.webp', 650.00, 'Gerenciamento de cabos excelente e visual minimalista.', 'Mid Tower', 'Corsair'),
(7, 'NZXT H5 Flow', 'img/gabinete/NZXT H5 Flow.webp', 700.00, 'Fan inferior dedicada para resfriar a placa de vídeo.', 'Mid Tower', 'NZXT'),
(8, 'Lian Li Lancool 215', 'img/gabinete/Lian Li Lancool 215.webp', 550.00, 'Acompanha duas ventoinhas frontais de 200mm.', 'Mid Tower', 'Lian Li'),
(9, 'Cooler Master TD500', 'img/gabinete/Cooler Master TD500.webp', 600.00, 'Vidro lateral com design cristalino tridimensional.', 'Mid Tower', 'Cooler Master'),
(10, 'Aigo DarkFlash DLM21', 'img/gabinete/Aigo DarkFlash DLM21.webp', 280.00, 'Lateral de vidro articulada como uma porta.', 'Mini ITX', 'Aigo'),
(11, 'Redragon Superion', 'img/gabinete/Redragon Superion.webp', 210.00, 'Painel frontal em acrílico com iluminação destacada.', 'Mid Tower', 'Redragon'),
(12, 'NZXT H9 Flow', 'img/gabinete/NZXT H9 Flow.webp', 1200.00, 'Estilo aquário, visão panorâmica sem coluna no meio.', 'Full Tower', 'NZXT'),
(13, 'Hyte Y60', 'img/gabinete/Hyte Y60.webp', 1500.00, 'Vidro em três partes e design para GPU vertical.', 'Mid Tower', 'Hyte'),
(14, 'Corsair 5000D Airflow', 'img/gabinete/Corsair 5000D Airflow.webp', 1100.00, 'Espaço massivo para water coolers customizados.', 'Full Tower', 'Corsair'),
(15, 'Thermaltake Core P3', 'img/gabinete/Thermaltake Core P3.webp', 950.00, 'Gabinete aberto para montagem na parede.', 'Open Frame', 'Thermaltake'),
(16, 'Cougar MX330-G', 'img/gabinete/Cougar MX330-G.webp', 240.00, 'Design clássico, com baia externa para leitor DVD.', 'Mid Tower', 'Cougar');

-- --------------------------------------------------------

--
-- Estrutura para tabela `gpu`
--

CREATE TABLE `gpu` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `descricao` text NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `gpu`
--

INSERT INTO `gpu` (`id`, `nome`, `marca`, `foto`, `descricao`, `preco`) VALUES
(3, 'GeForce GTX 1650 4GB', 'NVIDIA', 'img/gpu/GeForce GTX 1650 4GB.webp', 'Placa de entrada, roda jogos leves em 1080p.', 850.00),
(4, 'GeForce RTX 3050 8GB', 'NVIDIA', 'img/gpu/GeForce RTX 3050 8GB.webp', 'Suporte a Ray Tracing e DLSS básico.', 1350.00),
(5, 'GeForce RTX 3060 12GB', 'NVIDIA', 'img/gpu/GeForce RTX 3060 12GB.webp', 'Excelente placa para 1080p no ultra.', 1700.00),
(6, 'GeForce RTX 4060 8GB', 'NVIDIA', 'img/gpu/GeForce RTX 4060 8GB.webp', 'Nova arquitetura com DLSS 3 e baixo consumo.', 1900.00),
(7, 'GeForce RTX 4060 Ti 8GB', 'NVIDIA', 'img/gpu/GeForce RTX 4060 Ti 8GB.webp', 'Performance sólida para 1080p e 1440p.', 2500.00),
(8, 'GeForce RTX 4070 12GB', 'NVIDIA', 'img/gpu/GeForce RTX 4070 12GB.webp', 'Placa perfeita para jogar em Quad HD (1440p).', 4000.00),
(9, 'GeForce RTX 4070 Ti SUPER', 'NVIDIA', 'img/gpu/GeForce RTX 4070 Ti SUPER.webp', 'Altíssimo desempenho e bastante VRAM.', 5500.00),
(10, 'GeForce RTX 4080 SUPER 16GB', 'NVIDIA', 'img/gpu/GeForce RTX 4080 SUPER 16GB.webp', 'Roda jogos em 4K com facilidade.', 7500.00),
(11, 'GeForce RTX 4090 24GB', 'NVIDIA', 'img/gpu/GeForce RTX 4090 24GB.webp', 'A placa de vídeo mais poderosa do mercado.', 12500.00),
(12, 'Radeon RX 6600 8GB', 'AMD', 'img/gpu/Radeon RX 6600 8GB.webp', 'Concorrente direta da RTX 3060, com ótimo preço.', 1300.00),
(13, 'Radeon RX 6700 XT 12GB', 'AMD', 'img/gpu/Radeon RX 6700 XT 12GB.webp', 'Excelente custo-benefício para Quad HD.', 2200.00),
(14, 'Radeon RX 7600 8GB', 'AMD', 'img/gpu/Radeon RX 7600 8GB.webp', 'Placa de nova geração ideal para 1080p.', 1750.00),
(15, 'Radeon RX 7700 XT 12GB', 'AMD', 'img/gpu/Radeon RX 7700 XT 12GB.webp', 'Alta taxa de quadros em resoluções mais altas.', 3100.00),
(16, 'Radeon RX 7800 XT 16GB', 'AMD', 'img/gpu/Radeon RX 7800 XT 16GB.webp', 'Supera a RTX 4070 em rasterização tradicional.', 3800.00),
(17, 'Radeon RX 7900 XTX 24GB', 'AMD', 'img/gpu/Radeon RX 7900 XTX 24GB.webp', 'O modelo topo de linha da AMD para 4K extremo.', 7200.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `placamae`
--

CREATE TABLE `placamae` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `soquete` varchar(20) NOT NULL,
  `ddr` varchar(10) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `descricao` text NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `placamae`
--

INSERT INTO `placamae` (`id`, `nome`, `soquete`, `ddr`, `foto`, `descricao`, `preco`) VALUES
(5, 'Gigabyte A320M-S2H', 'AM4', 'DDR4', 'img/placamae/Gigabyte A320M-S2H.webp', 'Placa-mãe básica para processadores Ryzen antigos.', 350.00),
(6, 'MSI B450M PRO-VDH MAX', 'AM4', 'DDR4', 'img/placamae/MSI B450M PRO-VDH MAX.webp', 'Suporta overclock moderado e possui bom VRM.', 480.00),
(7, 'Asus Prime A520M-E', 'AM4', 'DDR4', 'img/placamae/Asus Prime A520M-E.webp', 'Placa de entrada para Ryzen série 5000.', 450.00),
(8, 'Gigabyte B550M AORUS ELITE', 'AM4', 'DDR4', 'img/placamae/Gigabyte B550M AORUS ELITE.webp', 'Suporte a PCIe 4.0 e design robusto.', 850.00),
(9, 'Asus TUF Gaming X570-PLUS', 'AM4', 'DDR4', 'img/placamae/Asus TUF Gaming X570-PLUS.webp', 'Chipset topo de linha para AM4.', 1300.00),
(10, 'MSI PRO H410M-B', 'LGA1200', 'DDR4', 'img/placamae/MSI PRO H410M-B.webp', 'Básica para processadores Intel 10ª geração.', 380.00),
(11, 'Asus Prime H510M-E', 'LGA1200', 'DDR4', 'img/placamae/Asus Prime H510M-E.webp', 'Suporte básico para Intel 11ª geração.', 450.00),
(12, 'Gigabyte H610M H', 'LGA1700', 'DDR4', 'img/placamae/Gigabyte H610M H.webp', 'Entrada para processadores Intel 12ª e 13ª geração.', 500.00),
(13, 'Asus TUF Gaming B660M-PLUS', 'LGA1700', 'DDR4', 'img/placamae/Asus TUF Gaming B660M-PLUS.webp', 'Ótima refrigeração e componentes duráveis.', 1100.00),
(14, 'MSI PRO Z690-A', 'LGA1700', 'DDR4', 'img/placamae/MSI PRO Z690-A.webp', 'Permite overclock em processadores K da Intel.', 1400.00),
(15, 'Gigabyte B760M AORUS ELITE', 'LGA1700', 'DDR5', 'img/placamae/Gigabyte B760M AORUS ELITE.webp', 'Pronta para as novas memórias DDR5.', 1250.00),
(16, 'Asus ROG Strix Z790-F', 'LGA1700', 'DDR5', 'img/placamae/Asus ROG Strix Z790-F.webp', 'Placa premium para setups Intel topo de linha.', 2800.00),
(17, 'Gigabyte A620M H', 'AM5', 'DDR5', 'img/placamae/Gigabyte A620M HGigabyte A620M H.webp', 'Placa de entrada para a nova plataforma AMD.', 650.00),
(18, 'MSI MAG B650M MORTAR', 'AM5', 'DDR5', 'img/placamae/MSI MAG B650M MORTAR.webp', 'Intermediária premium com Wi-Fi embutido.', 1500.00),
(19, 'Asus ROG Crosshair X670E', 'AM5', 'DDR5', 'img/placamae/Asus ROG Crosshair X670E.webp', 'O máximo de recursos para a plataforma AM5.', 4500.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `processadores`
--

CREATE TABLE `processadores` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `soquete` varchar(10) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `descricao` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `processadores`
--

INSERT INTO `processadores` (`id`, `nome`, `marca`, `soquete`, `preco`, `foto`, `descricao`) VALUES
(15, 'AMD Ryzen 3 4100', 'AMD', 'AM4', 450.00, 'img/processador/AMD Ryzen 3 4100.webp', 'Processador de entrada com 4 núcleos e 8 threads.'),
(16, 'AMD Ryzen 5 4600G', 'AMD', 'AM4', 600.00, 'img/processador/AMD Ryzen 5 4600G.webp', 'Processador com vídeo integrado Radeon Graphics.'),
(17, 'AMD Ryzen 5 5600', 'AMD', 'AM4', 850.00, 'img/processador/AMD Ryzen 5 5600.webp', 'Excelente custo-benefício para jogos em 1080p.'),
(18, 'AMD Ryzen 7 5700X', 'AMD', 'AM4', 1200.00, 'img/processador/AMD Ryzen 7 5700X.webp', '8 núcleos e 16 threads, ideal para multitarefas.'),
(19, 'AMD Ryzen 7 5800X3D', 'AMD', 'AM4', 2100.00, 'img/processador/AMD Ryzen 7 5800X3D.webp', 'Tecnologia 3D V-Cache para máximo FPS em jogos.'),
(20, 'AMD Ryzen 5 7600', 'AMD', 'AM5', 1400.00, 'img/processador/AMD Ryzen 5 7600.webp', 'Nova geração AM5 com suporte a DDR5.'),
(21, 'AMD Ryzen 7 7700X', 'AMD', 'AM5', 2300.00, 'img/processador/AMD Ryzen 7 7700X.webp', 'Alta performance para setups entusiastas.'),
(22, 'Intel Core i3-10100F', 'Intel', 'LGA1200', 400.00, 'img/processador/Intel Core i3-10100F.webp', 'Processador básico, requer placa de vídeo.'),
(23, 'Intel Core i5-10400F', 'Intel', 'LGA1200', 600.00, 'img/processador/Intel Core i5-10400F.webp', 'Ótimo para setups de entrada e intermediários.'),
(24, 'Intel Core i5-12400F', 'Intel', 'LGA1700', 850.00, 'img/processador/Intel Core i5-12400F.webp', 'Arquitetura Alder Lake com excelente performance.'),
(25, 'Intel Core i7-12700K', 'Intel', 'LGA1700', 1900.00, 'img/processador/Intel Core i7-12700K.webp', 'Processador desbloqueado para overclock.'),
(26, 'Intel Core i5-13400F', 'Intel', 'Intel', 1300.00, 'img/processador/Intel Core i5-13400F.webp', '10 núcleos no total, ótimo equilíbrio térmico.'),
(27, 'Intel Core i7-13700K', 'Intel', 'LGA1700', 2600.00, 'img/processador/Intel Core i7-13700K.webp', 'Alta performance para renderização e games pesados.'),
(28, 'Intel Core i9-13900K', 'Intel', 'LGA1700', 3800.00, 'img/processador/Intel Core i9-13900K.webp', 'Topo de linha com 24 núcleos.'),
(29, 'Intel Core i5-14400F', 'Intel', 'LGA1700', 1450.00, 'img/processador/Intel Core i5-14400F.webp', 'Última geração para setups intermediários modernos.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ram`
--

CREATE TABLE `ram` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `ddr` varchar(10) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `descricao` text NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `capacidade` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `ram`
--

INSERT INTO `ram` (`id`, `nome`, `ddr`, `foto`, `descricao`, `preco`, `capacidade`) VALUES
(4, 'Kingston Fury Beast 8GB 3200MHz', 'DDR4', 'img/ram/Kingston Fury Beast 8GB 3200MHz.webp', 'Memória confiável com dissipador de calor.', 150.00, '8GB'),
(5, 'Kingston Fury Beast 16GB 3200MHz', 'DDR4', 'img/ram/Kingston Fury Beast 16GB 3200MHz.webp', 'Pente único de 16GB para expansão futura.', 280.00, '16GB'),
(6, 'Corsair Vengeance LPX 8GB 3200MHz', 'DDR4', 'img/ram/Corsair Vengeance LPX 8GB 3200MHz.webp', 'Perfil baixo, ideal para coolers a ar grandes.', 160.00, '8GB'),
(7, 'Corsair Vengeance LPX 16GB 3600MHz', 'DDR4', 'img/ram/Corsair Vengeance LPX 16GB 3600MHz.webp', 'Frequência mais alta para melhor desempenho.', 320.00, '16GB'),
(8, 'XPG Spectrix D41 8GB 3200MHz RGB', 'DDR4', 'img/ram/XPG Spectrix D41 8GB 3200MHz RGB.webp', 'Memória com iluminação RGB personalizável.', 180.00, '8GB'),
(9, 'XPG Spectrix D41 16GB 3200MHz RGB', 'DDR4', 'img/ram/XPG Spectrix D41 16GB 3200MHz RGB.webp', 'Kit estético e de boa performance.', 340.00, '16GB'),
(10, 'Geil Orion 8GB 3000MHz', 'DDR4', 'img/ram/Geil Orion 8GB 3000MHz.webp', 'Opção econômica e eficiente.', 130.00, '8GB'),
(11, 'Crucial Ballistix 16GB 3200MHz', 'DDR4', 'img/ram/Crucial Ballistix 16GB 3200MHz.webp', 'Chips de alta qualidade para estabilidade.', 310.00, '16GB'),
(12, 'Kingston Fury Beast 16GB 4800MHz', 'DDR5', 'img/ram/Kingston Fury Beast 16GB 4800MHz.webp', 'Nova geração de memórias ultrarrápidas.', 400.00, '16GB'),
(13, 'Kingston Fury Beast 32GB 5200MHz', 'DDR5', 'img/ram/Kingston Fury Beast 32GB 5200MHz.webp', 'Ideal para edição de vídeo e trabalho pesado.', 800.00, '32GB'),
(14, 'Corsair Vengeance 16GB 5600MHz', 'DDR5', 'img/ram/Corsair Vengeance 16GB 5600MHz.webp', 'Alta frequência para jogos competitivos.', 450.00, '16GB'),
(15, 'Corsair Vengeance 32GB 6000MHz', 'DDR5', 'img/ram/Corsair Vengeance 32GB 6000MHz.webp', 'O ponto ideal de performance para AM5 e LGA1700.', 950.00, '32GB'),
(16, 'XPG Lancer 16GB 5200MHz RGB', 'DDR5', 'img/ram/XPG Lancer 16GB 5200MHz RGB.webp', 'DDR5 com belo acabamento em RGB.', 480.00, '16GB'),
(17, 'XPG Lancer 32GB 6000MHz RGB', 'DDR5', 'img/ram/XPG Lancer 32GB 6000MHz RGB.webp', 'Kit premium para as plataformas mais modernas.', 1050.00, '32GB'),
(18, 'Team Group T-Force Delta 16GB', 'DDR5', 'img/ram/Team Group T-Force Delta 16GB.webp', 'Design agressivo e boa dissipação térmica.', 460.00, '16GB');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ssd`
--

CREATE TABLE `ssd` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `descricao` text NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `capacidade` varchar(10) NOT NULL,
  `tipo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `ssd`
--

INSERT INTO `ssd` (`id`, `nome`, `foto`, `descricao`, `preco`, `capacidade`, `tipo`) VALUES
(16, 'Kingston A400 240GB', 'img/ssd/Kingston A400 240GB.webp', 'Ideal para inicialização rápida do Windows.', 120.00, '240GB', 'SATA'),
(17, 'Kingston A400 480GB', 'img/ssd/Kingston A400 480GB.webp', 'Espaço suficiente para o sistema e alguns jogos.', 180.00, '480GB', 'SATA'),
(18, 'WD Green 240GB', 'img/ssd/WD Green 240GB.webp', 'SSD básico focado em baixo consumo de energia.', 130.00, '240GB', 'SATA'),
(19, 'WD Green 480GB', 'img/ssd/WD Green 480GB.webp', 'Confiabilidade Western Digital com preço acessível.', 190.00, '480GB', 'SATA'),
(20, 'Crucial BX500 500GB', 'img/ssd/Crucial BX500 500GB.webp', 'Boa velocidade de leitura e gravação SATA.', 210.00, '500GB', 'SATA'),
(21, 'Kingston NV2 250GB', 'img/ssd/Kingston NV2 250GB.webp', 'NVMe PCIe 4.0 de entrada.', 160.00, '250GB', 'NVMe'),
(22, 'Kingston NV2 500GB', 'img/ssd/Kingston NV2 500GB.webp', 'O melhor custo-benefício do mercado atual.', 230.00, '500GB', 'NVMe'),
(23, 'Kingston NV2 1TB', 'img/ssd/Kingston NV2 1TB.webp', 'Amplo espaço para biblioteca de jogos.', 380.00, '1TB', 'NVMe'),
(24, 'WD Blue SN570 500GB', 'img/ssd/WD Blue SN570 500GB.webp', 'Alta durabilidade e velocidades estáveis.', 260.00, '500GB', 'NVMe'),
(25, 'WD Blue SN570 1TB', 'img/ssd/WD Blue SN570 1TB.webp', 'Excelente para criadores de conteúdo e gamers.', 420.00, '1TB', 'NVMe'),
(26, 'WD Black SN850X 1TB', 'img/ssd/WD Black SN850X 1TB.webp', 'NVMe de altíssima performance para PCs Premium.', 700.00, '1TB', 'NVMe'),
(27, 'WD Black SN850X 2TB', 'img/ssd/WD Black SN850X 2TB.webp', 'Espaço massivo com velocidades de até 7300MB/s.', 1250.00, '2TB', 'NVMe'),
(28, 'Samsung 980 500GB', 'img/ssd/Samsung 980 500GB.webp', 'Qualidade premium e controle térmico eficiente.', 350.00, '500GB', 'NVMe'),
(29, 'Samsung 990 PRO 1TB', 'img/ssd/Samsung 990 PRO 1TB.webp', 'O ápice do desempenho para transferência de dados.', 850.00, '1TB', 'NVMe'),
(30, 'XPG Gammix S70 Blade 1TB', 'img/ssd/XPG Gammix S70 Blade 1TB.webp', 'Acompanha dissipador de calor, ideal para gamers.', 550.00, '1TB', 'NVMe');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `fontes`
--
ALTER TABLE `fontes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `gabinetes`
--
ALTER TABLE `gabinetes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `gpu`
--
ALTER TABLE `gpu`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `placamae`
--
ALTER TABLE `placamae`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `processadores`
--
ALTER TABLE `processadores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ram`
--
ALTER TABLE `ram`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ssd`
--
ALTER TABLE `ssd`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `fontes`
--
ALTER TABLE `fontes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `gabinetes`
--
ALTER TABLE `gabinetes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `gpu`
--
ALTER TABLE `gpu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `placamae`
--
ALTER TABLE `placamae`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `processadores`
--
ALTER TABLE `processadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de tabela `ram`
--
ALTER TABLE `ram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `ssd`
--
ALTER TABLE `ssd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
