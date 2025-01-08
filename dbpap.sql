-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Jan-2025 às 09:38
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbpap`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `exemplares`
--

CREATE TABLE `exemplares` (
  `id` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL,
  `localizacao` varchar(255) NOT NULL,
  `status` enum('disponivel','em_uso','danificado') DEFAULT 'disponivel'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `livros`
--

CREATE TABLE `livros` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `ano` year(4) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `disponibilidade` tinyint(1) DEFAULT 1,
  `localizacao` varchar(255) NOT NULL,
  `quantidade_total` int(11) DEFAULT 1,
  `quantidade_disponivel` int(11) DEFAULT 1,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `livros`
--

INSERT INTO `livros` (`id`, `titulo`, `autor`, `ano`, `isbn`, `disponibilidade`, `localizacao`, `quantidade_total`, `quantidade_disponivel`, `descricao`) VALUES
(1, 'Os Lusíadas', 'Camões', '0000', '2983746278472', 1, '5', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `nfc_cards`
--

CREATE TABLE `nfc_cards` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `codigo_nfc` varchar(255) NOT NULL,
  `data_associacao` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacoes`
--

CREATE TABLE `notificacoes` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `mensagem` text NOT NULL,
  `data_envio` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `registroacesso`
--

CREATE TABLE `registroacesso` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `data_entrada` datetime DEFAULT current_timestamp(),
  `data_saida` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `requisicoes`
--

CREATE TABLE `requisicoes` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL,
  `data_requisicao` date DEFAULT curdate(),
  `tipo_requisicao` enum('QR Code','ISBN') NOT NULL,
  `status` enum('pendente','atendido','cancelado','devolvido') DEFAULT 'pendente',
  `codigo_requisicao` varchar(50) DEFAULT NULL,
  `multa` decimal(5,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome_completo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `pin` varchar(6) DEFAULT NULL,
  `data_registro` date DEFAULT curdate(),
  `nfc_codigo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome_completo`, `email`, `senha`, `pin`, `data_registro`, `nfc_codigo`) VALUES
(1, 'lala', '', '$2y$10$zteP.IzELYK/wNvmtIczq.eny1reP4NMjrKD0PDFj7m605B./ja/u', NULL, '2024-12-18', '0000274671'),
(4, 'eqw', 'eqweqw@qwhbdbqwu', '$2y$10$UUR.xiqkqdGlHOEqrXEZceTg8xtHjSoasJso48IkZz6lEndAd9KmS', NULL, '2024-12-18', 'eqw'),
(5, 'Jacinto', 'jacintodabolachas@gmail.com', '$2y$10$noZuGU/omqkbWoowRU3rlOJ7M9.sLnonacfTUpcmye3kVPQOcY4iW', NULL, '2024-12-18', '0016420793'),
(6, 'tiaguin', 'roowguewhuewt@ewfbhufewi', '$2y$10$cryXT5e6dJfZAuHzFVGTJuh5piOGf1L8JgU2rzN5KsgrLd5GrjAnW', NULL, '2024-12-18', '0016432141'),
(7, 'Daniel Barbosa', 'lala@weewuih.com', '$2y$10$Nu36nvJLx.477jXe10cbVeBDkPgfvMKdxYiypS6/g.hqeFMf5h1Vq', NULL, '2024-12-18', '0000218095'),
(8, '3423423', 'root@wefds', '$2y$10$uNfd2LbKJFtPyLEflPz6VOTZW9CR3dr1xzjsoz87rmTEPEdG1gkla', NULL, '2024-12-19', '12345'),
(9, 'Daniel Barbosa', 'efwefew@uaqwijoqwa', '$2y$10$KVGA/eHreg17LoDZRypHYe96Xov9Urg6hI5noHTaOa.Kh6rTDW7R6', NULL, '2024-12-23', '0005486674'),
(11, 'QWEDQWDQD', '9OUIYGF@EUWISJ.COM', '$2y$10$YsqhyJY2UhuPb0QHEj8cBOSTEYULdN8E3vdDcx52nCEE5S.K/6zDO', NULL, '2024-12-23', '1234567');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `exemplares`
--
ALTER TABLE `exemplares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_livro` (`id_livro`);

--
-- Índices para tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `isbn` (`isbn`);

--
-- Índices para tabela `nfc_cards`
--
ALTER TABLE `nfc_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_nfc` (`codigo_nfc`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices para tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices para tabela `registroacesso`
--
ALTER TABLE `registroacesso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices para tabela `requisicoes`
--
ALTER TABLE `requisicoes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_requisicao` (`codigo_requisicao`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_livro` (`id_livro`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `pin` (`pin`),
  ADD UNIQUE KEY `nfc_codigo` (`nfc_codigo`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `exemplares`
--
ALTER TABLE `exemplares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4234236;

--
-- AUTO_INCREMENT de tabela `nfc_cards`
--
ALTER TABLE `nfc_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `registroacesso`
--
ALTER TABLE `registroacesso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `requisicoes`
--
ALTER TABLE `requisicoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `exemplares`
--
ALTER TABLE `exemplares`
  ADD CONSTRAINT `exemplares_ibfk_1` FOREIGN KEY (`id_livro`) REFERENCES `livros` (`id`);

--
-- Limitadores para a tabela `nfc_cards`
--
ALTER TABLE `nfc_cards`
  ADD CONSTRAINT `nfc_cards_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD CONSTRAINT `notificacoes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `registroacesso`
--
ALTER TABLE `registroacesso`
  ADD CONSTRAINT `registroacesso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `requisicoes`
--
ALTER TABLE `requisicoes`
  ADD CONSTRAINT `requisicoes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `requisicoes_ibfk_2` FOREIGN KEY (`id_livro`) REFERENCES `livros` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
